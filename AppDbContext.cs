namespace HalkEgitimSistemi.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        [cite_start]// Proje planındaki tabloların [cite: 3]
        public DbSet<Category> Categories { get; set; }
        public DbSet<Course> Courses { get; set; }
        public DbSet<Student> Students { get; set; }
        public DbSet<Instructor> Instructors { get; set; }
        public DbSet<Application> Applications { get; set; }
        public DbSet<News> News { get; set; }
    }
}
