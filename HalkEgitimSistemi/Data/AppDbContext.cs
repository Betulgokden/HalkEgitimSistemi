using Microsoft.EntityFrameworkCore;
using HalkEgitimSistemi.Models;

namespace HalkEgitimSistemi.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        public DbSet<News> News { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Course> Courses { get; set; }
        public DbSet<Application> Applications { get; set; }
        public DbSet<Instructor> Instructors { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // ===== SEED DATA: KATEGORİLER =====
            modelBuilder.Entity<Category>().HasData(
                new Category { Id = 1, CategoryName = "Bilişim Teknolojileri", Description = "Yazılım, donanım ve dijital beceriler", IconClass = "bi-laptop" },
                new Category { Id = 2, CategoryName = "Yabancı Diller", Description = "İngilizce, Almanca, Arapça dil kursları", IconClass = "bi-translate" },
                new Category { Id = 3, CategoryName = "El Sanatları", Description = "Ahşap boyama, nakış, seramik atölyeleri", IconClass = "bi-palette" },
                new Category { Id = 4, CategoryName = "Müzik", Description = "Enstrüman ve ses eğitimi programları", IconClass = "bi-music-note-beamed" },
                new Category { Id = 5, CategoryName = "Spor ve Sağlık", Description = "Fitness, yoga, yüzme kursları", IconClass = "bi-heart-pulse" },
                new Category { Id = 6, CategoryName = "Aşçılık ve Pastacılık", Description = "Mutfak sanatları ve gastronomi", IconClass = "bi-cup-hot" },
                new Category { Id = 7, CategoryName = "Güzellik ve Bakım", Description = "Kuaförlük, cilt bakımı, makyaj", IconClass = "bi-scissors" },
                new Category { Id = 8, CategoryName = "Mesleki Eğitim", Description = "Sertifikalı mesleki gelişim programları", IconClass = "bi-briefcase" }
            );

            // ===== SEED DATA: KURSLAR =====
            modelBuilder.Entity<Course>().HasData(
                // Bilişim
                new Course { Id = 1, CourseName = "Python Programlama", Description = "Sıfırdan ileri seviyeye Python programlama. Veri analizi, web geliştirme ve otomasyon projeleri.", ImageUrl = "https://images.unsplash.com/photo-1526379095098-d400fd0bf935?w=600", CategoryId = 1, Quota = 25, DurationHours = 80, StartDate = new DateTime(2026, 5, 1), EndDate = new DateTime(2026, 7, 31), IsActive = true },
                new Course { Id = 2, CourseName = "Web Tasarım (HTML/CSS)", Description = "Modern web sitesi tasarımı. HTML5, CSS3, Bootstrap ve responsive tasarım teknikleri.", ImageUrl = "https://images.unsplash.com/photo-1547658719-da2b51169166?w=600", CategoryId = 1, Quota = 30, DurationHours = 60, StartDate = new DateTime(2026, 5, 15), EndDate = new DateTime(2026, 7, 15), IsActive = true },
                new Course { Id = 3, CourseName = "Bilgisayar İşletmenliği", Description = "Ofis programları, dosya yönetimi ve temel bilgisayar becerileri sertifika programı.", ImageUrl = "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=600", CategoryId = 1, Quota = 35, DurationHours = 120, StartDate = new DateTime(2026, 4, 15), EndDate = new DateTime(2026, 8, 15), IsActive = true },
                // Yabancı Diller
                new Course { Id = 4, CourseName = "İngilizce A1-A2", Description = "Başlangıç seviyesi İngilizce. Temel dilbilgisi, kelime hazinesi ve günlük konuşma pratiği.", ImageUrl = "https://images.unsplash.com/photo-1543109740-4bdb38fda756?w=600", CategoryId = 2, Quota = 20, DurationHours = 90, StartDate = new DateTime(2026, 5, 1), EndDate = new DateTime(2026, 8, 1), IsActive = true },
                new Course { Id = 5, CourseName = "Almanca Temel Kurs", Description = "Almanca dilbilgisi, telaffuz ve kültürel iletişim becerileri.", ImageUrl = "https://images.unsplash.com/photo-1527866959252-deab85ef7d1b?w=600", CategoryId = 2, Quota = 15, DurationHours = 60, StartDate = new DateTime(2026, 6, 1), EndDate = new DateTime(2026, 8, 30), IsActive = true },
                // El Sanatları
                new Course { Id = 6, CourseName = "Ahşap Boyama Atölyesi", Description = "Dekoratif ahşap boyama teknikleri, renk uyumu ve uygulama becerileri.", ImageUrl = "https://images.unsplash.com/photo-1513364776144-60967b0f800f?w=600", CategoryId = 3, Quota = 20, DurationHours = 40, StartDate = new DateTime(2026, 5, 10), EndDate = new DateTime(2026, 7, 10), IsActive = true },
                new Course { Id = 7, CourseName = "Seramik ve Çömlek", Description = "El yapımı seramik ve çömlek üretimi. Şekillendirme, sırlama ve fırınlama teknikleri.", ImageUrl = "https://images.unsplash.com/photo-1565193566173-7a0ee3dbe261?w=600", CategoryId = 3, Quota = 15, DurationHours = 50, StartDate = new DateTime(2026, 5, 20), EndDate = new DateTime(2026, 8, 20), IsActive = true },
                // Müzik
                new Course { Id = 8, CourseName = "Gitar Kursu", Description = "Klasik ve akustik gitar eğitimi. Nota okuma, akor geçişleri ve parça çalışmaları.", ImageUrl = "https://images.unsplash.com/photo-1510915361894-db8b60106cb1?w=600", CategoryId = 4, Quota = 12, DurationHours = 45, StartDate = new DateTime(2026, 5, 5), EndDate = new DateTime(2026, 7, 30), IsActive = true },
                new Course { Id = 9, CourseName = "Bağlama (Saz) Kursu", Description = "Türk Halk Müziği enstrümanı bağlama/saz eğitimi. Temel ve orta seviye.", ImageUrl = "https://images.unsplash.com/photo-1507838153414-b4b713384a76?w=600", CategoryId = 4, Quota = 15, DurationHours = 50, StartDate = new DateTime(2026, 6, 1), EndDate = new DateTime(2026, 8, 30), IsActive = true },
                // Spor
                new Course { Id = 10, CourseName = "Yoga ve Pilates", Description = "Beden ve zihin sağlığı için yoga ve pilates programı. Tüm seviyelere uygundur.", ImageUrl = "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=600", CategoryId = 5, Quota = 25, DurationHours = 36, StartDate = new DateTime(2026, 5, 1), EndDate = new DateTime(2026, 7, 31), IsActive = true },
                // Aşçılık
                new Course { Id = 11, CourseName = "Türk Mutfağı", Description = "Geleneksel Türk yemekleri, kebaplar, çorbalar ve tatlılar. Uygulamalı mutfak eğitimi.", ImageUrl = "https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=600", CategoryId = 6, Quota = 18, DurationHours = 60, StartDate = new DateTime(2026, 5, 10), EndDate = new DateTime(2026, 7, 30), IsActive = true },
                new Course { Id = 12, CourseName = "Pastacılık ve Hamur İşleri", Description = "Profesyonel pastacılık teknikleri, pasta süsleme, ekmek ve börek yapımı.", ImageUrl = "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=600", CategoryId = 6, Quota = 15, DurationHours = 50, StartDate = new DateTime(2026, 6, 1), EndDate = new DateTime(2026, 8, 15), IsActive = true },
                // Güzellik
                new Course { Id = 13, CourseName = "Kuaförlük ve Saç Bakımı", Description = "Profesyonel saç kesimi, boyama, fön ve bakım teknikleri. MEB sertifikalı.", ImageUrl = "https://images.unsplash.com/photo-1560066984-138dadb4c035?w=600", CategoryId = 7, Quota = 20, DurationHours = 120, StartDate = new DateTime(2026, 4, 20), EndDate = new DateTime(2026, 8, 20), IsActive = true },
                // Mesleki
                new Course { Id = 14, CourseName = "Muhasebe ve Finans", Description = "Temel muhasebe, bilanço okuma, vergi mevzuatı ve finansal analiz.", ImageUrl = "https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?w=600", CategoryId = 8, Quota = 30, DurationHours = 90, StartDate = new DateTime(2026, 5, 1), EndDate = new DateTime(2026, 8, 1), IsActive = true },
                new Course { Id = 15, CourseName = "Girişimcilik Atölyesi", Description = "İş planı oluşturma, pazarlama stratejileri, dijital girişimcilik ve hibe programları.", ImageUrl = "https://images.unsplash.com/photo-1559136555-9303baea8ebd?w=600", CategoryId = 8, Quota = 25, DurationHours = 40, StartDate = new DateTime(2026, 6, 15), EndDate = new DateTime(2026, 8, 15), IsActive = true }
            );

            // ===== SEED DATA: EĞİTMENLER =====
            modelBuilder.Entity<Instructor>().HasData(
                new Instructor { Id = 1, FullName = "Dr. Ahmet Yılmaz", Title = "Bilişim Teknolojileri Öğretmeni", CourseId = 1 },
                new Instructor { Id = 2, FullName = "Elif Kaya", Title = "Web Tasarım Uzmanı", CourseId = 2 },
                new Instructor { Id = 3, FullName = "Mehmet Demir", Title = "Bilgisayar Eğitmeni", CourseId = 3 },
                new Instructor { Id = 4, FullName = "Sarah Johnson", Title = "İngilizce Öğretmeni", CourseId = 4 },
                new Instructor { Id = 5, FullName = "Hans Weber", Title = "Almanca Öğretmeni", CourseId = 5 },
                new Instructor { Id = 6, FullName = "Zeynep Arslan", Title = "El Sanatları Ustası", CourseId = 6 },
                new Instructor { Id = 7, FullName = "Fatma Çelik", Title = "Seramik Sanatçısı", CourseId = 7 },
                new Instructor { Id = 8, FullName = "Can Özkan", Title = "Müzik Öğretmeni", CourseId = 8 },
                new Instructor { Id = 9, FullName = "Hasan Korkmaz", Title = "Halk Müziği Sanatçısı", CourseId = 9 },
                new Instructor { Id = 10, FullName = "Ayşe Yıldırım", Title = "Yoga Eğitmeni", CourseId = 10 },
                new Instructor { Id = 11, FullName = "Şef Mustafa Bey", Title = "Aşçıbaşı", CourseId = 11 },
                new Instructor { Id = 12, FullName = "Pınar Aydın", Title = "Pastacılık Ustası", CourseId = 12 },
                new Instructor { Id = 13, FullName = "Derya Şahin", Title = "Kuaför / Güzellik Uzmanı", CourseId = 13 },
                new Instructor { Id = 14, FullName = "Burak Öztürk", Title = "Mali Müşavir", CourseId = 14 },
                new Instructor { Id = 15, FullName = "Prof. Dr. Selin Aktaş", Title = "Girişimcilik Danışmanı", CourseId = 15 }
            );

            // ===== SEED DATA: HABERLER =====
            modelBuilder.Entity<News>().HasData(
                new News { Id = 1, Title = "2026 Yaz Dönemi Kayıtları Başladı!", Content = "Halk Eğitim Merkezimizin 2026 yaz dönemi kurs kayıtları başlamıştır. 15 farklı branşta ücretsiz eğitim fırsatı! Kontenjanlar sınırlıdır, acele edin.", Date = new DateTime(2026, 4, 1), PublishDate = new DateTime(2026, 4, 1), PosterUrl = "https://images.unsplash.com/photo-1523050854058-8df90110c476?w=600" },
                new News { Id = 2, Title = "Python Programlama Kursu Açıldı", Content = "Bilişim teknolojileri kategorisinde yeni Python Programlama kursu açılmıştır. Yapay zeka ve veri bilimi alanına adım atmak isteyenler için harika bir fırsat.", Date = new DateTime(2026, 4, 5), PublishDate = new DateTime(2026, 4, 5), PosterUrl = "https://images.unsplash.com/photo-1526379095098-d400fd0bf935?w=600" },
                new News { Id = 3, Title = "Sertifika Töreni Gerçekleştirildi", Content = "2025-2026 eğitim dönemini başarıyla tamamlayan 450 kursiyerimize sertifikaları düzenlenen törenle verildi. Tüm mezunlarımızı tebrik ederiz.", Date = new DateTime(2026, 3, 20), PublishDate = new DateTime(2026, 3, 20), PosterUrl = "https://images.unsplash.com/photo-1523580494863-6f3031224c94?w=600" },
                new News { Id = 4, Title = "Ücretsiz Girişimcilik Semineri", Content = "KOSGEB işbirliğiyle düzenlenen ücretsiz girişimcilik semineri 15 Haziran'da merkezimizde gerçekleştirilecektir. Tüm vatandaşlarımız davetlidir.", Date = new DateTime(2026, 4, 8), PublishDate = new DateTime(2026, 4, 8), PosterUrl = "https://images.unsplash.com/photo-1559136555-9303baea8ebd?w=600" }
            );

            // ===== SEED DATA: BAŞVURULAR =====
            modelBuilder.Entity<Application>().HasData(
                new Application { Id = 1, FirstName = "Ali", LastName = "Koç", PhoneNumber = "0532 111 22 33", Email = "ali.koc@email.com", CourseId = 1, ApplyDate = new DateTime(2026, 1, 2), Status = ApplicationStatus.Approved, TcNo = "12345678901", IsCompleted = true, CertificateCode = "HE-2026-0001" },
                new Application { Id = 2, FirstName = "Ayşe", LastName = "Demir", PhoneNumber = "0533 222 33 44", Email = "ayse.demir@email.com", CourseId = 4, ApplyDate = new DateTime(2026, 2, 3), Status = ApplicationStatus.Approved, TcNo = "23456789012", IsCompleted = true, CertificateCode = "HE-2026-0002" },
                new Application { Id = 8, FirstName = "Derya", LastName = "Öztürk", PhoneNumber = "0539 888 99 00", Email = "derya.ozturk@email.com", CourseId = 14, ApplyDate = new DateTime(2026, 4, 7), Status = ApplicationStatus.Approved, TcNo = "89012345678" },
                new Application { Id = 3, FirstName = "Mehmet", LastName = "Yılmaz", PhoneNumber = "0534 333 44 55", Email = "mehmet.yilmaz@email.com", CourseId = 8, ApplyDate = new DateTime(2026, 4, 4), Status = ApplicationStatus.Pending, TcNo = "34567890123" },
                new Application { Id = 4, FirstName = "Fatma", LastName = "Kara", PhoneNumber = "0535 444 55 66", Email = "fatma.kara@email.com", CourseId = 11, ApplyDate = new DateTime(2026, 4, 5), Status = ApplicationStatus.Pending, TcNo = "45678901234" },
                new Application { Id = 5, FirstName = "Hasan", LastName = "Çelik", PhoneNumber = "0536 555 66 77", Email = "hasan.celik@email.com", CourseId = 2, ApplyDate = new DateTime(2026, 4, 5), Status = ApplicationStatus.Rejected, AdminNote = "Kontenjan doldu.", TcNo = "56789012345" },
                new Application { Id = 6, FirstName = "Zeynep", LastName = "Aydın", PhoneNumber = "0537 666 77 88", Email = "zeynep.aydin@email.com", CourseId = 10, ApplyDate = new DateTime(2026, 4, 6), Status = ApplicationStatus.Approved, TcNo = "67890123456" },
                new Application { Id = 7, FirstName = "Emre", LastName = "Şahin", PhoneNumber = "0538 777 88 99", Email = "emre.sahin@email.com", CourseId = 13, ApplyDate = new DateTime(2026, 4, 7), Status = ApplicationStatus.Pending, TcNo = "78901234567" }
            );
        }
    }
}