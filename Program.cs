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
app.UseStaticFiles();

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

app.Run();