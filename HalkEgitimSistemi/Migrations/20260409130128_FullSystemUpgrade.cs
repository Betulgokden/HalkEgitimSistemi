using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace HalkEgitimSistemi.Migrations
{
    /// <inheritdoc />
    public partial class FullSystemUpgrade : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "DurationHours",
                table: "Courses",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<DateTime>(
                name: "EndDate",
                table: "Courses",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<bool>(
                name: "IsActive",
                table: "Courses",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<int>(
                name: "Quota",
                table: "Courses",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<DateTime>(
                name: "StartDate",
                table: "Courses",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<string>(
                name: "Description",
                table: "Categories",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "IconClass",
                table: "Categories",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "AdminNote",
                table: "Applications",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "ApplyDate",
                table: "Applications",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<string>(
                name: "BirthPlace",
                table: "Applications",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "Status",
                table: "Applications",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.InsertData(
                table: "Categories",
                columns: new[] { "Id", "CategoryName", "Description", "IconClass" },
                values: new object[,]
                {
                    { 1, "Bilişim Teknolojileri", "Yazılım, donanım ve dijital beceriler", "bi-laptop" },
                    { 2, "Yabancı Diller", "İngilizce, Almanca, Arapça dil kursları", "bi-translate" },
                    { 3, "El Sanatları", "Ahşap boyama, nakış, seramik atölyeleri", "bi-palette" },
                    { 4, "Müzik", "Enstrüman ve ses eğitimi programları", "bi-music-note-beamed" },
                    { 5, "Spor ve Sağlık", "Fitness, yoga, yüzme kursları", "bi-heart-pulse" },
                    { 6, "Aşçılık ve Pastacılık", "Mutfak sanatları ve gastronomi", "bi-cup-hot" },
                    { 7, "Güzellik ve Bakım", "Kuaförlük, cilt bakımı, makyaj", "bi-scissors" },
                    { 8, "Mesleki Eğitim", "Sertifikalı mesleki gelişim programları", "bi-briefcase" }
                });

            migrationBuilder.InsertData(
                table: "News",
                columns: new[] { "Id", "Content", "Date", "ImageUrl", "PosterUrl", "PublishDate", "Title" },
                values: new object[,]
                {
                    { 1, "Halk Eğitim Merkezimizin 2026 yaz dönemi kurs kayıtları başlamıştır. 15 farklı branşta ücretsiz eğitim fırsatı! Kontenjanlar sınırlıdır, acele edin.", new DateTime(2026, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "https://images.unsplash.com/photo-1523050854058-8df90110c476?w=600", new DateTime(2026, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "2026 Yaz Dönemi Kayıtları Başladı!" },
                    { 2, "Bilişim teknolojileri kategorisinde yeni Python Programlama kursu açılmıştır. Yapay zeka ve veri bilimi alanına adım atmak isteyenler için harika bir fırsat.", new DateTime(2026, 4, 5, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "https://images.unsplash.com/photo-1526379095098-d400fd0bf935?w=600", new DateTime(2026, 4, 5, 0, 0, 0, 0, DateTimeKind.Unspecified), "Python Programlama Kursu Açıldı" },
                    { 3, "2025-2026 eğitim dönemini başarıyla tamamlayan 450 kursiyerimize sertifikaları düzenlenen törenle verildi. Tüm mezunlarımızı tebrik ederiz.", new DateTime(2026, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "https://images.unsplash.com/photo-1523580494863-6f3031224c94?w=600", new DateTime(2026, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), "Sertifika Töreni Gerçekleştirildi" },
                    { 4, "KOSGEB işbirliğiyle düzenlenen ücretsiz girişimcilik semineri 15 Haziran'da merkezimizde gerçekleştirilecektir. Tüm vatandaşlarımız davetlidir.", new DateTime(2026, 4, 8, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "https://images.unsplash.com/photo-1559136555-9303baea8ebd?w=600", new DateTime(2026, 4, 8, 0, 0, 0, 0, DateTimeKind.Unspecified), "Ücretsiz Girişimcilik Semineri" }
                });

            migrationBuilder.InsertData(
                table: "Courses",
                columns: new[] { "Id", "CategoryId", "CourseName", "Description", "DurationHours", "EndDate", "ImageUrl", "IsActive", "Quota", "StartDate" },
                values: new object[,]
                {
                    { 1, 1, "Python Programlama", "Sıfırdan ileri seviyeye Python programlama. Veri analizi, web geliştirme ve otomasyon projeleri.", 80, new DateTime(2026, 7, 31, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1526379095098-d400fd0bf935?w=600", true, 25, new DateTime(2026, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 2, 1, "Web Tasarım (HTML/CSS)", "Modern web sitesi tasarımı. HTML5, CSS3, Bootstrap ve responsive tasarım teknikleri.", 60, new DateTime(2026, 7, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1547658719-da2b51169166?w=600", true, 30, new DateTime(2026, 5, 15, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 3, 1, "Bilgisayar İşletmenliği", "Ofis programları, dosya yönetimi ve temel bilgisayar becerileri sertifika programı.", 120, new DateTime(2026, 8, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=600", true, 35, new DateTime(2026, 4, 15, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 4, 2, "İngilizce A1-A2", "Başlangıç seviyesi İngilizce. Temel dilbilgisi, kelime hazinesi ve günlük konuşma pratiği.", 90, new DateTime(2026, 8, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1543109740-4bdb38fda756?w=600", true, 20, new DateTime(2026, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 5, 2, "Almanca Temel Kurs", "Almanca dilbilgisi, telaffuz ve kültürel iletişim becerileri.", 60, new DateTime(2026, 8, 30, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1527866959252-deab85ef7d1b?w=600", true, 15, new DateTime(2026, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 6, 3, "Ahşap Boyama Atölyesi", "Dekoratif ahşap boyama teknikleri, renk uyumu ve uygulama becerileri.", 40, new DateTime(2026, 7, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1513364776144-60967b0f800f?w=600", true, 20, new DateTime(2026, 5, 10, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 7, 3, "Seramik ve Çömlek", "El yapımı seramik ve çömlek üretimi. Şekillendirme, sırlama ve fırınlama teknikleri.", 50, new DateTime(2026, 8, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1565193566173-7a0ee3dbe261?w=600", true, 15, new DateTime(2026, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 8, 4, "Gitar Kursu", "Klasik ve akustik gitar eğitimi. Nota okuma, akor geçişleri ve parça çalışmaları.", 45, new DateTime(2026, 7, 30, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1510915361894-db8b60106cb1?w=600", true, 12, new DateTime(2026, 5, 5, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 9, 4, "Bağlama (Saz) Kursu", "Türk Halk Müziği enstrümanı bağlama/saz eğitimi. Temel ve orta seviye.", 50, new DateTime(2026, 8, 30, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1507838153414-b4b713384a76?w=600", true, 15, new DateTime(2026, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 10, 5, "Yoga ve Pilates", "Beden ve zihin sağlığı için yoga ve pilates programı. Tüm seviyelere uygundur.", 36, new DateTime(2026, 7, 31, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=600", true, 25, new DateTime(2026, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 11, 6, "Türk Mutfağı", "Geleneksel Türk yemekleri, kebaplar, çorbalar ve tatlılar. Uygulamalı mutfak eğitimi.", 60, new DateTime(2026, 7, 30, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=600", true, 18, new DateTime(2026, 5, 10, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 12, 6, "Pastacılık ve Hamur İşleri", "Profesyonel pastacılık teknikleri, pasta süsleme, ekmek ve börek yapımı.", 50, new DateTime(2026, 8, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1486427944544-d2c246c4df14?w=600", true, 15, new DateTime(2026, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 13, 7, "Kuaförlük ve Saç Bakımı", "Profesyonel saç kesimi, boyama, fön ve bakım teknikleri. MEB sertifikalı.", 120, new DateTime(2026, 8, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1560066984-138dadb4c035?w=600", true, 20, new DateTime(2026, 4, 20, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 14, 8, "Muhasebe ve Finans", "Temel muhasebe, bilanço okuma, vergi mevzuatı ve finansal analiz.", 90, new DateTime(2026, 8, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?w=600", true, 30, new DateTime(2026, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 15, 8, "Girişimcilik Atölyesi", "İş planı oluşturma, pazarlama stratejileri, dijital girişimcilik ve hibe programları.", 40, new DateTime(2026, 8, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1559136555-9303baea8ebd?w=600", true, 25, new DateTime(2026, 6, 15, 0, 0, 0, 0, DateTimeKind.Unspecified) }
                });

            migrationBuilder.InsertData(
                table: "Applications",
                columns: new[] { "Id", "AdminNote", "ApplyDate", "BirthPlace", "CourseId", "Email", "FirstName", "LastName", "PhoneNumber", "Status", "TcNo" },
                values: new object[,]
                {
                    { 1, null, new DateTime(2026, 4, 2, 0, 0, 0, 0, DateTimeKind.Unspecified), null, 1, "ali.koc@email.com", "Ali", "Koç", "0532 111 22 33", 1, "12345678901" },
                    { 2, null, new DateTime(2026, 4, 3, 0, 0, 0, 0, DateTimeKind.Unspecified), null, 4, "ayse.demir@email.com", "Ayşe", "Demir", "0533 222 33 44", 1, "23456789012" },
                    { 3, null, new DateTime(2026, 4, 4, 0, 0, 0, 0, DateTimeKind.Unspecified), null, 8, "mehmet.yilmaz@email.com", "Mehmet", "Yılmaz", "0534 333 44 55", 0, "34567890123" },
                    { 4, null, new DateTime(2026, 4, 5, 0, 0, 0, 0, DateTimeKind.Unspecified), null, 11, "fatma.kara@email.com", "Fatma", "Kara", "0535 444 55 66", 0, "45678901234" },
                    { 5, "Kontenjan doldu.", new DateTime(2026, 4, 5, 0, 0, 0, 0, DateTimeKind.Unspecified), null, 2, "hasan.celik@email.com", "Hasan", "Çelik", "0536 555 66 77", 2, "56789012345" },
                    { 6, null, new DateTime(2026, 4, 6, 0, 0, 0, 0, DateTimeKind.Unspecified), null, 10, "zeynep.aydin@email.com", "Zeynep", "Aydın", "0537 666 77 88", 1, "67890123456" },
                    { 7, null, new DateTime(2026, 4, 7, 0, 0, 0, 0, DateTimeKind.Unspecified), null, 13, "emre.sahin@email.com", "Emre", "Şahin", "0538 777 88 99", 0, "78901234567" },
                    { 8, null, new DateTime(2026, 4, 7, 0, 0, 0, 0, DateTimeKind.Unspecified), null, 14, "derya.ozturk@email.com", "Derya", "Öztürk", "0539 888 99 00", 1, "89012345678" }
                });

            migrationBuilder.InsertData(
                table: "Instructors",
                columns: new[] { "Id", "CourseId", "FullName", "ImageUrl", "Title" },
                values: new object[,]
                {
                    { 1, 1, "Dr. Ahmet Yılmaz", null, "Bilişim Teknolojileri Öğretmeni" },
                    { 2, 2, "Elif Kaya", null, "Web Tasarım Uzmanı" },
                    { 3, 3, "Mehmet Demir", null, "Bilgisayar Eğitmeni" },
                    { 4, 4, "Sarah Johnson", null, "İngilizce Öğretmeni" },
                    { 5, 5, "Hans Weber", null, "Almanca Öğretmeni" },
                    { 6, 6, "Zeynep Arslan", null, "El Sanatları Ustası" },
                    { 7, 7, "Fatma Çelik", null, "Seramik Sanatçısı" },
                    { 8, 8, "Can Özkan", null, "Müzik Öğretmeni" },
                    { 9, 9, "Hasan Korkmaz", null, "Halk Müziği Sanatçısı" },
                    { 10, 10, "Ayşe Yıldırım", null, "Yoga Eğitmeni" },
                    { 11, 11, "Şef Mustafa Bey", null, "Aşçıbaşı" },
                    { 12, 12, "Pınar Aydın", null, "Pastacılık Ustası" },
                    { 13, 13, "Derya Şahin", null, "Kuaför / Güzellik Uzmanı" },
                    { 14, 14, "Burak Öztürk", null, "Mali Müşavir" },
                    { 15, 15, "Prof. Dr. Selin Aktaş", null, "Girişimcilik Danışmanı" }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Applications",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Applications",
                keyColumn: "Id",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Applications",
                keyColumn: "Id",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Applications",
                keyColumn: "Id",
                keyValue: 4);

            migrationBuilder.DeleteData(
                table: "Applications",
                keyColumn: "Id",
                keyValue: 5);

            migrationBuilder.DeleteData(
                table: "Applications",
                keyColumn: "Id",
                keyValue: 6);

            migrationBuilder.DeleteData(
                table: "Applications",
                keyColumn: "Id",
                keyValue: 7);

            migrationBuilder.DeleteData(
                table: "Applications",
                keyColumn: "Id",
                keyValue: 8);

            migrationBuilder.DeleteData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 4);

            migrationBuilder.DeleteData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 5);

            migrationBuilder.DeleteData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 6);

            migrationBuilder.DeleteData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 7);

            migrationBuilder.DeleteData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 8);

            migrationBuilder.DeleteData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 9);

            migrationBuilder.DeleteData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 10);

            migrationBuilder.DeleteData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 11);

            migrationBuilder.DeleteData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 12);

            migrationBuilder.DeleteData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 13);

            migrationBuilder.DeleteData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 14);

            migrationBuilder.DeleteData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 15);

            migrationBuilder.DeleteData(
                table: "News",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "News",
                keyColumn: "Id",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "News",
                keyColumn: "Id",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "News",
                keyColumn: "Id",
                keyValue: 4);

            migrationBuilder.DeleteData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 4);

            migrationBuilder.DeleteData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 5);

            migrationBuilder.DeleteData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 6);

            migrationBuilder.DeleteData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 7);

            migrationBuilder.DeleteData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 8);

            migrationBuilder.DeleteData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 9);

            migrationBuilder.DeleteData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 10);

            migrationBuilder.DeleteData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 11);

            migrationBuilder.DeleteData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 12);

            migrationBuilder.DeleteData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 13);

            migrationBuilder.DeleteData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 14);

            migrationBuilder.DeleteData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 15);

            migrationBuilder.DeleteData(
                table: "Categories",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Categories",
                keyColumn: "Id",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Categories",
                keyColumn: "Id",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Categories",
                keyColumn: "Id",
                keyValue: 4);

            migrationBuilder.DeleteData(
                table: "Categories",
                keyColumn: "Id",
                keyValue: 5);

            migrationBuilder.DeleteData(
                table: "Categories",
                keyColumn: "Id",
                keyValue: 6);

            migrationBuilder.DeleteData(
                table: "Categories",
                keyColumn: "Id",
                keyValue: 7);

            migrationBuilder.DeleteData(
                table: "Categories",
                keyColumn: "Id",
                keyValue: 8);

            migrationBuilder.DropColumn(
                name: "DurationHours",
                table: "Courses");

            migrationBuilder.DropColumn(
                name: "EndDate",
                table: "Courses");

            migrationBuilder.DropColumn(
                name: "IsActive",
                table: "Courses");

            migrationBuilder.DropColumn(
                name: "Quota",
                table: "Courses");

            migrationBuilder.DropColumn(
                name: "StartDate",
                table: "Courses");

            migrationBuilder.DropColumn(
                name: "Description",
                table: "Categories");

            migrationBuilder.DropColumn(
                name: "IconClass",
                table: "Categories");

            migrationBuilder.DropColumn(
                name: "AdminNote",
                table: "Applications");

            migrationBuilder.DropColumn(
                name: "ApplyDate",
                table: "Applications");

            migrationBuilder.DropColumn(
                name: "BirthPlace",
                table: "Applications");

            migrationBuilder.DropColumn(
                name: "Status",
                table: "Applications");
        }
    }
}
