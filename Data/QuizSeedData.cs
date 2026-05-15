using HalkEgitimSistemi.Models;
using System.Collections.Generic;

namespace HalkEgitimSistemi.Data
{
    public static class QuizSeedData
    {
        public static List<QuizQuestion> GetQuestions()
        {
            var questions = new List<QuizQuestion>();

            // Bilişim Teknolojileri (Genişletilmiş)
            questions.AddRange(new List<QuizQuestion> {
                new QuizQuestion { QuestionText = "Bilgisayarda verilerin kalıcı olarak saklandığı birim hangisidir?", OptionA = "RAM", OptionB = "Sabit Disk (HDD/SSD)", OptionC = "İşlemci", OptionD = "Ekran Kartı", CorrectAnswer = "B", Category = "Bilişim Teknolojileri", Difficulty = 1 },
                new QuizQuestion { QuestionText = "Hangisi bir giriş birimidir?", OptionA = "Monitör", OptionB = "Yazıcı", OptionC = "Klavye", OptionD = "Hoparlör", CorrectAnswer = "C", Category = "Bilişim Teknolojileri", Difficulty = 1 },
                new QuizQuestion { QuestionText = "Bir bilgisayar ağında IP adresi ne işe yarar?", OptionA = "Bilgisayarın markasını belirtir", OptionB = "Ağdaki cihazın adresini tanımlar", OptionC = "İnternet hızını artırır", OptionD = "Virüsleri temizler", CorrectAnswer = "B", Category = "Bilişim Teknolojileri", Difficulty = 2 },
                new QuizQuestion { QuestionText = "CPU'nun açılımı nedir?", OptionA = "Central Processing Unit", OptionB = "Computer Personal Unit", OptionC = "Control Power Unit", OptionD = "Core Process Union", CorrectAnswer = "A", Category = "Bilişim Teknolojileri", Difficulty = 1 },
                new QuizQuestion { QuestionText = "Hangisi bir işletim sistemi değildir?", OptionA = "Windows", OptionB = "Linux", OptionC = "macOS", OptionD = "Microsoft Office", CorrectAnswer = "D", Category = "Bilişim Teknolojileri", Difficulty = 1 },
                new QuizQuestion { QuestionText = "USB'nin açılımı nedir?", OptionA = "Universal Serial Bus", OptionB = "United System Board", OptionC = "User Secure Backup", OptionD = "Unit Software Base", CorrectAnswer = "A", Category = "Bilişim Teknolojileri", Difficulty = 2 },
                new QuizQuestion { QuestionText = "BIOS nerede saklanır?", OptionA = "Harddisk", OptionB = "RAM", OptionC = "ROM (Anakart üzerinde)", OptionD = "İşlemci", CorrectAnswer = "C", Category = "Bilişim Teknolojileri", Difficulty = 3 },
                new QuizQuestion { QuestionText = "Hangisi bir görüntü kablosu türüdür?", OptionA = "SATA", OptionB = "HDMI", OptionC = "PCIe", OptionD = "DDR4", CorrectAnswer = "B", Category = "Bilişim Teknolojileri", Difficulty = 1 },
                new QuizQuestion { QuestionText = "Bir Byte kaç bitten oluşur?", OptionA = "4", OptionB = "8", OptionC = "16", OptionD = "32", CorrectAnswer = "B", Category = "Bilişim Teknolojileri", Difficulty = 1 },
                new QuizQuestion { QuestionText = "Wi-Fi teknolojisinin temel standardı hangisidir?", OptionA = "IEEE 802.11", OptionB = "HTTP", OptionC = "TCP/IP", OptionD = "FTP", CorrectAnswer = "A", Category = "Bilişim Teknolojileri", Difficulty = 3 },
            });

            // Yazılım Geliştirme (Genişletilmiş)
            questions.AddRange(new List<QuizQuestion> {
                new QuizQuestion { QuestionText = "C# dilinde değişken tanımlarken hangisi yanlıştır?", OptionA = "int sayi = 5;", OptionB = "string metin = 'merhaba';", OptionC = "double d = 3.14;", OptionD = "bool kontrol = true;", CorrectAnswer = "B", Category = "Yazılım Geliştirme", Difficulty = 2 },
                new QuizQuestion { QuestionText = "HTML'de bir link oluşturmak için hangi etiket kullanılır?", OptionA = "<link>", OptionB = "<a>", OptionC = "<href>", OptionD = "<url>", CorrectAnswer = "B", Category = "Yazılım Geliştirme", Difficulty = 1 },
                new QuizQuestion { QuestionText = "JavaScript'te bir değişkeni 'sabit' olarak tanımlamak için hangi anahtar kelime kullanılır?", OptionA = "var", OptionB = "let", OptionC = "const", OptionD = "static", CorrectAnswer = "C", Category = "Yazılım Geliştirme", Difficulty = 2 },
                new QuizQuestion { QuestionText = "SQL'de veritabanından veri çekmek için kullanılan komut hangisidir?", OptionA = "UPDATE", OptionB = "DELETE", OptionC = "INSERT", OptionD = "SELECT", CorrectAnswer = "D", Category = "Yazılım Geliştirme", Difficulty = 1 },
                new QuizQuestion { QuestionText = "CSS'te bir elementin arka plan rengini değiştirmek için hangi özellik kullanılır?", OptionA = "color", OptionB = "bg-color", OptionC = "background-color", OptionD = "font-color", CorrectAnswer = "C", Category = "Yazılım Geliştirme", Difficulty = 1 },
                new QuizQuestion { QuestionText = "Hangisi bir 'Back-end' programlama dili değildir?", OptionA = "Node.js", OptionB = "PHP", OptionC = "Python", OptionD = "CSS", CorrectAnswer = "D", Category = "Yazılım Geliştirme", Difficulty = 1 },
                new QuizQuestion { QuestionText = "Git nedir?", OptionA = "Veritabanı sistemi", OptionB = "Versiyon kontrol sistemi", OptionC = "Sunucu yazılımı", OptionD = "Programlama kütüphanesi", CorrectAnswer = "B", Category = "Yazılım Geliştirme", Difficulty = 2 },
                new QuizQuestion { QuestionText = "JSON formatı ne amaçla kullanılır?", OptionA = "Görüntü sıkıştırma", OptionB = "Veri takası", OptionC = "Stil verme", OptionD = "Donanım sürücüsü", CorrectAnswer = "B", Category = "Yazılım Geliştirme", Difficulty = 2 },
            });

            // Genel Kültür (Genişletilmiş)
            questions.AddRange(new List<QuizQuestion> {
                new QuizQuestion { QuestionText = "Dünyanın en yüksek dağı hangisidir?", OptionA = "Ağrı Dağı", OptionB = "Everest", OptionC = "Alpler", OptionD = "Erciyes", CorrectAnswer = "B", Category = "Genel Kültür", Difficulty = 1 },
                new QuizQuestion { QuestionText = "Türkiye'nin başkenti neresidir?", OptionA = "İstanbul", OptionB = "İzmir", OptionC = "Ankara", OptionD = "Bursa", CorrectAnswer = "C", Category = "Genel Kültür", Difficulty = 1 },
                new QuizQuestion { QuestionText = "Cumhuriyet ne zaman ilan edilmiştir?", OptionA = "1920", OptionB = "1923", OptionC = "1919", OptionD = "1938", CorrectAnswer = "B", Category = "Genel Kültür", Difficulty = 1 },
                new QuizQuestion { QuestionText = "İstiklal Marşı'nın yazarı kimdir?", OptionA = "Ziya Gökalp", OptionB = "Namık Kemal", OptionC = "Mehmet Akif Ersoy", OptionD = "Yahya Kemal", CorrectAnswer = "C", Category = "Genel Kültür", Difficulty = 1 },
                new QuizQuestion { QuestionText = "Dünyanın en büyük okyanusu hangisidir?", OptionA = "Atlas Okyanusu", OptionB = "Hint Okyanusu", OptionC = "Büyük Okyanus (Pasifik)", OptionD = "Arktik Okyanusu", CorrectAnswer = "C", Category = "Genel Kültür", Difficulty = 2 },
                new QuizQuestion { QuestionText = "Hangi gezegen 'Kızıl Gezegen' olarak bilinir?", OptionA = "Venüs", OptionB = "Mars", OptionC = "Jüpiter", OptionD = "Satürn", CorrectAnswer = "B", Category = "Genel Kültür", Difficulty = 1 },
                new QuizQuestion { QuestionText = "Hangisi bir yenilenebilir enerji kaynağıdır?", OptionA = "Kömür", OptionB = "Petrol", OptionC = "Güneş", OptionD = "Doğalgaz", CorrectAnswer = "C", Category = "Genel Kültür", Difficulty = 1 }
            });

            return questions;
        }
    }
}
