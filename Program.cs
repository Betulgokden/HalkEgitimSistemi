using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Antiforgery;

var builder = WebApplication.CreateBuilder(args);

// 1. MVC Servislerini Ekle (View rendering için gerekli)
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
builder.Services.AddResponseCompression(options => { options.EnableForHttps = true; });
builder.Services.AddOutputCache();

// 2. Veritabanı Bağlantısı
builder.Services.AddDbContext<HalkEgitimSistemi.Data.AppDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// 3. Admin Giriş (Authentication) Ayarları
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

builder.Services.AddAntiforgery(options => { options.HeaderName = "X-XSRF-TOKEN"; });

var app = builder.Build();

// --- VERİ TABANI GÜNCELLEME VE SEED ---
using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;
    var context = services.GetRequiredService<HalkEgitimSistemi.Data.AppDbContext>();
    try { context.Database.Migrate(); } catch { }
}

// 4. HTTP İstek Hattı Yapılandırması
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseResponseCompression();
app.UseStaticFiles();
app.UseOutputCache();
app.UseRouting();
app.UseAuthentication();
app.UseAuthorization();
app.UseAntiforgery();

// ==================================================================================
// 🚀 MINIMAL API ENDPOINTS (MODERN UNIFIED ARCHITECTURE)
// ==================================================================================

// --- HOME ENDPOINTS ---
app.MapGet("/", async (AppDbContext context) => {
    var news = await context.News.Where(n => !n.IsDeleted && n.IsActive).OrderByDescending(n => n.CreatedAt).Take(4).ToListAsync();
    var stats = new { Students = 1250, Courses = 85, Instructors = 42 };
    return Results.Extensions.View("Views/Home/Index.cshtml", new { News = news, Stats = stats });
});

app.MapGet("/Home/Error", () => Results.Extensions.View("Views/Shared/Error.cshtml"));

// --- ACCOUNT ENDPOINTS ---
var account = app.MapGroup("/Account");
account.MapGet("/Login", () => Results.Extensions.View("Views/Account/Login.cshtml"));
account.MapPost("/Login", async ([FromForm] string email, [FromForm] string password, HttpContext httpContext, AppDbContext context) => {
    var user = await context.Students.FirstOrDefaultAsync(s => s.Email == email && s.Password == password);
    if (user != null) {
        var claims = new List<Claim> { new Claim(ClaimTypes.Name, user.Email), new Claim(ClaimTypes.Role, "Student") };
        var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
        await httpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(identity));
        return Results.Redirect("/Student/Dashboard");
    }
    return Results.Redirect("/Account/Login?error=invalid");
});
account.MapGet("/Logout", async (HttpContext httpContext) => {
    await httpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
    return Results.Redirect("/");
});

// --- JOB POSTINGS ENDPOINTS ---
var jobs = app.MapGroup("/JobPostings");
jobs.MapGet("/", async (AppDbContext context) => {
    var jobsList = await context.JobPostings.Where(j => j.IsActive && (j.Deadline == null || j.Deadline >= DateTime.Now)).OrderByDescending(j => j.CreatedAt).ToListAsync();
    return Results.Extensions.View("Views/JobPostings/Index.cshtml", jobsList);
});
jobs.MapGet("/Details/{id:int}", async (int id, AppDbContext context) => {
    var job = await context.JobPostings.FindAsync(id);
    return job is null ? Results.NotFound() : Results.Extensions.View("Views/JobPostings/Details.cshtml", job);
});

// --- STUDENT ENDPOINTS ---
var student = app.MapGroup("/Student").RequireAuthorization();
student.MapGet("/Dashboard", async (AppDbContext context, ClaimsPrincipal user) => {
    var email = user.Identity.Name;
    var studentData = await context.Students.Include(s => s.Applications).ThenInclude(a => a.Course).FirstOrDefaultAsync(s => s.Email == email);
    return Results.Extensions.View("Views/Student/Dashboard.cshtml", studentData);
});

// --- SIGNALR HUBS ---
app.MapHub<HalkEgitimSistemi.Hubs.GalleryHub>("/galleryHub");
app.MapHub<HalkEgitimSistemi.Hubs.TeacherChatHub>("/teacherChatHub");
app.MapHub<HalkEgitimSistemi.Hubs.CourseChatHub>("/courseChatHub");
app.MapHub<HalkEgitimSistemi.Hubs.LiveLessonHub>("/liveLessonHub");
app.MapHub<HalkEgitimSistemi.Hubs.PrivateChatHub>("/privateChatHub");
app.MapHub<HalkEgitimSistemi.Hubs.AdminHub>("/adminHub");
app.MapHub<HalkEgitimSistemi.Hubs.QuizHub>("/quizHub");

// --- MVC BACKUP ROUTE (For non-migrated controllers) ---
app.MapControllerRoute(name: "default", pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();

// ==================================================================================
// 🛠️ MINIMAL API VIEW HELPER
// ==================================================================================
public static class ResultsExtensions {
    public static IResult View(this IResultExtensions extensions, string viewName, object model = null) {
        return new ViewResultWrapper(viewName, model);
    }
}

public class ViewResultWrapper : IResult {
    private readonly string _viewName;
    private readonly object _model;
    public ViewResultWrapper(string viewName, object model) { _viewName = viewName; _model = model; }
    public async Task ExecuteAsync(HttpContext httpContext) {
        var actionContext = new ActionContext(httpContext, new Microsoft.AspNetCore.Routing.RouteData(), new Microsoft.AspNetCore.Mvc.Abstractions.ActionDescriptor());
        var viewExecutor = httpContext.RequestServices.GetRequiredService<Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor>();
        var viewResult = new ViewResult {
            ViewName = _viewName,
            ViewData = new Microsoft.AspNetCore.Mvc.ViewFeatures.ViewDataDictionary(new Microsoft.AspNetCore.Mvc.ModelBinding.EmptyModelMetadataProvider(), new Microsoft.AspNetCore.Mvc.ModelBinding.ModelStateDictionary()) { Model = _model }
        };
        await viewExecutor.ExecuteAsync(actionContext, viewResult);
    }
}