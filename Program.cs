using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authentication.Cookies;

var builder = WebApplication.CreateBuilder(args);

// 1. MVC Servislerini Ekle
builder.Services.AddControllersWithViews();
builder.Services.AddHttpContextAccessor();
builder.Services.AddScoped<HalkEgitimSistemi.Services.IAuditService, HalkEgitimSistemi.Services.AuditService>();
builder.Services.AddScoped<HalkEgitimSistemi.Services.IEmailService, HalkEgitimSistemi.Services.EmailService>();
builder.Services.AddScoped<HalkEgitimSistemi.Services.IProfanityFilterService, HalkEgitimSistemi.Services.ProfanityFilterService>();
builder.Services.AddScoped<HalkEgitimSistemi.Services.MernisService>();
builder.Services.AddMemoryCache();
builder.Services.AddHttpClient();
builder.Services.AddScoped<HalkEgitimSistemi.Services.GoogleBooksService>();
builder.Services.AddScoped<HalkEgitimSistemi.Services.ISiteSettingsService, HalkEgitimSistemi.Services.SiteSettingsService>();
builder.Services.AddSignalR();
builder.Services.AddResponseCompression(options => {
    options.EnableForHttps = true;
});
builder.Services.AddOutputCache();

// 2. Veritabanı Bağlantısı (Senin mevcut bağlantın)
builder.Services.AddDbContext<HalkEgitimSistemi.Data.AppDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// 3. Admin Giriş (Authentication) Ayarları - BU KISIM ŞART
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie(options =>
    {
        options.LoginPath = "/Account/Login";
        options.LogoutPath = "/Account/Logout";
        options.AccessDeniedPath = "/Account/Login";
        options.Cookie.HttpOnly = true;
        options.Cookie.SecurePolicy = CookieSecurePolicy.Always;
        options.Cookie.SameSite = SameSiteMode.Strict;
        options.Cookie.Name = ".HalkEgitim.Session";
    });

builder.Services.AddAntiforgery(options => {
    options.HeaderName = "X-XSRF-TOKEN";
});

var app = builder.Build();

