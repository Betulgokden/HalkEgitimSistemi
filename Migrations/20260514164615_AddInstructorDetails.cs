using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace HalkEgitimSistemi.Migrations
{
    /// <inheritdoc />
    public partial class AddInstructorDetails : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            /*
            migrationBuilder.AddColumn<string>(
                name: "GithubUrl",
                table: "Students",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "LinkedInUrl",
                table: "Students",
                type: "nvarchar(max)",
                nullable: true);
            */

            migrationBuilder.AlterColumn<string>(
                name: "FullName",
                table: "Instructors",
                type: "nvarchar(450)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            /*
            migrationBuilder.AddColumn<string>(
                name: "Bio",
                table: "Instructors",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "DribbbleUrl",
                table: "Instructors",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Education",
                table: "Instructors",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "LinkedInUrl",
                table: "Instructors",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PortfolioUrl",
                table: "Instructors",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Skills",
                table: "Instructors",
                type: "nvarchar(max)",
                nullable: true);
            */

            migrationBuilder.AlterColumn<string>(
                name: "CourseName",
                table: "Courses",
                type: "nvarchar(450)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<string>(
                name: "Email",
                table: "Applications",
                type: "nvarchar(450)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            /*
            migrationBuilder.AddColumn<string>(
                name: "PaymentType",
                table: "Applications",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "UsedHalkPointCode",
                table: "Applications",
                type: "nvarchar(max)",
                nullable: true);
            */

            migrationBuilder.CreateTable(
                name: "HalkPointActivities",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    ActivityType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PointAmount = table.Column<int>(type: "int", nullable: false),
                    Date = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_HalkPointActivities", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "HalkPointCodes",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    CourseId = table.Column<int>(type: "int", nullable: false),
                    GeneratedCode = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsUsed = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_HalkPointCodes", x => x.Id);
                });

            /*
            migrationBuilder.CreateTable(
                name: "PromoCodes",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Code = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CourseId = table.Column<int>(type: "int", nullable: false),
                    StudentId = table.Column<int>(type: "int", nullable: false),
                    IsUsed = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UsedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    PointCost = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PromoCodes", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PromoCodes_Courses_CourseId",
                        column: x => x.CourseId,
                        principalTable: "Courses",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PromoCodes_Students_StudentId",
                        column: x => x.StudentId,
                        principalTable: "Students",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });
            */

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 1,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1526379095098-d400fd0bf935?w=600&fm=webp&fm=webp");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 2,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1547658719-da2b51169166?w=600&fm=webp&fm=webp");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 3,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=600&fm=webp&fm=webp");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 4,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1543109740-4bdb38fda756?w=600&fm=webp");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 5,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1527866959252-deab85ef7d1b?w=600&fm=webp");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 6,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1513364776144-60967b0f800f?w=600&fm=webp");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 7,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1565193566173-7a0ee3dbe261?w=600&fm=webp");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 8,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1510915361894-db8b60106cb1?w=600&fm=webp");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 9,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1507838153414-b4b713384a76?w=600&fm=webp");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 10,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=600&fm=webp");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 11,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=600&fm=webp");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 12,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=600&fm=webp");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 13,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1560750588-73207b1ef5b8?w=600&fm=webp");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 14,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?w=600&fm=webp");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 15,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1559136555-9303baea8ebd?w=600&fm=webp");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 16,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=600&fm=webp");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 17,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1587334206571-3390ccc205df?w=600&fm=webp");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 18,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1592419044706-39796d40f98c?w=600&fm=webp");

            migrationBuilder.InsertData(
                table: "Courses",
                columns: new[] { "Id", "CategoryId", "CourseName", "Curriculum", "DeletedAt", "DeletedBy", "Description", "DurationHours", "EndDate", "EndTime", "ExamDate", "ImageUrl", "IsActive", "IsDeleted", "IsLive", "LearningOutcomes", "LiveRoomId", "MaxAbsenceLimit", "Price", "Quota", "Requirements", "StartDate", "StartTime", "WeeklySyllabus", "WhoIsItFor" },
                values: new object[,]
                {
                    { 19, 1, "Unity ile Oyun Geliştirme", "", null, null, "2D ve 3D oyunlar yapmayı öğrenin. C# programlama ve Unity arayüzü.", 80, new DateTime(2026, 8, 14, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(6736), new TimeSpan(0, 12, 0, 0, 0), null, "https://images.unsplash.com/photo-1552824236-41102881ad24?w=600", true, false, false, "", null, 4, 750m, 20, "Temel bilgisayar kullanımı.", new DateTime(2026, 6, 13, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(7295), new TimeSpan(0, 9, 0, 0, 0), "Pazartesi: 09:00-12:00\nSalı: 09:00-12:00\nÇarşamba: 09:00-12:00", "Kendini geliştirmek isteyen herkes." },
                    { 20, 4, "Piyano Eğitimi (Başlangıç)", "", null, null, "Nota okuma ve temel piyano teknikleri. Müziğin büyülü dünyasına adım atın.", 48, new DateTime(2026, 8, 14, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(7411), new TimeSpan(0, 12, 0, 0, 0), null, "https://images.unsplash.com/photo-1520529611442-eaf5f228497b?w=600", true, false, false, "", null, 4, 750m, 10, "Temel bilgisayar kullanımı.", new DateTime(2026, 5, 19, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(7418), new TimeSpan(0, 9, 0, 0, 0), "Pazartesi: 09:00-12:00\nSalı: 09:00-12:00\nÇarşamba: 09:00-12:00", "Kendini geliştirmek isteyen herkes." },
                    { 21, 1, "Dijital Pazarlama ve SEO", "", null, null, "İşinizi dijital dünyada büyütmenin yollarını öğrenin. Google Ads, Meta Ads ve SEO teknikleri.", 40, new DateTime(2026, 8, 14, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(7428), new TimeSpan(0, 12, 0, 0, 0), null, "https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=600", true, false, false, "", null, 4, 500m, 30, "Temel bilgisayar kullanımı.", new DateTime(2026, 5, 29, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(7431), new TimeSpan(0, 9, 0, 0, 0), "Pazartesi: 09:00-12:00\nSalı: 09:00-12:00\nÇarşamba: 09:00-12:00", "Kendini geliştirmek isteyen herkes." },
                    { 22, 1, "Python ile Veri Analizi", "", null, null, "Pandas, Numpy ve Matplotlib kütüphaneleri ile veriden anlamlı sonuçlar çıkarın.", 60, new DateTime(2026, 8, 14, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(7436), new TimeSpan(0, 12, 0, 0, 0), null, "https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=600", true, false, false, "", null, 4, 600m, 25, "Temel bilgisayar kullanımı.", new DateTime(2026, 6, 3, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(7439), new TimeSpan(0, 9, 0, 0, 0), "Pazartesi: 09:00-12:00\nSalı: 09:00-12:00\nÇarşamba: 09:00-12:00", "Kendini geliştirmek isteyen herkes." },
                    { 23, 3, "Yaratıcı Yazarlık Atölyesi", "", null, null, "Kendi hikayenizi yazmaya başlayın. Karakter gelişimi ve kurgu teknikleri.", 24, new DateTime(2026, 8, 14, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(7470), new TimeSpan(0, 12, 0, 0, 0), null, "https://images.unsplash.com/photo-1455390582262-044cdead277a?w=600", true, false, false, "", null, 4, 400m, 15, "Temel bilgisayar kullanımı.", new DateTime(2026, 5, 24, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(7473), new TimeSpan(0, 9, 0, 0, 0), "Pazartesi: 09:00-12:00\nSalı: 09:00-12:00\nÇarşamba: 09:00-12:00", "Kendini geliştirmek isteyen herkes." },
                    { 24, 3, "Temel Fotoğrafçılık", "", null, null, "Işık, kompozisyon ve teknik ayarlar. Makinenizi tanıyın ve harika kareler yakalayın.", 32, new DateTime(2026, 8, 14, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(7478), new TimeSpan(0, 12, 0, 0, 0), null, "https://images.unsplash.com/photo-1452784444945-3f422708fe5e?w=600", true, false, false, "", null, 4, 450m, 20, "Temel bilgisayar kullanımı.", new DateTime(2026, 6, 8, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(7481), new TimeSpan(0, 9, 0, 0, 0), "Pazartesi: 09:00-12:00\nSalı: 09:00-12:00\nÇarşamba: 09:00-12:00", "Kendini geliştirmek isteyen herkes." }
                });

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 400, DateTimeKind.Local).AddTicks(3075));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 401, DateTimeKind.Local).AddTicks(760));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 401, DateTimeKind.Local).AddTicks(794));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 401, DateTimeKind.Local).AddTicks(1028));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 401, DateTimeKind.Local).AddTicks(1037));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 401, DateTimeKind.Local).AddTicks(1043));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 19, 46, 4, 413, DateTimeKind.Local).AddTicks(65));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 19, 46, 4, 413, DateTimeKind.Local).AddTicks(731));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(1202));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(3480));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(3494));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(3499));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(3503));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(3507));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(3606));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(3611));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(3616));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(3620));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(3625));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(3630));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 4, 19, 46, 4, 413, DateTimeKind.Local).AddTicks(7245));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 19, 46, 4, 413, DateTimeKind.Local).AddTicks(8534));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 19, 46, 4, 413, DateTimeKind.Local).AddTicks(8543));

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "Bio", "DribbbleUrl", "Education", "LinkedInUrl", "PortfolioUrl", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null, null, null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "Bio", "DribbbleUrl", "Education", "ImageUrl", "LinkedInUrl", "PortfolioUrl", "Skills" },
                values: new object[] { "10 yılı aşkın süredir sektörde aktif olarak UI/UX tasarım ve ön yüz geliştirme projelerinde yer almaktadır. Figma, Adobe Creative Cloud ve modern web teknolojileri (HTML5, CSS3, JavaScript) konusunda uzmanlaşmıştır. Öğrencilerine sadece teknik bilgi değil, aynı zamanda tasarım odaklı düşünme yetisini de kazandırmayı amaçlar.", "https://behance.net/elifkaya", "İstanbul Teknik Üniversitesi - Endüstriyel Tasarım (Lisans)\nMarmara Üniversitesi - Grafik Tasarım (Yüksek Lisans)", "/img/instructors/elif_kaya.png", "https://linkedin.com/in/elifkaya", "https://elifkaya.design", "UI/UX Design, Figma, HTML/CSS, Responsive Design, Adobe XD, Prototyping" });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "Bio", "DribbbleUrl", "Education", "LinkedInUrl", "PortfolioUrl", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null, null, null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 4,
                columns: new[] { "Bio", "DribbbleUrl", "Education", "LinkedInUrl", "PortfolioUrl", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null, null, null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 5,
                columns: new[] { "Bio", "DribbbleUrl", "Education", "LinkedInUrl", "PortfolioUrl", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null, null, null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 6,
                columns: new[] { "Bio", "DribbbleUrl", "Education", "LinkedInUrl", "PortfolioUrl", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null, null, null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 7,
                columns: new[] { "Bio", "DribbbleUrl", "Education", "LinkedInUrl", "PortfolioUrl", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null, null, null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 8,
                columns: new[] { "Bio", "DribbbleUrl", "Education", "LinkedInUrl", "PortfolioUrl", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null, null, null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 9,
                columns: new[] { "Bio", "DribbbleUrl", "Education", "LinkedInUrl", "PortfolioUrl", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null, null, null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 10,
                columns: new[] { "Bio", "DribbbleUrl", "Education", "LinkedInUrl", "PortfolioUrl", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null, null, null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 11,
                columns: new[] { "Bio", "DribbbleUrl", "Education", "LinkedInUrl", "PortfolioUrl", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null, null, null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 12,
                columns: new[] { "Bio", "DribbbleUrl", "Education", "LinkedInUrl", "PortfolioUrl", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null, null, null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 13,
                columns: new[] { "Bio", "DribbbleUrl", "Education", "LinkedInUrl", "PortfolioUrl", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null, null, null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 14,
                columns: new[] { "Bio", "DribbbleUrl", "Education", "LinkedInUrl", "PortfolioUrl", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null, null, null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 15,
                columns: new[] { "Bio", "DribbbleUrl", "Education", "LinkedInUrl", "PortfolioUrl", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null, null, null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 16,
                columns: new[] { "Bio", "DribbbleUrl", "Education", "LinkedInUrl", "PortfolioUrl", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null, null, null, null });

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 418, DateTimeKind.Local).AddTicks(6656));

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 419, DateTimeKind.Local).AddTicks(1699));

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 419, DateTimeKind.Local).AddTicks(1711));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 19, 46, 4, 412, DateTimeKind.Local).AddTicks(3363));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 19, 46, 4, 412, DateTimeKind.Local).AddTicks(4175));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 414, DateTimeKind.Local).AddTicks(6614));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 416, DateTimeKind.Local).AddTicks(919));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 416, DateTimeKind.Local).AddTicks(960));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 416, DateTimeKind.Local).AddTicks(969));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 416, DateTimeKind.Local).AddTicks(975));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 1,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 418, DateTimeKind.Local).AddTicks(1672));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 2,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 418, DateTimeKind.Local).AddTicks(2423));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 3,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 418, DateTimeKind.Local).AddTicks(2430));

            migrationBuilder.UpdateData(
                table: "Students",
                keyColumn: "Id",
                keyValue: 99,
                columns: new[] { "GithubUrl", "LinkedInUrl" },
                values: new object[] { null, null });

            migrationBuilder.CreateIndex(
                name: "IX_Instructors_FullName",
                table: "Instructors",
                column: "FullName");

            migrationBuilder.CreateIndex(
                name: "IX_Courses_CourseName",
                table: "Courses",
                column: "CourseName");

            migrationBuilder.CreateIndex(
                name: "IX_Applications_Email",
                table: "Applications",
                column: "Email");

            migrationBuilder.CreateIndex(
                name: "IX_Applications_Status",
                table: "Applications",
                column: "Status");

            /*
            migrationBuilder.CreateIndex(
                name: "IX_PromoCodes_CourseId",
                table: "PromoCodes",
                column: "CourseId");

            migrationBuilder.CreateIndex(
                name: "IX_PromoCodes_StudentId",
                table: "PromoCodes",
                column: "StudentId");
            */
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "HalkPointActivities");

            migrationBuilder.DropTable(
                name: "HalkPointCodes");

            migrationBuilder.DropTable(
                name: "PromoCodes");

            migrationBuilder.DropIndex(
                name: "IX_Instructors_FullName",
                table: "Instructors");

            migrationBuilder.DropIndex(
                name: "IX_Courses_CourseName",
                table: "Courses");

            migrationBuilder.DropIndex(
                name: "IX_Applications_Email",
                table: "Applications");

            migrationBuilder.DropIndex(
                name: "IX_Applications_Status",
                table: "Applications");

            migrationBuilder.DeleteData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 19);

            migrationBuilder.DeleteData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 20);

            migrationBuilder.DeleteData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 21);

            migrationBuilder.DeleteData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 22);

            migrationBuilder.DeleteData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 23);

            migrationBuilder.DeleteData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 24);

            migrationBuilder.DropColumn(
                name: "GithubUrl",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "LinkedInUrl",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "Bio",
                table: "Instructors");

            migrationBuilder.DropColumn(
                name: "DribbbleUrl",
                table: "Instructors");

            migrationBuilder.DropColumn(
                name: "Education",
                table: "Instructors");

            migrationBuilder.DropColumn(
                name: "LinkedInUrl",
                table: "Instructors");

            migrationBuilder.DropColumn(
                name: "PortfolioUrl",
                table: "Instructors");

            migrationBuilder.DropColumn(
                name: "Skills",
                table: "Instructors");

            migrationBuilder.DropColumn(
                name: "PaymentType",
                table: "Applications");

            migrationBuilder.DropColumn(
                name: "UsedHalkPointCode",
                table: "Applications");

            migrationBuilder.AlterColumn<string>(
                name: "FullName",
                table: "Instructors",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(450)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "CourseName",
                table: "Courses",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(450)");

            migrationBuilder.AlterColumn<string>(
                name: "Email",
                table: "Applications",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(450)",
                oldNullable: true);

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 1,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1526379095098-d400fd0bf935?w=600");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 2,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1547658719-da2b51169166?w=600");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 3,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=600");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 4,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1543109740-4bdb38fda756?w=600");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 5,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1527866959252-deab85ef7d1b?w=600");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 6,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1513364776144-60967b0f800f?w=600");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 7,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1565193566173-7a0ee3dbe261?w=600");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 8,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1510915361894-db8b60106cb1?w=600");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 9,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1507838153414-b4b713384a76?w=600");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 10,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=600");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 11,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=600");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 12,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=600");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 13,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1560750588-73207b1ef5b8?w=600");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 14,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?w=600");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 15,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1559136555-9303baea8ebd?w=600");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 16,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=600");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 17,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1587334206571-3390ccc205df?w=600");

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 18,
                column: "ImageUrl",
                value: "https://images.unsplash.com/photo-1592419044706-39796d40f98c?w=600");

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 195, DateTimeKind.Local).AddTicks(1655));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 195, DateTimeKind.Local).AddTicks(4778));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 195, DateTimeKind.Local).AddTicks(4786));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 195, DateTimeKind.Local).AddTicks(4791));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 195, DateTimeKind.Local).AddTicks(4794));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 195, DateTimeKind.Local).AddTicks(4798));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 1, 27, 32, 200, DateTimeKind.Local).AddTicks(5235));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 27, 32, 200, DateTimeKind.Local).AddTicks(5719));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(4530));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(6492));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(6505));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(6509));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(6511));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(6515));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(6517));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(6562));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(6565));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(6568));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(6571));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(6574));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 3, 1, 27, 32, 200, DateTimeKind.Local).AddTicks(8584));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 8, 1, 27, 32, 200, DateTimeKind.Local).AddTicks(9266));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 1, 27, 32, 200, DateTimeKind.Local).AddTicks(9272));

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 2,
                column: "ImageUrl",
                value: null);

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 202, DateTimeKind.Local).AddTicks(5627));

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 202, DateTimeKind.Local).AddTicks(8794));

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 202, DateTimeKind.Local).AddTicks(8802));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 8, 1, 27, 32, 200, DateTimeKind.Local).AddTicks(882));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 1, 27, 32, 200, DateTimeKind.Local).AddTicks(1541));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 201, DateTimeKind.Local).AddTicks(509));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 201, DateTimeKind.Local).AddTicks(3567));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 201, DateTimeKind.Local).AddTicks(3574));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 201, DateTimeKind.Local).AddTicks(3578));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 201, DateTimeKind.Local).AddTicks(3582));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 1,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 202, DateTimeKind.Local).AddTicks(416));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 2,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 202, DateTimeKind.Local).AddTicks(798));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 3,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 202, DateTimeKind.Local).AddTicks(803));
        }
    }
}
