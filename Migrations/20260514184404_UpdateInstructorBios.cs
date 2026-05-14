using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace HalkEgitimSistemi.Migrations
{
    /// <inheritdoc />
    public partial class UpdateInstructorBios : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 19,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 14, 21, 44, 0, 928, DateTimeKind.Local).AddTicks(9677), new DateTime(2026, 6, 13, 21, 44, 0, 928, DateTimeKind.Local).AddTicks(9926) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 20,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 14, 21, 44, 0, 928, DateTimeKind.Local).AddTicks(9969), new DateTime(2026, 5, 19, 21, 44, 0, 928, DateTimeKind.Local).AddTicks(9971) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 21,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 14, 21, 44, 0, 928, DateTimeKind.Local).AddTicks(9976), new DateTime(2026, 5, 29, 21, 44, 0, 928, DateTimeKind.Local).AddTicks(9978) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 22,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 14, 21, 44, 0, 928, DateTimeKind.Local).AddTicks(9980), new DateTime(2026, 6, 3, 21, 44, 0, 928, DateTimeKind.Local).AddTicks(9982) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 23,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 14, 21, 44, 0, 928, DateTimeKind.Local).AddTicks(9984), new DateTime(2026, 5, 24, 21, 44, 0, 928, DateTimeKind.Local).AddTicks(9986) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 24,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 14, 21, 44, 0, 928, DateTimeKind.Local).AddTicks(9988), new DateTime(2026, 6, 8, 21, 44, 0, 928, DateTimeKind.Local).AddTicks(9990) });

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 930, DateTimeKind.Local).AddTicks(6008));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 930, DateTimeKind.Local).AddTicks(7993));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 930, DateTimeKind.Local).AddTicks(7998));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 930, DateTimeKind.Local).AddTicks(8075));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 930, DateTimeKind.Local).AddTicks(8078));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 930, DateTimeKind.Local).AddTicks(8081));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 21, 44, 0, 933, DateTimeKind.Local).AddTicks(3442));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 21, 44, 0, 933, DateTimeKind.Local).AddTicks(3683));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 930, DateTimeKind.Local).AddTicks(1394));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 930, DateTimeKind.Local).AddTicks(2779));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 930, DateTimeKind.Local).AddTicks(2788));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 930, DateTimeKind.Local).AddTicks(2790));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 930, DateTimeKind.Local).AddTicks(2792));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 930, DateTimeKind.Local).AddTicks(2794));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 930, DateTimeKind.Local).AddTicks(2796));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 930, DateTimeKind.Local).AddTicks(2797));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 930, DateTimeKind.Local).AddTicks(2799));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 930, DateTimeKind.Local).AddTicks(2801));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 930, DateTimeKind.Local).AddTicks(2802));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 930, DateTimeKind.Local).AddTicks(2804));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 4, 21, 44, 0, 933, DateTimeKind.Local).AddTicks(5694));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 21, 44, 0, 933, DateTimeKind.Local).AddTicks(6144));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 21, 44, 0, 933, DateTimeKind.Local).AddTicks(6147));

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Yazılım dünyasına 15 yıl önce adım atan Ahmet Yılmaz, yapay zeka ve Python programlama konusunda ulusal çapta birçok ödüle sahiptir. Gençleri geleceğin teknolojileriyle buluşturmayı misyon edinmiştir.", "ODTÜ - Bilgisayar Mühendisliği (Lisans)\nBoğaziçi Üniversitesi - Yapay Zeka (Yüksek Lisans)", "Python, Makine Öğrenmesi, Veri Bilimi, C#, Eğitim Teknolojileri" });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "Bio", "DribbbleUrl", "Skills" },
                values: new object[] { "10 yılı aşkın süredir sektörde aktif olarak UI/UX tasarım ve ön yüz geliştirme projelerinde yer almaktadır. Figma, Adobe Creative Cloud ve modern web teknolojileri konusunda uzmanlaşmıştır.", null, "UI/UX Design, Figma, HTML/CSS, Responsive Design, Adobe XD" });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Kamu kurumları ve özel sektörde 20 yıllık sistem yöneticiliği tecrübesine sahip olan Mehmet Demir, ofis yazılımları ve temel bilgisayar ağları konusunda yüzlerce kursiyer mezun etmiştir.", "Karadeniz Teknik Üniversitesi - Bilgisayar Teknolojileri", "Windows Server, Microsoft Office, Ağ Güvenliği, Donanım" });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 4,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Ana dili İngilizce olan Sarah, CELTA ve TEFL sertifikalarına sahiptir. 8 yıldır Türkiye'de her yaş grubuna yenilikçi metotlarla İngilizce konuşma ve yazma eğitimleri vermektedir.", "University of London - English Literature\nCambridge CELTA Certification", "İngilizce (Anadil), Konuşma Pratiği, IELTS/TOEFL Hazırlık, Pedagoji" });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 5,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Goethe Enstitüsü geçmişine sahip olan Hans, Almanca dilinin mantığını ve Alman kültürünü kursiyerlere interaktif bir şekilde aktararak dil öğrenimini keyifli hale getiriyor.", "Ludwig-Maximilians-Universität München - Germanistik", "Almanca A1-C1, Telc Sınav Hazırlığı, Kültürel Entegrasyon" });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 6,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Kültür Bakanlığı onaylı El Sanatları ustası olan Zeynep Hanım, ahşap boyama ve geleneksel Türk motifleri üzerine eserler üretmekte ve sergiler açmaktadır.", "Mimar Sinan Güzel Sanatlar Üniversitesi - Geleneksel Türk Sanatları", "Ahşap Boyama, Ebru Sanatı, Hat Sanatı, Motif Tasarımı" });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 7,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Toprağa şekil vermeyi hayat felsefesi olarak gören Fatma Çelik, modern ve geleneksel seramik sanatını harmanlayarak atölyesinde eşsiz eserler ortaya çıkarıyor.", "Hacettepe Üniversitesi - Seramik ve Cam Bölümü", "Seramik Şekillendirme, Sırlama Teknikleri, Çini İşlemeciliği" });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 8,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Klasik gitar ve piyano alanında konservatuar eğitimi almış olan Can Özkan, çok sesli korolarda şeflik yapmış ve sayısız müzisyen yetiştirmiştir.", "Ankara Devlet Konservatuarı - Müzik Teorisi ve Kompozisyon", "Klasik Gitar, Piyano, Solfej, Armoni" });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 9,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Anadolu'nun ezgilerini nesilden nesile aktarmayı görev edinen Hasan Korkmaz, bağlama virtüözü olup yurt içi ve yurt dışı birçok festivalde sahne almıştır.", "Ege Üniversitesi - Türk Musikisi Devlet Konservatuarı", "Bağlama, Türk Halk Müziği Repertuarı, Şan Eğitimi" });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 10,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Hindistan'da aldığı 500 saatlik Yoga Alliance eğitiminin ardından, beden ve zihin sağlığını geliştirmeye yönelik nefes terapileri ve Hatha Yoga dersleri vermektedir.", "Rishikesh Yoga Academy (RYT 500)\nSpor Bilimleri Fakültesi", "Hatha Yoga, Nefes Terapisi, Meditasyon, Anatomi" });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 11,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Uluslararası mutfaklarda 25 yıllık şeflik deneyimi olan Mustafa Bey, Michelin yıldızlı restoranlardaki tecrübesini yerel Türk mutfağıyla birleştirerek eşsiz tarifler öğretiyor.", "Le Cordon Bleu Paris - Culinary Arts\nMengen Aşçılık Meslek Lisesi", "Dünya Mutfağı, Türk Mutfağı, Menü Planlama, Mutfak Yönetimi" });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 12,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Butik pastacılık ve çikolata tasarımında kendi markasını kurmuş olan Pınar Aydın, görsel şölene dönüşen tatlıların tüm sırlarını öğrencileriyle paylaşıyor.", "Gastronomi ve Mutfak Sanatları Lisans Eğitimi", "Butik Pasta Tasarımı, Çikolata Yapımı, Fransız Tatlıları" });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 13,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Medikal estetik ve cilt bakımı uzmanı Derya Şahin, en yeni güzellik teknolojileri ve dermatolojik testlerden geçmiş doğal yöntemlerle sektörde profesyoneller yetiştiriyor.", "Güzellik ve Saç Bakım Hizmetleri Uzmanlık Eğitimi", "Cilt Bakımı, Lazer Epilasyon, Profesyonel Makyaj, Anatomi" });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 14,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Kurumsal şirketlerde finans direktörlüğü yapmış olan Burak Öztürk, e-ticaret muhasebesi, vergi mevzuatı ve finansal okuryazarlık alanlarında danışmanlık yapmaktadır.", "Gazi Üniversitesi - İşletme\nSMMM Ruhsatı", "Genel Muhasebe, Finansal Analiz, E-Ticaret Vergilendirme, Excel" });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 15,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Sayısız start-up'a mentörlük yapan Prof. Dr. Selin Aktaş, melek yatırımcı ağlarıyla olan bağlantıları ve inovasyon stratejileri sayesinde girişimcilere yol gösteriyor.", "Stanford University - Business Administration (Ph.D.)", "İş Geliştirme, Melek Yatırım, KOSGEB Danışmanlığı, Start-up Yönetimi" });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 16,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Siber güvenlik alanında CEH ve CISSP sertifikalarına sahip Caner Kandemir, kurumların ağ güvenlik mimarilerini test eden etik bir hacker ve güvenlik araştırmacısıdır.", "Bilkent Üniversitesi - Bilgisayar Mühendisliği\nCertified Ethical Hacker (CEH)", "Ağ Güvenliği, Penetrasyon Testleri, Kriptografi, Sızma Testi" });

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 934, DateTimeKind.Local).AddTicks(5491));

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 934, DateTimeKind.Local).AddTicks(6961));

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 934, DateTimeKind.Local).AddTicks(6964));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 21, 44, 0, 933, DateTimeKind.Local).AddTicks(1362));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 21, 44, 0, 933, DateTimeKind.Local).AddTicks(1610));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 933, DateTimeKind.Local).AddTicks(7230));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 934, DateTimeKind.Local).AddTicks(288));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 934, DateTimeKind.Local).AddTicks(298));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 934, DateTimeKind.Local).AddTicks(301));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 934, DateTimeKind.Local).AddTicks(304));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 1,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 934, DateTimeKind.Local).AddTicks(4609));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 2,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 934, DateTimeKind.Local).AddTicks(4794));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 3,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 14, 21, 44, 0, 934, DateTimeKind.Local).AddTicks(4796));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 19,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 14, 19, 48, 41, 174, DateTimeKind.Local).AddTicks(534), new DateTime(2026, 6, 13, 19, 48, 41, 174, DateTimeKind.Local).AddTicks(1160) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 20,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 14, 19, 48, 41, 174, DateTimeKind.Local).AddTicks(1317), new DateTime(2026, 5, 19, 19, 48, 41, 174, DateTimeKind.Local).AddTicks(1321) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 21,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 14, 19, 48, 41, 174, DateTimeKind.Local).AddTicks(1329), new DateTime(2026, 5, 29, 19, 48, 41, 174, DateTimeKind.Local).AddTicks(1331) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 22,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 14, 19, 48, 41, 174, DateTimeKind.Local).AddTicks(1335), new DateTime(2026, 6, 3, 19, 48, 41, 174, DateTimeKind.Local).AddTicks(1338) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 23,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 14, 19, 48, 41, 174, DateTimeKind.Local).AddTicks(1341), new DateTime(2026, 5, 24, 19, 48, 41, 174, DateTimeKind.Local).AddTicks(1344) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 24,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 14, 19, 48, 41, 174, DateTimeKind.Local).AddTicks(1348), new DateTime(2026, 6, 8, 19, 48, 41, 174, DateTimeKind.Local).AddTicks(1350) });

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 185, DateTimeKind.Local).AddTicks(6282));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 186, DateTimeKind.Local).AddTicks(3480));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 186, DateTimeKind.Local).AddTicks(3495));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 186, DateTimeKind.Local).AddTicks(3500));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 186, DateTimeKind.Local).AddTicks(3505));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 186, DateTimeKind.Local).AddTicks(3509));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 19, 48, 41, 201, DateTimeKind.Local).AddTicks(7932));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 19, 48, 41, 201, DateTimeKind.Local).AddTicks(8733));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 178, DateTimeKind.Local).AddTicks(8775));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 179, DateTimeKind.Local).AddTicks(6606));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 179, DateTimeKind.Local).AddTicks(6662));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 179, DateTimeKind.Local).AddTicks(6668));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 179, DateTimeKind.Local).AddTicks(6671));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 179, DateTimeKind.Local).AddTicks(6675));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 179, DateTimeKind.Local).AddTicks(6679));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 179, DateTimeKind.Local).AddTicks(6683));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 179, DateTimeKind.Local).AddTicks(6687));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 179, DateTimeKind.Local).AddTicks(6691));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 179, DateTimeKind.Local).AddTicks(6694));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 179, DateTimeKind.Local).AddTicks(6696));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 4, 19, 48, 41, 202, DateTimeKind.Local).AddTicks(6692));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 19, 48, 41, 202, DateTimeKind.Local).AddTicks(9948));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 19, 48, 41, 202, DateTimeKind.Local).AddTicks(9957));

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "Bio", "DribbbleUrl", "Skills" },
                values: new object[] { "10 yılı aşkın süredir sektörde aktif olarak UI/UX tasarım ve ön yüz geliştirme projelerinde yer almaktadır. Figma, Adobe Creative Cloud ve modern web teknolojileri (HTML5, CSS3, JavaScript) konusunda uzmanlaşmıştır. Öğrencilerine sadece teknik bilgi değil, aynı zamanda tasarım odaklı düşünme yetisini de kazandırmayı amaçlar.", "https://behance.net/elifkaya", "UI/UX Design, Figma, HTML/CSS, Responsive Design, Adobe XD, Prototyping" });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 4,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 5,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 6,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 7,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 8,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 9,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 10,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 11,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 12,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 13,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 14,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 15,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 16,
                columns: new[] { "Bio", "Education", "Skills" },
                values: new object[] { "Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.", null, null });

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 206, DateTimeKind.Local).AddTicks(2921));

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 207, DateTimeKind.Local).AddTicks(9033));

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 207, DateTimeKind.Local).AddTicks(9077));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 19, 48, 41, 199, DateTimeKind.Local).AddTicks(7983));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 19, 48, 41, 200, DateTimeKind.Local).AddTicks(3438));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 203, DateTimeKind.Local).AddTicks(4746));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 204, DateTimeKind.Local).AddTicks(398));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 204, DateTimeKind.Local).AddTicks(411));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 204, DateTimeKind.Local).AddTicks(416));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 204, DateTimeKind.Local).AddTicks(420));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 1,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 205, DateTimeKind.Local).AddTicks(7145));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 2,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 205, DateTimeKind.Local).AddTicks(7948));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 3,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 14, 19, 48, 41, 205, DateTimeKind.Local).AddTicks(7953));
        }
    }
}
