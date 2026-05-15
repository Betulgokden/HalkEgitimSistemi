using Microsoft.EntityFrameworkCore;
using HalkEgitimSistemi.Models;
using System;
using System.Collections.Generic;

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
        public DbSet<GalleryItem> GalleryItems { get; set; }
        public DbSet<AdminUser> AdminUsers { get; set; }
        public DbSet<Attendance> Attendances { get; set; }
        public DbSet<CourseResource> CourseResources { get; set; }
        public DbSet<LogEntry> LogEntries { get; set; }
        public DbSet<CourseReview> CourseReviews { get; set; }
        public DbSet<Student> Students { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public DbSet<Certificate> Certificates { get; set; }
        public DbSet<ExhibitionItem> ExhibitionItems { get; set; }
        public DbSet<MasterTrainerApplication> MasterTrainerApplications { get; set; }
        public DbSet<CalendarEvent> CalendarEvents { get; set; }
        public DbSet<EmailLog> EmailLogs { get; set; }
        public DbSet<Message> Messages { get; set; }
        public DbSet<InstructorSchedule> InstructorSchedules { get; set; }
        public DbSet<TemporaryLink> TemporaryLinks { get; set; }
        public DbSet<SuccessStory> SuccessStories { get; set; }
        public DbSet<NewsStory> NewsStories { get; set; }
        public DbSet<NewsComment> NewsComments { get; set; }
        public DbSet<NewsLike> NewsLikes { get; set; }
        public DbSet<GalleryComment> GalleryComments { get; set; }
        public DbSet<GalleryLike> GalleryLikes { get; set; }
        public DbSet<JobPosting> JobPostings { get; set; }
        public DbSet<TeacherChatMessage> TeacherChatMessages { get; set; }
        public DbSet<CourseChatMessage> CourseChatMessages { get; set; }
        public DbSet<ProfanityBan> ProfanityBans { get; set; }
        public DbSet<Complaint> Complaints { get; set; }
        public DbSet<ForbiddenWord> ForbiddenWords { get; set; }
        public DbSet<Employer> Employers { get; set; }
        public DbSet<SiteSettings> SiteSettings { get; set; }
        public DbSet<SiteLog> SiteLogs { get; set; }
        public DbSet<JobApplication> JobApplications { get; set; }
        public DbSet<Neighborhood> Neighborhoods { get; set; }

        public DbSet<LibraryBook> LibraryBooks { get; set; }
        public DbSet<LibraryBookPage> LibraryBookPages { get; set; }
        public DbSet<Idea> Ideas { get; set; }
        public DbSet<QuizQuestion> QuizQuestions { get; set; }
        public DbSet<QuizMatch> QuizMatches { get; set; }
        public DbSet<AcademicNote> AcademicNotes { get; set; }
        public DbSet<AcademicTest> AcademicTests { get; set; }
        public DbSet<AcademicQuestion> AcademicQuestions { get; set; }
        public DbSet<PromoCode> PromoCodes { get; set; }
        public DbSet<HalkPointActivity> HalkPointActivities { get; set; }
        public DbSet<HalkPointCode> HalkPointCodes { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.ConfigureWarnings(w => w.Ignore(Microsoft.EntityFrameworkCore.Diagnostics.RelationalEventId.PendingModelChangesWarning));
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Ä°liÅŸkiler
            modelBuilder.Entity<Comment>()
                .HasOne(c => c.Course)
                .WithMany(course => course.Comments)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<LibraryBookPage>()
                .HasOne(p => p.LibraryBook)
                .WithMany(b => b.Pages)
                .HasForeignKey(p => p.LibraryBookId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Attendance>()
                .HasOne(a => a.Course)
                .WithMany(c => c.Attendances)
                .HasForeignKey(a => a.CourseId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<CourseReview>()
                .HasOne(r => r.Course)
                .WithMany(c => c.CourseReviews)
                .HasForeignKey(r => r.CourseId)
                .OnDelete(DeleteBehavior.Restrict);
            
            modelBuilder.Entity<Student>()
                .HasIndex(s => s.TcNo)
                .IsUnique();

            modelBuilder.Entity<Student>()
                .HasIndex(s => s.Email);

            modelBuilder.Entity<Course>()
                .HasIndex(c => c.CourseName);

            modelBuilder.Entity<Application>()
                .HasIndex(a => a.Email);

            modelBuilder.Entity<Application>()
                .HasIndex(a => a.Status);

            modelBuilder.Entity<Instructor>()
                .HasIndex(i => i.FullName);

            // ===== SEED DATA: ADMIN USER =====
            modelBuilder.Entity<AdminUser>().HasData(
                new AdminUser { Id = 1, Username = "Betül", Password = "0808", FullName = "Betül Gökden" }
            );

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
                new Course { Id = 1, CourseName = "Yapay Zeka Destekli Python Programlama", CategoryId = 1, Quota = 25, DurationHours = 80, StartDate = new DateTime(2026, 5, 1), EndDate = new DateTime(2026, 7, 31), IsActive = true, MaxAbsenceLimit = 4, Price = 500, ImageUrl = "https://images.unsplash.com/photo-1526379095098-d400fd0bf935?w=600&fm=webp&fm=webp" },
                new Course { Id = 2, CourseName = "Modern Web Tasarım", CategoryId = 1, Quota = 30, DurationHours = 60, StartDate = new DateTime(2026, 5, 15), EndDate = new DateTime(2026, 7, 15), IsActive = true, MaxAbsenceLimit = 4, Price = 500, ImageUrl = "https://images.unsplash.com/photo-1547658719-da2b51169166?w=600&fm=webp&fm=webp" },
                new Course { Id = 3, CourseName = "Bilgisayar İşletmenliği", CategoryId = 1, Quota = 35, DurationHours = 120, StartDate = new DateTime(2026, 4, 15), EndDate = new DateTime(2026, 8, 15), IsActive = true, MaxAbsenceLimit = 4, Price = 500, ImageUrl = "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=600&fm=webp&fm=webp" },
                new Course { Id = 4, CourseName = "İngilizce A1-A2", CategoryId = 2, Quota = 20, DurationHours = 90, StartDate = new DateTime(2026, 5, 1), EndDate = new DateTime(2026, 8, 1), IsActive = true, MaxAbsenceLimit = 4, Price = 500, ImageUrl = "https://images.unsplash.com/photo-1543109740-4bdb38fda756?w=600&fm=webp" },
                new Course { Id = 5, CourseName = "Almanca A1", CategoryId = 2, Quota = 15, DurationHours = 60, StartDate = new DateTime(2026, 6, 1), EndDate = new DateTime(2026, 8, 30), IsActive = true, MaxAbsenceLimit = 4, Price = 1000, ImageUrl = "https://images.unsplash.com/photo-1527866959252-deab85ef7d1b?w=600&fm=webp" },
                new Course { Id = 6, CourseName = "Ahşap Boyama", CategoryId = 3, Quota = 20, DurationHours = 40, StartDate = new DateTime(2026, 5, 10), EndDate = new DateTime(2026, 7, 10), IsActive = true, MaxAbsenceLimit = 4, Price = 1000, ImageUrl = "https://images.unsplash.com/photo-1513364776144-60967b0f800f?w=600&fm=webp" },
                new Course { Id = 7, CourseName = "Geleneksel Seramik", CategoryId = 3, Quota = 15, DurationHours = 50, StartDate = new DateTime(2026, 5, 20), EndDate = new DateTime(2026, 8, 20), IsActive = true, MaxAbsenceLimit = 4, Price = 750, ImageUrl = "https://images.unsplash.com/photo-1565193566173-7a0ee3dbe261?w=600&fm=webp" },
                new Course { Id = 8, CourseName = "Gitar Eğitimi", CategoryId = 4, Quota = 12, DurationHours = 45, StartDate = new DateTime(2026, 5, 5), EndDate = new DateTime(2026, 7, 30), IsActive = true, MaxAbsenceLimit = 4, Price = 750, ImageUrl = "https://images.unsplash.com/photo-1510915361894-db8b60106cb1?w=600&fm=webp" },
                new Course { Id = 9, CourseName = "Bağlama Kursu", CategoryId = 4, Quota = 15, DurationHours = 50, StartDate = new DateTime(2026, 6, 1), EndDate = new DateTime(2026, 8, 30), IsActive = true, MaxAbsenceLimit = 4, Price = 520, ImageUrl = "https://images.unsplash.com/photo-1507838153414-b4b713384a76?w=600&fm=webp" },
                new Course { Id = 10, CourseName = "Yoga ve Pilates", CategoryId = 5, Quota = 25, DurationHours = 36, StartDate = new DateTime(2026, 5, 1), EndDate = new DateTime(2026, 7, 31), IsActive = true, MaxAbsenceLimit = 4, Price = 680, ImageUrl = "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=600&fm=webp" },
                new Course { Id = 11, CourseName = "Türk Mutfağı", CategoryId = 6, Quota = 18, DurationHours = 60, StartDate = new DateTime(2026, 5, 10), EndDate = new DateTime(2026, 7, 30), IsActive = true, MaxAbsenceLimit = 4, Price = 720, ImageUrl = "https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=600&fm=webp" },
                new Course { Id = 12, CourseName = "Pastacılık", CategoryId = 6, Quota = 15, DurationHours = 50, StartDate = new DateTime(2026, 6, 1), EndDate = new DateTime(2026, 8, 15), IsActive = true, MaxAbsenceLimit = 4, Price = 840, ImageUrl = "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=600&fm=webp" },
                new Course { Id = 13, CourseName = "Cilt Bakımı", CategoryId = 7, Quota = 12, DurationHours = 72, StartDate = new DateTime(2026, 5, 15), EndDate = new DateTime(2026, 8, 15), IsActive = true, MaxAbsenceLimit = 6, Price = 950, ImageUrl = "https://images.unsplash.com/photo-1560750588-73207b1ef5b8?w=600&fm=webp" },
                new Course { Id = 14, CourseName = "Dijital Muhasebe", CategoryId = 8, Quota = 30, DurationHours = 90, StartDate = new DateTime(2026, 5, 1), EndDate = new DateTime(2026, 8, 1), IsActive = true, MaxAbsenceLimit = 4, Price = 760, ImageUrl = "https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?w=600&fm=webp" },
                new Course { Id = 15, CourseName = "E-Ticaret Atölyesi", CategoryId = 8, Quota = 25, DurationHours = 40, StartDate = new DateTime(2026, 6, 15), EndDate = new DateTime(2026, 8, 15), IsActive = true, MaxAbsenceLimit = 4, Price = 590, ImageUrl = "https://images.unsplash.com/photo-1559136555-9303baea8ebd?w=600&fm=webp" },
                new Course { Id = 16, CourseName = "Siber Güvenlik", CategoryId = 1, Quota = 20, DurationHours = 64, StartDate = new DateTime(2026, 9, 1), EndDate = new DateTime(2026, 11, 1), IsActive = true, MaxAbsenceLimit = 6, Price = 0, ImageUrl = "https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=600&fm=webp" },
                new Course { Id = 17, CourseName = "Profesyonel Arıcılık ve Bal Üretimi", CategoryId = 8, Quota = 30, DurationHours = 40, StartDate = new DateTime(2026, 5, 20), EndDate = new DateTime(2026, 6, 30), IsActive = true, MaxAbsenceLimit = 4, Price = 300, ImageUrl = "https://images.unsplash.com/photo-1587334206571-3390ccc205df?w=600&fm=webp" },
                new Course { Id = 18, CourseName = "Modern Seralarda Organik Tarım", CategoryId = 8, Quota = 25, DurationHours = 60, StartDate = new DateTime(2026, 5, 25), EndDate = new DateTime(2026, 7, 25), IsActive = true, MaxAbsenceLimit = 4, Price = 450, ImageUrl = "https://images.unsplash.com/photo-1592419044706-39796d40f98c?w=600&fm=webp" },
                new Course { Id = 19, CourseName = "Unity ile Oyun Geliştirme", CategoryId = 1, Description = "2D ve 3D oyunlar yapmayı öğrenin. C# programlama ve Unity arayüzü.", ImageUrl = "https://images.unsplash.com/photo-1552824236-41102881ad24?w=600", IsActive = true, StartDate = DateTime.Now.AddDays(30), DurationHours = 80, Quota = 20, Price = 750 },
                new Course { Id = 20, CourseName = "Piyano Eğitimi (Başlangıç)", CategoryId = 4, Description = "Nota okuma ve temel piyano teknikleri. Müziğin büyülü dünyasına adım atın.", ImageUrl = "https://images.unsplash.com/photo-1520529611442-eaf5f228497b?w=600", IsActive = true, StartDate = DateTime.Now.AddDays(5), DurationHours = 48, Quota = 10, Price = 750 },
                new Course { Id = 21, CourseName = "Dijital Pazarlama ve SEO", CategoryId = 1, Description = "İşinizi dijital dünyada büyütmenin yollarını öğrenin. Google Ads, Meta Ads ve SEO teknikleri.", ImageUrl = "https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=600", IsActive = true, StartDate = DateTime.Now.AddDays(15), DurationHours = 40, Quota = 30, Price = 500 },
                new Course { Id = 22, CourseName = "Python ile Veri Analizi", CategoryId = 1, Description = "Pandas, Numpy ve Matplotlib kütüphaneleri ile veriden anlamlı sonuçlar çıkarın.", ImageUrl = "https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=600", IsActive = true, StartDate = DateTime.Now.AddDays(20), DurationHours = 60, Quota = 25, Price = 600 },
                new Course { Id = 23, CourseName = "Yaratıcı Yazarlık Atölyesi", CategoryId = 3, Description = "Kendi hikayenizi yazmaya başlayın. Karakter gelişimi ve kurgu teknikleri.", ImageUrl = "https://images.unsplash.com/photo-1455390582262-044cdead277a?w=600", IsActive = true, StartDate = DateTime.Now.AddDays(10), DurationHours = 24, Quota = 15, Price = 400 },
                new Course { Id = 24, CourseName = "Temel Fotoğrafçılık", CategoryId = 3, Description = "Işık, kompozisyon ve teknik ayarlar. Makinenizi tanıyın ve harika kareler yakalayın.", ImageUrl = "https://images.unsplash.com/photo-1452784444945-3f422708fe5e?w=600", IsActive = true, StartDate = DateTime.Now.AddDays(25), DurationHours = 32, Quota = 20, Price = 450 },
                new Course { Id = 25, CourseName = "Robotik Kodlama ve Arduino", CategoryId = 1, Description = "Elektronik devreler kurun, Arduino ile kendi robotunuzu programlayın. STEM odaklı eğitim.", ImageUrl = "https://images.unsplash.com/photo-1561557944-6e7860d1a7eb?w=600", IsActive = true, StartDate = DateTime.Now.AddDays(40), DurationHours = 56, Quota = 18, Price = 300 },
                new Course { Id = 26, CourseName = "İleri Seviye Siber Güvenlik", CategoryId = 1, Description = "Sızma testleri, ağ güvenliği ve adli bilişim teknikleri ile uzmanlaşın.", ImageUrl = "https://images.unsplash.com/photo-1563986768609-322da13575f3?w=600", IsActive = true, StartDate = DateTime.Now.AddDays(45), DurationHours = 120, Quota = 15, Price = 1200 },
                new Course { Id = 27, CourseName = "Karagöl Doğa Fotoğrafçılığı", CategoryId = 3, Description = "Borçka Karagöl'ün muhteşem doğasında uygulamalı fotoğrafçılık eğitimi.", ImageUrl = "https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=600", IsActive = true, StartDate = DateTime.Now.AddDays(12), DurationHours = 20, Quota = 12, Price = 0 },
                new Course { Id = 28, CourseName = "Arıcılık ve Modern Kovan Yönetimi", CategoryId = 8, Description = "Artvin balının kalitesini artıracak modern arıcılık teknikleri ve hastalıkla mücadele.", ImageUrl = "https://images.unsplash.com/photo-1587334206571-3390ccc205df?w=600", IsActive = true, StartDate = DateTime.Now.AddDays(20), DurationHours = 40, Quota = 40, Price = 0 },
                new Course { Id = 29, CourseName = "Mobilya Tasarımı ve Üretimi", CategoryId = 3, Description = "Ahşap işleme, modern mobilya tasarımı ve CNC operatörlüğü temelleri.", ImageUrl = "https://images.unsplash.com/photo-1538688505391-aaaf94503040?w=600", IsActive = true, StartDate = DateTime.Now.AddDays(35), DurationHours = 96, Quota = 15, Price = 500 },
                new Course { Id = 30, CourseName = "İlk Yardım Sertifika Programı", CategoryId = 5, Description = "Hayati öneme sahip ilk yardım teknikleri. MEB ve Sağlık Bakanlığı onaylı sertifika.", ImageUrl = "https://images.unsplash.com/photo-1516574187841-cb9cc2ca948b?w=600", IsActive = true, StartDate = DateTime.Now.AddDays(10), DurationHours = 16, Quota = 25, Price = 0 }
            );

            modelBuilder.Entity<Instructor>().HasData(
                new Instructor 
                { 
                    Id = 1, FullName = "Ahmet Yılmaz", Title = "Bilişim Teknolojileri Öğretmeni", CourseId = 1, Username = "ahmet", Password = "123", IsApproved = false, Address = "Borçka, Artvin", BirthYear = 1985,
                    Bio = "Yazılım dünyasına 15 yıl önce adım atan Ahmet Yılmaz, yapay zeka ve Python programlama konusunda ulusal çapta birçok ödüle sahiptir. Gençleri geleceğin teknolojileriyle buluşturmayı misyon edinmiştir.",
                    Education = "ODTÜ - Bilgisayar Mühendisliği (Lisans)\nBoğaziçi Üniversitesi - Yapay Zeka (Yüksek Lisans)",
                    Skills = "Python, Makine Öğrenmesi, Veri Bilimi, C#, Eğitim Teknolojileri"
                },
                new Instructor 
                { 
                    Id = 2, FullName = "Elif Kaya", Title = "Web Tasarım Uzmanı", CourseId = 2,
                    Bio = "10 yılı aşkın süredir sektörde aktif olarak UI/UX tasarım ve ön yüz geliştirme projelerinde yer almaktadır. Figma, Adobe Creative Cloud ve modern web teknolojileri konusunda uzmanlaşmıştır.",
                    Education = "İstanbul Teknik Üniversitesi - Endüstriyel Tasarım (Lisans)\nMarmara Üniversitesi - Grafik Tasarım (Yüksek Lisans)",
                    Skills = "UI/UX Design, Figma, HTML/CSS, Responsive Design, Adobe XD",
                    LinkedInUrl = "https://linkedin.com/in/elifkaya", PortfolioUrl = "https://elifkaya.design", ImageUrl = "/img/instructors/elif_kaya.png"
                },
                new Instructor 
                { 
                    Id = 3, FullName = "Mehmet Demir", Title = "Bilgisayar Eğitmeni", CourseId = 3,
                    Bio = "Kamu kurumları ve özel sektörde 20 yıllık sistem yöneticiliği tecrübesine sahip olan Mehmet Demir, ofis yazılımları ve temel bilgisayar ağları konusunda yüzlerce kursiyer mezun etmiştir.",
                    Education = "Karadeniz Teknik Üniversitesi - Bilgisayar Teknolojileri",
                    Skills = "Windows Server, Microsoft Office, Ağ Güvenliği, Donanım"
                },
                new Instructor 
                { 
                    Id = 4, FullName = "Sarah Johnson", Title = "İngilizce Öğretmeni", CourseId = 4,
                    Bio = "Ana dili İngilizce olan Sarah, CELTA ve TEFL sertifikalarına sahiptir. 8 yıldır Türkiye'de her yaş grubuna yenilikçi metotlarla İngilizce konuşma ve yazma eğitimleri vermektedir.",
                    Education = "University of London - English Literature\nCambridge CELTA Certification",
                    Skills = "İngilizce (Anadil), Konuşma Pratiği, IELTS/TOEFL Hazırlık, Pedagoji"
                },
                new Instructor 
                { 
                    Id = 5, FullName = "Hans Weber", Title = "Almanca Öğretmeni", CourseId = 5,
                    Bio = "Goethe Enstitüsü geçmişine sahip olan Hans, Almanca dilinin mantığını ve Alman kültürünü kursiyerlere interaktif bir şekilde aktararak dil öğrenimini keyifli hale getiriyor.",
                    Education = "Ludwig-Maximilians-Universität München - Germanistik",
                    Skills = "Almanca A1-C1, Telc Sınav Hazırlığı, Kültürel Entegrasyon"
                },
                new Instructor 
                { 
                    Id = 6, FullName = "Zeynep Arslan", Title = "El Sanatları Ustası", CourseId = 6,
                    Bio = "Kültür Bakanlığı onaylı El Sanatları ustası olan Zeynep Hanım, ahşap boyama ve geleneksel Türk motifleri üzerine eserler üretmekte ve sergiler açmaktadır.",
                    Education = "Mimar Sinan Güzel Sanatlar Üniversitesi - Geleneksel Türk Sanatları",
                    Skills = "Ahşap Boyama, Ebru Sanatı, Hat Sanatı, Motif Tasarımı"
                },
                new Instructor 
                { 
                    Id = 7, FullName = "Fatma Çelik", Title = "Seramik Sanatçısı", CourseId = 7,
                    Bio = "Toprağa şekil vermeyi hayat felsefesi olarak gören Fatma Çelik, modern ve geleneksel seramik sanatını harmanlayarak atölyesinde eşsiz eserler ortaya çıkarıyor.",
                    Education = "Hacettepe Üniversitesi - Seramik ve Cam Bölümü",
                    Skills = "Seramik Şekillendirme, Sırlama Teknikleri, Çini İşlemeciliği"
                },
                new Instructor 
                { 
                    Id = 8, FullName = "Can Özkan", Title = "Müzik Öğretmeni", CourseId = 8,
                    Bio = "Klasik gitar ve piyano alanında konservatuar eğitimi almış olan Can Özkan, çok sesli korolarda şeflik yapmış ve sayısız müzisyen yetiştirmiştir.",
                    Education = "Ankara Devlet Konservatuarı - Müzik Teorisi ve Kompozisyon",
                    Skills = "Klasik Gitar, Piyano, Solfej, Armoni"
                },
                new Instructor 
                { 
                    Id = 9, FullName = "Hasan Korkmaz", Title = "Halk Müziği Sanatçısı", CourseId = 9,
                    Bio = "Anadolu'nun ezgilerini nesilden nesile aktarmayı görev edinen Hasan Korkmaz, bağlama virtüözü olup yurt içi ve yurt dışı birçok festivalde sahne almıştır.",
                    Education = "Ege Üniversitesi - Türk Musikisi Devlet Konservatuarı",
                    Skills = "Bağlama, Türk Halk Müziği Repertuarı, Şan Eğitimi"
                },
                new Instructor 
                { 
                    Id = 10, FullName = "Ayşe Yıldırım", Title = "Yoga Eğitmeni", CourseId = 10,
                    Bio = "Hindistan'da aldığı 500 saatlik Yoga Alliance eğitiminin ardından, beden ve zihin sağlığını geliştirmeye yönelik nefes terapileri ve Hatha Yoga dersleri vermektedir.",
                    Education = "Rishikesh Yoga Academy (RYT 500)\nSpor Bilimleri Fakültesi",
                    Skills = "Hatha Yoga, Nefes Terapisi, Meditasyon, Anatomi"
                },
                new Instructor 
                { 
                    Id = 11, FullName = "Şef Mustafa Bey", Title = "Aşçıbaşı", CourseId = 11,
                    Bio = "Uluslararası mutfaklarda 25 yıllık şeflik deneyimi olan Mustafa Bey, Michelin yıldızlı restoranlardaki tecrübesini yerel Türk mutfağıyla birleştirerek eşsiz tarifler öğretiyor.",
                    Education = "Le Cordon Bleu Paris - Culinary Arts\nMengen Aşçılık Meslek Lisesi",
                    Skills = "Dünya Mutfağı, Türk Mutfağı, Menü Planlama, Mutfak Yönetimi"
                },
                new Instructor 
                { 
                    Id = 12, FullName = "Pınar Aydın", Title = "Pastacılık Ustası", CourseId = 12,
                    Bio = "Butik pastacılık ve çikolata tasarımında kendi markasını kurmuş olan Pınar Aydın, görsel şölene dönüşen tatlıların tüm sırlarını öğrencileriyle paylaşıyor.",
                    Education = "Gastronomi ve Mutfak Sanatları Lisans Eğitimi",
                    Skills = "Butik Pasta Tasarımı, Çikolata Yapımı, Fransız Tatlıları"
                },
                new Instructor 
                { 
                    Id = 13, FullName = "Derya Şahin", Title = "Güzellik Uzmanı", CourseId = 13,
                    Bio = "Medikal estetik ve cilt bakımı uzmanı Derya Şahin, en yeni güzellik teknolojileri ve dermatolojik testlerden geçmiş doğal yöntemlerle sektörde profesyoneller yetiştiriyor.",
                    Education = "Güzellik ve Saç Bakım Hizmetleri Uzmanlık Eğitimi",
                    Skills = "Cilt Bakımı, Lazer Epilasyon, Profesyonel Makyaj, Anatomi"
                },
                new Instructor 
                { 
                    Id = 14, FullName = "Burak Öztürk", Title = "Mali Müşavir", CourseId = 14,
                    Bio = "Kurumsal şirketlerde finans direktörlüğü yapmış olan Burak Öztürk, e-ticaret muhasebesi, vergi mevzuatı ve finansal okuryazarlık alanlarında danışmanlık yapmaktadır.",
                    Education = "Gazi Üniversitesi - İşletme\nSMMM Ruhsatı",
                    Skills = "Genel Muhasebe, Finansal Analiz, E-Ticaret Vergilendirme, Excel"
                },
                new Instructor 
                { 
                    Id = 15, FullName = "Prof. Dr. Selin Aktaş", Title = "Girişimcilik Danışmanı", CourseId = 15,
                    Bio = "Sayısız start-up'a mentörlük yapan Prof. Dr. Selin Aktaş, melek yatırımcı ağlarıyla olan bağlantıları ve inovasyon stratejileri sayesinde girişimcilere yol gösteriyor.",
                    Education = "Stanford University - Business Administration (Ph.D.)",
                    Skills = "İş Geliştirme, Melek Yatırım, KOSGEB Danışmanlığı, Start-up Yönetimi"
                },
                new Instructor 
                { 
                    Id = 16, FullName = "Caner Kandemir", Title = "Kıdemli Güvenlik Analisti", CourseId = 16, Username = "caner", Password = "123",
                    Bio = "Siber güvenlik alanında CEH ve CISSP sertifikalarına sahip Caner Kandemir, kurumların ağ güvenlik mimarilerini test eden etik bir hacker ve güvenlik araştırmacısıdır.",
                    Education = "Bilkent Üniversitesi - Bilgisayar Mühendisliği\nCertified Ethical Hacker (CEH)",
                    Skills = "Ağ Güvenliği, Penetrasyon Testleri, Kriptografi, Sızma Testi"
                }
            );

            modelBuilder.Entity<News>().HasData(
                new News { Id = 1, Title = "2026 Yaz Dönemi Kayıtları Başladı!", Content = "Halk Eğitim Merkezimizin 2026 yaz dönemi kurs kayıtları başlamıştır. 15 farklı branşta ücretsiz eğitim fırsatı!", Date = new DateTime(2026, 4, 1), PublishDate = new DateTime(2026, 4, 1), ImageUrl = "/images/news/summer_registrations.png" },
                new News { Id = 2, Title = "Python Programlama Kursu Açıldı", Content = "Bilişim teknolojileri kategorisinde yeni Python Programlama kursu açılmıştır. Yapay zeka ve veri bilimi için harika fırsat.", Date = new DateTime(2026, 4, 5), PublishDate = new DateTime(2026, 4, 5), ImageUrl = "/images/news/python_course.png" },
                new News { Id = 3, Title = "Sertifika Töreni Gerçekleştirildi", Content = "2025-2026 eğitim dönemini başarıyla tamamlayan 450 kursiyerimize sertifikaları verildi.", Date = new DateTime(2026, 3, 20), PublishDate = new DateTime(2026, 3, 20), ImageUrl = "/images/news/certificate_ceremony.png" },
                new News { Id = 4, Title = "Ücretsiz Girişimcilik Semineri", Content = "KOSGEB işbirliğiyle düzenlenen ücretsiz girişimcilik semineri 15 Haziran'da.", Date = new DateTime(2026, 4, 8), PublishDate = new DateTime(2026, 4, 8), ImageUrl = "/images/news/entrepreneurship.png" },
                new News { Id = 5, Title = "Robotik Kodlama Yarışması", Content = "Merkezimiz bünyesinde düzenlenecek olan 'Genç Mucitler' yarışması için başvurular başladı.", Date = new DateTime(2026, 5, 1), PublishDate = new DateTime(2026, 5, 1), ImageUrl = "/images/news/robotics.png" },
                new News { Id = 6, Title = "Geleneksel El Sanatları Sergisi", Content = "Yıl boyunca hazırlanan nadide eserler, 20 Mayıs'ta kapılarını açıyor.", Date = new DateTime(2026, 5, 2), PublishDate = new DateTime(2026, 5, 2), ImageUrl = "/images/news/exhibition.png" },
                new News { Id = 7, Title = "İngilizce Konuşma Kulübü", Content = "Her Cumartesi 'English Speaking Club' ile dil becerilerinizi geliştirin.", Date = new DateTime(2026, 5, 3), PublishDate = new DateTime(2026, 5, 3), ImageUrl = "/images/news/speaking_club.png" },
                new News { Id = 8, Title = "Modern Gastronomi Atölyesi", Content = "Dünya mutfağının seçkin lezzetlerini şeflerden öğrenin.", Date = new DateTime(2026, 5, 4), PublishDate = new DateTime(2026, 5, 4), ImageUrl = "/images/news/gastronomy.png" }
            );

            modelBuilder.Entity<GalleryItem>().HasData(
                new GalleryItem { Id = 1, ImageUrl = "/images/news/python_course.png", Title = "Bilgisayar Okuryazarlığı", Description = "Temel bilişim eğitimlerimiz." },
                new GalleryItem { Id = 2, ImageUrl = "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=800", Title = "Etkili İletişim", Description = "Grup çalışmaları." },
                new GalleryItem { Id = 3, ImageUrl = "https://images.unsplash.com/photo-1542831371-29b0f74f9713?w=800", Title = "Yazılım Geliştirme", Description = "İleri seviye kodlama." },
                new GalleryItem { Id = 4, ImageUrl = "/images/exhibition/ebru.png", Title = "Resim ve Sanat", Description = "Sanat atölyeleri." },
                new GalleryItem { Id = 5, ImageUrl = "/images/news/gastronomy.png", Title = "Aşçılık ve Mutfak", Description = "Gurme lezzetler." },
                new GalleryItem { Id = 6, ImageUrl = "/images/news/speaking_club.png", Title = "Sunum Eğitimi", Description = "Konuşma etkinliği." },
                new GalleryItem { Id = 7, ImageUrl = "/images/news/certificate_ceremony.png", Title = "Gitar Eğitimleri", Description = "Müziğin ritmi." },
                new GalleryItem { Id = 8, ImageUrl = "/images/exhibition/ebru.png", Title = "Keman Sınıfı", Description = "Klasik müzik yetenekleri." },
                new GalleryItem { Id = 9, ImageUrl = "https://images.unsplash.com/photo-1518611012118-696072aa579a?w=800", Title = "Spor ve Yoga", Description = "Zihin ve beden bütünlüğü." },
                new GalleryItem { Id = 10, ImageUrl = "/images/news/entrepreneurship.png", Title = "Girişimcilik", Description = "Proje fikirleri." },
                new GalleryItem { Id = 11, ImageUrl = "/images/exhibition/robotics.png", Title = "Robotik Kodlama", Description = "Mucitler iş başında." },
                new GalleryItem { Id = 12, ImageUrl = "/images/news/gastronomy.png", Title = "Gastronomi Uzmanlığı", Description = "Dünya mutfakları." }
            );

            modelBuilder.Entity<Certificate>().HasData(
                new Certificate { Id = 1, TcNo = "12345678901", CertificateNo = "HE-2026-0001", FullName = "Ali Koç", CourseName = "Yapay Zeka Destekli Python Programlama", IssueDate = new DateTime(2026, 4, 15) },
                new Certificate { Id = 2, TcNo = "23456789012", CertificateNo = "HE-2026-0002", FullName = "Ayşe Demir", CourseName = "İngilizce A1-A2", IssueDate = new DateTime(2026, 4, 20) }
            );

            modelBuilder.Entity<ExhibitionItem>().HasData(
                new ExhibitionItem { Id = 1, Title = "Zarif Çeyizlik Dantel", ImageUrl = "/images/exhibition/lace.png", ArtistName = "Emine Yılmaz", CourseId = 6, PositionX = 0, PositionY = 1.6f, PositionZ = -6, RotationY = 0 },
                new ExhibitionItem { Id = 2, Title = "Geleneksel Çini Boyama", ImageUrl = "/images/exhibition/cini.png", ArtistName = "Fatma Demir", CourseId = 7, PositionX = 5.2f, PositionY = 1.6f, PositionZ = -3, RotationY = -60 },
                new ExhibitionItem { Id = 3, Title = "Altın İşlemeli Nakış", ImageUrl = "/images/exhibition/jewelry.png", ArtistName = "Zeynep Kaya", CourseId = 6, PositionX = 5.2f, PositionY = 1.6f, PositionZ = 3, RotationY = -120 },
                new ExhibitionItem { Id = 4, Title = "Ahşap Oyma Sanatı", ImageUrl = "/images/exhibition/wood_carving.png", ArtistName = "Ömer Çelik", CourseId = 7, PositionX = 0, PositionY = 1.6f, PositionZ = 6, RotationY = 180 },
                new ExhibitionItem { Id = 5, Title = "Gümüş Telkari İşçiliği", ImageUrl = "/images/exhibition/jewelry.png", ArtistName = "Ayşe Yıldız", CourseId = 6, PositionX = -5.2f, PositionY = 1.6f, PositionZ = 3, RotationY = 120 },
                new ExhibitionItem { Id = 6, Title = "Ebru Sanatı Ustası", ImageUrl = "/images/exhibition/ebru.png", ArtistName = "Mehmet Aydın", CourseId = 7, PositionX = -5.2f, PositionY = 1.6f, PositionZ = -3, RotationY = 60 }
            );

            modelBuilder.Entity<LibraryBook>().HasData(
                new LibraryBook { Id = 1, Title = "Ağ Teknolojileri Temelleri", Author = "Dr. Ahmet Yılmaz", Category = "Yazılım", CoverImageUrl = "https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=600", Description = "Ağ sistemlerinin derinliklerine inen kapsamlı bir rehber.", IsCourseNote = true, StarCount = 12, PositionX = -2f, PositionY = 1.5f, PositionZ = -4f, RotationY = 45 },
                new LibraryBook { Id = 2, Title = "Osmanlı Sanat Tarihi", Author = "Prof. Dr. İlber Ortaylı", Category = "Sanat", CoverImageUrl = "https://images.unsplash.com/photo-1589998059171-989d887df446?w=600", Description = "Geçmişten günümüze sanat yolculuğu.", IsCourseNote = true, StarCount = 8, PositionX = 2f, PositionY = 1.5f, PositionZ = -4f, RotationY = -45 }
            );

            modelBuilder.Entity<LibraryBookPage>().HasData(
                new LibraryBookPage { Id = 1, LibraryBookId = 1, PageNumber = 1, ImageUrl = "https://images.unsplash.com/photo-1522030299830-16b8d3d049fe?w=600", TextContent = "Ağ teknolojileri, modern bilgisayar iletişiminin temel taşıdır. OSI modelinden TCP/IP mimarisine kadar uzanan bu yolculukta veri paketlerinin nasıl yol bulduğunu inceleyeceğiz." },
                new LibraryBookPage { Id = 2, LibraryBookId = 1, PageNumber = 2, ImageUrl = "https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=600", TextContent = "Bölüm 2: Switch ve Router yapılandırmaları. Cihazların MAC adresleri ile paketleri nasıl yönlendirdiğini anlamak, yerel alan ağlarının (LAN) temelidir." },
                new LibraryBookPage { Id = 3, LibraryBookId = 1, PageNumber = 3, ImageUrl = "https://images.unsplash.com/photo-1518770660439-4636190af475?w=600", TextContent = "IPv4 ve IPv6 protokollerinin kıyaslanması: Neden yeni bir adresleme modeline ihtiyaç duyduk? Güvenlik protokollerinin entegrasyonu." },
                new LibraryBookPage { Id = 4, LibraryBookId = 2, PageNumber = 1, ImageUrl = "https://images.unsplash.com/photo-1563214157-9dbf9df35e61?w=600", TextContent = "Osmanlı dönemi el sanatları, Orta Asya, Selçuklu ve İslam motiflerinin mükemmel bir sentezi olarak karşımıza çıkar. Çini, hat ve ebru sanatları..." },
                new LibraryBookPage { Id = 5, LibraryBookId = 2, PageNumber = 2, ImageUrl = "https://images.unsplash.com/photo-1574620800171-86ebf4b16cb6?w=600", TextContent = "Çini sanatında kullanılan kobalt mavisi ve turkuaz renkleri, özellikle İznik çinilerinde zirveye ulaşmıştır. Desenler sadece süsleme değil, aynı zamanda felsefi mesajlar içerir." }
            );

            modelBuilder.Entity<CalendarEvent>().HasData(
                new CalendarEvent { Id = 1, Title = "Yaz Dönemi Kayıt Başlangıcı", Start = new DateTime(2026, 5, 1, 9, 0, 0), End = new DateTime(2026, 5, 1, 17, 0, 0), ColorCode = "#C5A059" },
                new CalendarEvent { Id = 2, Title = "Sertifika Töreni", Start = new DateTime(2026, 5, 15, 14, 0, 0), End = new DateTime(2026, 5, 15, 16, 0, 0), ColorCode = "#10b981" }
            );

            modelBuilder.Entity<InstructorSchedule>().HasData(
                new InstructorSchedule { Id = 1, InstructorId = 1, Day = "Monday", StartTime = new TimeSpan(9, 0, 0), EndTime = new TimeSpan(12, 0, 0), Note = "Python Giriş" }
            );

            modelBuilder.Entity<Student>().HasData(
                new Student { Id = 99, FirstName = "Betül", LastName = "Gökden", Email = "betul.gokden@halkegitim.com", Password = "123", TcNo = "12345678901", BirthDate = new DateTime(2000, 1, 1), BirthPlace = "Ankara", IsDeleted = false }
            );

            modelBuilder.Entity<NewsComment>().HasData(
                new NewsComment { Id = 1, NewsId = 1, UserEmail = "ali@mail.com", Content = "Harika haber!", CreatedAt = DateTime.Now.AddDays(-5) },
                new NewsComment { Id = 2, NewsId = 1, UserEmail = "ayse@mail.com", Content = "Takipteyiz, çok başarılı.", CreatedAt = DateTime.Now.AddDays(-4) }
            );

            modelBuilder.Entity<GalleryComment>().HasData(
                new GalleryComment { Id = 1, GalleryItemId = 1, UserEmail = "sanat@mail.com", Content = "Mükemmel bir eser!", CreatedAt = DateTime.Now.AddDays(-3) },
                new GalleryComment { Id = 2, GalleryItemId = 1, UserEmail = "ziyaretci@mail.com", Content = "Görülmeye değer.", CreatedAt = DateTime.Now.AddDays(-1) }
            );

            modelBuilder.Entity<Idea>().HasData(
                new Idea { Id = 1, Title = "Dijital Kurs Asistanı", Description = "Kursiyerlerin ödevlerini takip edebileceği bir mobil uygulama.", Category = "Dijitalleşme", AuthorName = "Betül Gökden", CreatedAt = DateTime.Now.AddDays(-10), Likes = 45 },
                new Idea { Id = 2, Title = "Gezici Sanat Atölyesi", Description = "Köy okullarına gidip çocuklara ebru sanatı öğretecek bir minibüs.", Category = "Sanat & Kültür", AuthorName = "Mehmet Demir", CreatedAt = DateTime.Now.AddDays(-5), Likes = 120 },
                new Idea { Id = 3, Title = "Atık Kumaş Dönüşümü", Description = "Dikiş nakış kurslarındaki atık kumaşlardan oyuncak yapıp bağışlama.", Category = "Sosyal Sorumluluk", AuthorName = "Fatma Çelik", CreatedAt = DateTime.Now.AddDays(-2), Likes = 88 }
            );

            // ===== SEED DATA: BİLGİ YARIŞMASI SORULARI =====
            modelBuilder.Entity<QuizQuestion>().HasData(
                new QuizQuestion { Id = 1, QuestionText = "Python'da liste sonuna eleman eklemek için hangi metod kullanılır?", OptionA = "add()", OptionB = "insert()", OptionC = "append()", OptionD = "push()", CorrectAnswer = "C", Difficulty = 1, Category = "Yazılım" },
                new QuizQuestion { Id = 2, QuestionText = "Aşağıdakilerden hangisi bir ağ topolojisi değildir?", OptionA = "Star", OptionB = "Bus", OptionC = "Moon", OptionD = "Ring", CorrectAnswer = "C", Difficulty = 1, Category = "Ağ Teknolojileri" },
                new QuizQuestion { Id = 3, QuestionText = "Geleneksel Ebru sanatında suyun kıvamını artırmak için ne kullanılır?", OptionA = "Kitre", OptionB = "Nişasta", OptionC = "Tutkal", OptionD = "Şeker", CorrectAnswer = "A", Difficulty = 2, Category = "El Sanatları" },
                new QuizQuestion { Id = 4, QuestionText = "Yapay zekada 'Makine Öğrenmesi' hangi ana dalın altındadır?", OptionA = "Biyoloji", OptionB = "Bilgisayar Bilimi", OptionC = "Sosyoloji", OptionD = "Fizik", CorrectAnswer = "B", Difficulty = 1, Category = "Yazılım" },
                new QuizQuestion { Id = 5, QuestionText = "Bir IP adresindeki 127.0.0.1 neyi temsil eder?", OptionA = "Ana Sunucu", OptionB = "Dış Ağ", OptionC = "Lokal Geri Döngü (Loopback)", OptionD = "Varsayılan Ağ Geçidi", CorrectAnswer = "C", Difficulty = 2, Category = "Ağ Teknolojileri" }
            );

            // ===== SEED DATA: MAHALLELER (HEATMAP) =====
            modelBuilder.Entity<Neighborhood>().HasData(
                new Neighborhood { Id = 1, Name = "Merkez Mahallesi", Latitude = 41.2583, Longitude = 41.6781, ActiveStudents = 120, CompletedCourses = 45, Intensity = 0.8 },
                new Neighborhood { Id = 2, Name = "Aksu Mahallesi", Latitude = 41.2500, Longitude = 41.6700, ActiveStudents = 85, CompletedCourses = 30, Intensity = 0.6 },
                new Neighborhood { Id = 3, Name = "Gündoğdu Mahallesi", Latitude = 41.2650, Longitude = 41.6850, ActiveStudents = 150, CompletedCourses = 65, Intensity = 0.95 },
                new Neighborhood { Id = 4, Name = "Yeniyol Mahallesi", Latitude = 41.2600, Longitude = 41.6650, ActiveStudents = 60, CompletedCourses = 20, Intensity = 0.4 },
                new Neighborhood { Id = 5, Name = "Arkaköy", Latitude = 41.2400, Longitude = 41.6500, ActiveStudents = 40, CompletedCourses = 15, Intensity = 0.3 }
            );

            // ===== SEED DATA: SİTE AYARLARI & HEDEFLER =====
            modelBuilder.Entity<SiteSettings>().HasData(
                new SiteSettings { Id = 1, Key = "KaragolGoalProgress", Value = "342", Group = "SocialResponsibility", UpdatedBy = "System", LastUpdated = DateTime.Now },
                new SiteSettings { Id = 2, Key = "KaragolGoalTarget", Value = "500", Group = "SocialResponsibility", UpdatedBy = "System", LastUpdated = DateTime.Now },
                new SiteSettings { Id = 3, Key = "LeaderNeighborhood", Value = "Gündoğdu Mahallesi", Group = "Stats", UpdatedBy = "System", LastUpdated = DateTime.Now }
            );

            // ===== SEED DATA: İŞ İLANLARI =====
            modelBuilder.Entity<JobPosting>().HasData(
                new JobPosting { Id = 1, EmployerId = 1, Title = "Kıdemli Python Geliştirici", Description = "Borçka Teknoloji Köyü projesinde görevlendirilmek üzere tecrübeli yazılımcılar aranıyor.", Requirements = "Python, Django/Flask, Veritabanı Yönetimi, Tercihen Borçka HEM mezunu.", SalaryRange = "45.000 TL - 65.000 TL", Location = "Borçka / Merkez", RequiredCategory = "Bilişim Teknolojileri", ExaminationText = "• Python temelleri ve ileri seviye veri yapılarını bilmeli\n• Django ORM ve REST Framework deneyimi olmalı\n• PostgreSQL veritabanı optimizasyonuna hakim olmalı\n• Docker ve CI/CD süreçlerini yönetebilmeli" },
                new JobPosting { Id = 2, EmployerId = 1, Title = "Mutfak Şefi / Gastronomi Uzmanı", Description = "Yerel lezzetlerin modern sunumuyla ilgilenecek şef arayışımız bulunmaktadır.", Requirements = "Aşçılık Sertifikası, En az 3 yıl deneyim, Hijyen Sertifikası.", SalaryRange = "35.000 TL - 45.000 TL", Location = "Borçka / Karagöl", RequiredCategory = "Aşçılık ve Pastacılık", ExaminationText = "• Modern sunum tekniklerine hakim olmalı\n• Yerel Artvin mutfağını ve malzemelerini tanımalı\n• Mutfak maliyet kontrolü ve stok yönetimi yapabilmeli\n• Gıda güvenliği ve ISO 22000 standartlarını bilmeli" },
                new JobPosting { Id = 3, EmployerId = 1, Title = "Geleneksel Sanatlar Eğitmeni", Description = "Halk Eğitim Merkezimizde usta öğretici olarak görev yapacak sanatçılar.", Requirements = "El Sanatları diploması veya Ustalık Belgesi, Pedagojik formasyon.", SalaryRange = "MEB Ders Ücreti + Prim", Location = "Borçka / Merkez", RequiredCategory = "El Sanatları", ExaminationText = "• Geleneksel motiflerin tarihçesini ve anlamlarını bilmeli\n• Kitre ve boya hazırlama (Ebru için) tekniklerini bilmeli\n• Kursiyer yönetimi ve öğretim metotlarına hakim olmalı\n• Sergi ve etkinlik planlama becerisine sahip olmalı" }
            );
        }
    }
}
