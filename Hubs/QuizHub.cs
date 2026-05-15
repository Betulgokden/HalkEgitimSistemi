using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HalkEgitimSistemi.Hubs
{
    public class QuizHub : Hub
    {
        // Waiting queue for players per category
        private static ConcurrentDictionary<string, string> _waitingPlayers = new ConcurrentDictionary<string, string>();
        // Active matches: MatchId -> MatchInfo
        private static ConcurrentDictionary<string, QuizMatchInfo> _activeMatches = new ConcurrentDictionary<string, QuizMatchInfo>();

        public async Task JoinQueue(string category)
        {
            var userId = Context.ConnectionId;
            var userName = Context.User?.Identity?.Name ?? "Misafir";

            if (_waitingPlayers.TryRemove(category, out var opponentId))
            {
                // Found an opponent! Start match
                var matchId = Guid.NewGuid().ToString();
                var matchInfo = new QuizMatchInfo
                {
                    MatchId = matchId,
                    Player1Id = userId,
                    Player1Name = userName,
                    Player2Id = opponentId,
                    Player2Name = "Rakip", // Ideally get name from SignalR identity
                    Category = category,
                    CurrentQuestionIndex = 0,
                    StartTime = DateTime.Now
                };

                _activeMatches[matchId] = matchInfo;

                await Groups.AddToGroupAsync(userId, matchId);
                await Groups.AddToGroupAsync(opponentId, matchId);

                await Clients.Group(matchId).SendAsync("MatchFound", matchId, matchInfo.Player1Name, matchInfo.Player2Name);
            }
            else
            {
                // Wait for opponent
                _waitingPlayers[category] = userId;
                await Clients.Caller.SendAsync("WaitingForOpponent");
            }
        }

        public async Task SubmitAnswer(string matchId, string answer, int questionIndex)
        {
            if (_activeMatches.TryGetValue(matchId, out var match))
            {
                if (match.CurrentQuestionIndex == questionIndex && !match.IsQuestionAnswered)
                {
                    match.IsQuestionAnswered = true;
                    var winnerId = Context.ConnectionId;
                    var winnerName = winnerId == match.Player1Id ? match.Player1Name : match.Player2Name;

                    await Clients.Group(matchId).SendAsync("QuestionResult", winnerId, winnerName, answer);
                    
                    // Prepare next question after delay
                    match.CurrentQuestionIndex++;
                    match.IsQuestionAnswered = false;
                }
            }
        }

        public override async Task OnDisconnectedAsync(Exception? exception)
        {
            // Remove from waiting queue
            var player = _waitingPlayers.FirstOrDefault(x => x.Value == Context.ConnectionId);
            if (player.Key != null) _waitingPlayers.TryRemove(player.Key, out _);

            await base.OnDisconnectedAsync(exception);
        }
    }

    public class QuizMatchInfo
    {
        public string MatchId { get; set; } = string.Empty;
        public string Player1Id { get; set; } = string.Empty;
        public string Player1Name { get; set; } = string.Empty;
        public string Player2Id { get; set; } = string.Empty;
        public string Player2Name { get; set; } = string.Empty;
        public string Category { get; set; } = string.Empty;
        public int CurrentQuestionIndex { get; set; }
        public bool IsQuestionAnswered { get; set; }
        public DateTime StartTime { get; set; }
    }
}