// --- VERİ TABANI GÜNCELLEME VE SEED (Sunum Hazırlığı) ---
using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;
    var context = services.GetRequiredService<HalkEgitimSistemi.Data.AppDbContext>();
    
    try 
    {
        // 1. Önce tabloların varlığını garantiye al (Manuel Fix)
        string createTableSql = @"
            IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Neighborhoods]') AND type in (N'U'))
            BEGIN
                CREATE TABLE [dbo].[Neighborhoods] (
                    [Id] [int] IDENTITY(1,1) NOT NULL,
                    [Name] [nvarchar](max) NOT NULL,
                    [Latitude] [float] NOT NULL,
                    [Longitude] [float] NOT NULL,
                    [ActiveStudents] [int] NOT NULL,
                    [CompletedCourses] [int] NOT NULL,
                    [Intensity] [float] NOT NULL,
                    CONSTRAINT [PK_Neighborhoods] PRIMARY KEY CLUSTERED ([Id] ASC)
                );
                
                -- İlk verileri manuel ekle
                INSERT INTO [dbo].[Neighborhoods] ([Name], [Latitude], [Longitude], [ActiveStudents], [CompletedCourses], [Intensity])
                VALUES 
                (N'Merkez Mahallesi', 41.2583, 41.6781, 120, 45, 0.8),
                (N'Aksu Mahallesi', 41.2500, 41.6700, 85, 30, 0.6),
                (N'Gündoğdu Mahallesi', 41.2650, 41.6850, 150, 65, 0.95),
                (N'Yeniyol Mahallesi', 41.2600, 41.6650, 60, 20, 0.4),
                (N'Arkaköy', 41.2400, 41.6500, 40, 15, 0.3);
            END";
        
        context.Database.ExecuteSqlRaw(createTableSql);

        // 2. Diğer site ayarları için tablo kontrolü
        string createSettingsSql = @"
            IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SiteSettings]') AND type in (N'U'))
            BEGIN
                CREATE TABLE [dbo].[SiteSettings] (
                    [Id] [int] IDENTITY(1,1) NOT NULL,
                    [Key] [nvarchar](max) NOT NULL,
                    [Value] [nvarchar](max) NOT NULL,
                    [Group] [nvarchar](max) NOT NULL,
                    [UpdatedBy] [nvarchar](max) NULL,
                    [LastUpdated] [datetime2](7) NOT NULL,
                    CONSTRAINT [PK_SiteSettings] PRIMARY KEY CLUSTERED ([Id] ASC)
                );
                
                INSERT INTO [dbo].[SiteSettings] ([Key], [Value], [Group], [UpdatedBy], [LastUpdated])
                VALUES 
                ('KaragolGoalProgress', '342', 'SocialResponsibility', 'System', GETDATE()),
                ('KaragolGoalTarget', '500', 'SocialResponsibility', 'System', GETDATE()),
                ('LeaderNeighborhood', N'Gündoğdu Mahallesi', 'Stats', 'System', GETDATE());
            END";
        
        context.Database.ExecuteSqlRaw(createSettingsSql);

        // 3. Eksik sütunları kontrol et ve ekle (Manuel Migration Fix)
        string fixSchemaSql = @"
            -- Applications tablosu için eksik sütunlar
            IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND name = 'DiscountCode')
            ALTER TABLE [dbo].[Applications] ADD [DiscountCode] nvarchar(max) NULL;

            IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND name = 'UsedHalkPointCode')
            ALTER TABLE [dbo].[Applications] ADD [UsedHalkPointCode] nvarchar(max) NULL;

            IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND name = 'PaymentType')
            ALTER TABLE [dbo].[Applications] ADD [PaymentType] nvarchar(max) NULL;

            IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND name = 'PaymentMethod')
            ALTER TABLE [dbo].[Applications] ADD [PaymentMethod] nvarchar(max) NULL;

            IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND name = 'TransactionId')
            ALTER TABLE [dbo].[Applications] ADD [TransactionId] nvarchar(max) NULL;

            -- Students tablosu için eksik sütunlar
            IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND name = 'LinkedInUrl')
            ALTER TABLE [dbo].[Students] ADD [LinkedInUrl] nvarchar(max) NULL;

            IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND name = 'GithubUrl')
            ALTER TABLE [dbo].[Students] ADD [GithubUrl] nvarchar(max) NULL;

            IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND name = 'Points')
            ALTER TABLE [dbo].[Students] ADD [Points] int NOT NULL DEFAULT 0;

            -- 🛠️ INDEX HAZIRLIĞI: Email sütunlarını nvarchar(450) yap (Index için şart)
            ALTER TABLE [dbo].[Students] ALTER COLUMN [Email] nvarchar(450) NULL;
            IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Instructors]') AND name = 'Email')
                ALTER TABLE [dbo].[Instructors] ALTER COLUMN [Email] nvarchar(450) NULL;
            
            -- Instructors tablosu için eksik sütunlar
            IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Instructors]') AND name = 'Bio')
            ALTER TABLE [dbo].[Instructors] ADD [Bio] nvarchar(max) NULL;

            IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Instructors]') AND name = 'Education')
            ALTER TABLE [dbo].[Instructors] ADD [Education] nvarchar(max) NULL;

            IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Instructors]') AND name = 'LinkedInUrl')
            ALTER TABLE [dbo].[Instructors] ADD [LinkedInUrl] nvarchar(max) NULL;

            IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Instructors]') AND name = 'PortfolioUrl')
            ALTER TABLE [dbo].[Instructors] ADD [PortfolioUrl] nvarchar(max) NULL;

            IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Instructors]') AND name = 'DribbbleUrl')
            ALTER TABLE [dbo].[Instructors] ADD [DribbbleUrl] nvarchar(max) NULL;

            IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Instructors]') AND name = 'Skills')
            ALTER TABLE [dbo].[Instructors] ADD [Skills] nvarchar(max) NULL;

            -- ⚡ PERFORMANCE INDEXES (Speed up Dashboard & Logins)
            IF NOT EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_Students_Email')
                CREATE INDEX IX_Students_Email ON [dbo].[Students] ([Email]);

            IF NOT EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_Instructors_Email')
                CREATE INDEX IX_Instructors_Email ON [dbo].[Instructors] ([Email]);

            IF NOT EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_Employers_Email')
                CREATE INDEX IX_Employers_Email ON [dbo].[Employers] ([Email]);

            IF NOT EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_AdminUsers_Username')
                CREATE INDEX IX_AdminUsers_Username ON [dbo].[AdminUsers] ([Username]);

            IF NOT EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_Applications_Status')
                CREATE INDEX IX_Applications_Status ON [dbo].[Applications] ([Status]);

            IF NOT EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_Applications_IsDeleted')
                CREATE INDEX IX_Applications_IsDeleted ON [dbo].[Applications] ([IsDeleted]);

            IF NOT EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_Applications_StudentId')
                CREATE INDEX IX_Applications_StudentId ON [dbo].[Applications] ([StudentId]);

            -- 💼 MODERN JOB POSTINGS SEED (Borçka Institutions)
            IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JobPostings]') AND type in (N'U'))
            BEGIN
                CREATE TABLE [dbo].[JobPostings] (
                    [Id] [int] IDENTITY(1,1) NOT NULL,
                    [CompanyName] [nvarchar](max) NOT NULL,
                    [Title] [nvarchar](max) NOT NULL,
                    [Description] [nvarchar](max) NOT NULL,
                    [Requirements] [nvarchar](max) NOT NULL,
                    [Location] [nvarchar](max) NOT NULL,
                    [JobType] [nvarchar](max) NOT NULL,
                    [SalaryRange] [nvarchar](max) NOT NULL,
                    [CreatedAt] [datetime2](7) NOT NULL,
                    [Deadline] [datetime2](7) NULL,
                    [IsActive] [bit] NOT NULL,
                    [IsDeleted] [bit] NOT NULL,
                    [EmployerId] [int] NOT NULL,
                    [RequiredCategory] [nvarchar](max) NOT NULL,
                    [ContactEmail] [nvarchar](max) NOT NULL,
                    CONSTRAINT [PK_JobPostings] PRIMARY KEY CLUSTERED ([Id] ASC)
                );
            END

            IF (SELECT COUNT(*) FROM [dbo].[JobPostings] WHERE [IsDeleted] = 0) < 3
            BEGIN
                INSERT INTO [dbo].[JobPostings] ([CompanyName], [Title], [Description], [Requirements], [Location], [JobType], [SalaryRange], [CreatedAt], [IsActive], [IsDeleted], [EmployerId], [RequiredCategory], [ContactEmail])
                VALUES 
                (N'Borçka Kaymakamlığı', N'Kurumsal Büro Personeli', N'Hükümet Konağı birimlerinde, dijital dönüşüm süreçlerini yönetecek ve vatandaş taleplerini dijital sistemlere işleyecek vizyoner çalışma arkadaşları arıyoruz.', N'• En az Lise mezunu\n• MEB Onaylı Bilgisayar İşletmenliği Sertifikası\n• Diksiyonu düzgün ve temsil kabiliyeti yüksek', N'Merkez, Borçka', N'Tam Zamanlı', N'Asgari Ücret + Kurumsal Yan Haklar', GETDATE(), 1, 0, 0, N'Büro Yönetimi', 'borcka@icisleri.gov.tr'),
                (N'Borçka Belediye Başkanlığı', N'Sosyal Medya ve İletişim Uzmanı', N'Belediyemizin dijital varlıklarını yönetecek, Borçka''nın turizm potansiyelini (Karagöl vb.) tüm dünyaya tanıtacak yaratıcı yetenekler aranıyor.', N'• Grafik tasarım programlarına hakimiyet\n• Profesyonel fotoğrafçılık veya video düzenleme bilgisi\n• Borçka yerel kültürüne hakimiyet', N'Belediye Hizmet Binası', N'Tam Zamanlı', N'Dolgun Maaş + Yemek + Yol', GETDATE(), 1, 0, 0, N'Medya ve Tanıtım', 'ik@borcka.bel.tr'),
                (N'İlçe Milli Eğitim Müdürlüğü', N'Teknoloji Atölyesi Eğitmen Yard.', N'Borçka Halk Eğitim Merkezi bünyesinde yeni açılan Siber Güvenlik ve Robotik Kodlama laboratuvarlarında çocuklara rehberlik edecek genç yetenekler.', N'• Robotik Kodlama eğitimi almış olmak\n• Pedagojik formasyon veya usta öğreticilik belgesi tercih sebebidir\n• Proaktif ve çocuklarla iletişimi güçlü', N'Halk Eğitim Merkezi Kampüsü', N'Yarı Zamanlı', N'Ders Başı Ücret (MEB Tarifesi)', GETDATE(), 1, 0, 0, N'Bilişim Teknolojileri', 'borcka08@meb.gov.tr');
            END
        ";
        context.Database.ExecuteSqlRaw(fixSchemaSql);

        // Standart migrationları dene
        context.Database.Migrate();
    }
    catch (Exception ex)
    {
        // Hata olsa bile projenin açılmasını sağla
        Console.WriteLine("Veritabanı başlatma hatası: " + ex.Message);
    }
}

