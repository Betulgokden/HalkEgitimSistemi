using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace HalkEgitimSistemi.Migrations
{
    /// <inheritdoc />
    public partial class FixGamificationAndQuiz : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Instructors_CourseId",
                table: "Instructors");

            migrationBuilder.AddColumn<int>(
                name: "EloRating",
                table: "Students",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "Points",
                table: "Students",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "TotalMatches",
                table: "Students",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "Wins",
                table: "Students",
                type: "int",
                nullable: false,
                defaultValue: 0);


            migrationBuilder.CreateTable(
                name: "AcademicNotes",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Content = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PdfUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CourseId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    InstructorName = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AcademicNotes", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AcademicNotes_Courses_CourseId",
                        column: x => x.CourseId,
                        principalTable: "Courses",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AcademicTests",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TestTitle = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CourseId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AcademicTests", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AcademicTests_Courses_CourseId",
                        column: x => x.CourseId,
                        principalTable: "Courses",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "QuizMatches",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    StudentId = table.Column<int>(type: "int", nullable: false),
                    Score = table.Column<int>(type: "int", nullable: false),
                    CorrectAnswers = table.Column<int>(type: "int", nullable: false),
                    WrongAnswers = table.Column<int>(type: "int", nullable: false),
                    MatchDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    AiFeedback = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    WeakAreas = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsFreeCourseAwarded = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_QuizMatches", x => x.Id);
                    table.ForeignKey(
                        name: "FK_QuizMatches_Students_StudentId",
                        column: x => x.StudentId,
                        principalTable: "Students",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "QuizQuestions",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    QuestionText = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    OptionA = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    OptionB = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    OptionC = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    OptionD = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CorrectAnswer = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Difficulty = table.Column<int>(type: "int", nullable: false),
                    Category = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_QuizQuestions", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AcademicQuestions",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    AcademicTestId = table.Column<int>(type: "int", nullable: false),
                    QuestionText = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    OptionA = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    OptionB = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    OptionC = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    OptionD = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CorrectAnswer = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AcademicQuestions", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AcademicQuestions_AcademicTests_AcademicTestId",
                        column: x => x.AcademicTestId,
                        principalTable: "AcademicTests",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });


            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 1, 28, 4, 697, DateTimeKind.Local).AddTicks(9187));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 1, 28, 4, 698, DateTimeKind.Local).AddTicks(1256));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 1, 28, 4, 698, DateTimeKind.Local).AddTicks(1260));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 1, 28, 4, 698, DateTimeKind.Local).AddTicks(1264));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 1, 28, 4, 698, DateTimeKind.Local).AddTicks(1267));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 1, 28, 4, 698, DateTimeKind.Local).AddTicks(1269));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 1, 28, 4, 699, DateTimeKind.Local).AddTicks(7646));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 1, 28, 4, 699, DateTimeKind.Local).AddTicks(7861));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 1, 28, 4, 697, DateTimeKind.Local).AddTicks(5232));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 1, 28, 4, 697, DateTimeKind.Local).AddTicks(6291));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 1, 28, 4, 697, DateTimeKind.Local).AddTicks(6295));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 1, 28, 4, 697, DateTimeKind.Local).AddTicks(6328));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 1, 28, 4, 697, DateTimeKind.Local).AddTicks(6330));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 1, 28, 4, 697, DateTimeKind.Local).AddTicks(6332));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 1, 28, 4, 697, DateTimeKind.Local).AddTicks(6334));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 1, 28, 4, 697, DateTimeKind.Local).AddTicks(6336));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 1, 28, 4, 697, DateTimeKind.Local).AddTicks(6337));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 1, 28, 4, 697, DateTimeKind.Local).AddTicks(6339));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 1, 28, 4, 697, DateTimeKind.Local).AddTicks(6340));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 1, 28, 4, 697, DateTimeKind.Local).AddTicks(6342));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 4, 30, 1, 28, 4, 699, DateTimeKind.Local).AddTicks(9455));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 5, 1, 28, 4, 699, DateTimeKind.Local).AddTicks(9863));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 8, 1, 28, 4, 699, DateTimeKind.Local).AddTicks(9867));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 5, 1, 28, 4, 699, DateTimeKind.Local).AddTicks(5876));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 6, 1, 28, 4, 699, DateTimeKind.Local).AddTicks(6162));

            migrationBuilder.InsertData(
                table: "QuizQuestions",
                columns: new[] { "Id", "Category", "CorrectAnswer", "CreatedAt", "Difficulty", "OptionA", "OptionB", "OptionC", "OptionD", "QuestionText" },
                values: new object[,]
                {
                    { 1, "Yazılım", "C", new DateTime(2026, 5, 10, 1, 28, 4, 700, DateTimeKind.Local).AddTicks(560), 1, "add()", "insert()", "append()", "push()", "Python'da liste sonuna eleman eklemek için hangi metod kullanılır?" },
                    { 2, "Ağ Teknolojileri", "C", new DateTime(2026, 5, 10, 1, 28, 4, 700, DateTimeKind.Local).AddTicks(2367), 1, "Star", "Bus", "Moon", "Ring", "Aşağıdakilerden hangisi bir ağ topolojisi değildir?" },
                    { 3, "El Sanatları", "A", new DateTime(2026, 5, 10, 1, 28, 4, 700, DateTimeKind.Local).AddTicks(2371), 2, "Kitre", "Nişasta", "Tutkal", "Şeker", "Geleneksel Ebru sanatında suyun kıvamını artırmak için ne kullanılır?" },
                    { 4, "Yazılım", "B", new DateTime(2026, 5, 10, 1, 28, 4, 700, DateTimeKind.Local).AddTicks(2374), 1, "Biyoloji", "Bilgisayar Bilimi", "Sosyoloji", "Fizik", "Yapay zekada 'Makine Öğrenmesi' hangi ana dalın altındadır?" },
                    { 5, "Ağ Teknolojileri", "C", new DateTime(2026, 5, 10, 1, 28, 4, 700, DateTimeKind.Local).AddTicks(2376), 2, "Ana Sunucu", "Dış Ağ", "Lokal Geri Döngü (Loopback)", "Varsayılan Ağ Geçidi", "Bir IP adresindeki 127.0.0.1 neyi temsil eder?" }
                });

            migrationBuilder.UpdateData(
                table: "Students",
                keyColumn: "Id",
                keyValue: 99,
                columns: new[] { "EloRating", "Points", "TotalMatches", "Wins" },
                values: new object[] { 1000, 0, 0, 0 });

            migrationBuilder.CreateIndex(
                name: "IX_Instructors_CourseId",
                table: "Instructors",
                column: "CourseId",
                unique: true,
                filter: "[CourseId] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_AcademicNotes_CourseId",
                table: "AcademicNotes",
                column: "CourseId");

            migrationBuilder.CreateIndex(
                name: "IX_AcademicQuestions_AcademicTestId",
                table: "AcademicQuestions",
                column: "AcademicTestId");

            migrationBuilder.CreateIndex(
                name: "IX_AcademicTests_CourseId",
                table: "AcademicTests",
                column: "CourseId");

            migrationBuilder.CreateIndex(
                name: "IX_QuizMatches_StudentId",
                table: "QuizMatches",
                column: "StudentId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AcademicNotes");

            migrationBuilder.DropTable(
                name: "AcademicQuestions");

            migrationBuilder.DropTable(
                name: "QuizMatches");

            migrationBuilder.DropTable(
                name: "QuizQuestions");

            migrationBuilder.DropTable(
                name: "AcademicTests");

            migrationBuilder.DropIndex(
                name: "IX_Instructors_CourseId",
                table: "Instructors");

            migrationBuilder.DropColumn(
                name: "EloRating",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "Points",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "TotalMatches",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "Wins",
                table: "Students");


            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(5255));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(7203));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(7208));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(7212));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(7241));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(7244));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 6, 13, 58, 19, 553, DateTimeKind.Local).AddTicks(9718));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 8, 13, 58, 19, 554, DateTimeKind.Local).AddTicks(687));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(1361));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(2360));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(2364));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(2366));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(2368));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(2370));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(2371));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(2373));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(2379));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(2381));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(2383));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(2384));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 4, 29, 13, 58, 19, 554, DateTimeKind.Local).AddTicks(7970));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 4, 13, 58, 19, 554, DateTimeKind.Local).AddTicks(9343));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 13, 58, 19, 554, DateTimeKind.Local).AddTicks(9352));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 4, 13, 58, 19, 552, DateTimeKind.Local).AddTicks(8011));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 5, 13, 58, 19, 552, DateTimeKind.Local).AddTicks(9521));

            migrationBuilder.CreateIndex(
                name: "IX_Instructors_CourseId",
                table: "Instructors",
                column: "CourseId");
        }
    }
}