// 4. HTTP İstek Hattı Yapılandırması
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

// app.UseHttpsRedirection();
app.UseResponseCompression();
app.UseStaticFiles(new StaticFileOptions
{
    OnPrepareResponse = ctx =>
    {
        const int durationInSeconds = 60 * 60 * 24 * 30; // 30 days
        ctx.Context.Response.Headers[Microsoft.Net.Http.Headers.HeaderNames.CacheControl] =
            "public,max-age=" + durationInSeconds;
    }
});

app.UseOutputCache();

app.UseRouting();

// 5. Yetkilendirme Sıralaması (Yerleri asla değişmemeli)
app.UseAuthentication(); // Kimsin?
app.UseAuthorization();  // Yetkin var mı?

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.MapHub<HalkEgitimSistemi.Hubs.GalleryHub>("/galleryHub");
app.MapHub<HalkEgitimSistemi.Hubs.TeacherChatHub>("/teacherChatHub");
app.MapHub<HalkEgitimSistemi.Hubs.CourseChatHub>("/courseChatHub");
app.MapHub<HalkEgitimSistemi.Hubs.LiveLessonHub>("/liveLessonHub");
app.MapHub<HalkEgitimSistemi.Hubs.PrivateChatHub>("/privateChatHub");
app.MapHub<HalkEgitimSistemi.Hubs.AdminHub>("/adminHub");
app.MapHub<HalkEgitimSistemi.Hubs.QuizHub>("/quizHub");

app.Run();