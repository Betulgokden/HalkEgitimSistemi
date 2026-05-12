using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace HalkEgitimSistemi.Migrations
{
    /// <inheritdoc />
    public partial class InitialModernSetupV2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "AdminUsers",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Username = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Password = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    FullName = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AdminUsers", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "CalendarEvents",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Start = table.Column<DateTime>(type: "datetime2", nullable: false),
                    End = table.Column<DateTime>(type: "datetime2", nullable: true),
                    ColorCode = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CalendarEvents", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Categories",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CategoryName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IconClass = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    DeletedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    DeletedBy = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Categories", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Certificates",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TcNo = table.Column<string>(type: "nvarchar(11)", maxLength: 11, nullable: false),
                    CertificateNo = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    FullName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CourseName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IssueDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Certificates", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Complaints",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ReporterName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ReporterEmail = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Subject = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: false),
                    Description = table.Column<string>(type: "nvarchar(2000)", maxLength: 2000, nullable: false),
                    Category = table.Column<int>(type: "int", nullable: false),
                    Status = table.Column<int>(type: "int", nullable: false),
                    AdminNote = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ReviewedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    ReportedPersonName = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Complaints", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "EmailLogs",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ToEmail = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Subject = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Body = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    SentDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsSuccess = table.Column<bool>(type: "bit", nullable: false),
                    ErrorMessage = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EmailLogs", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "LogEntries",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserEmail = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Action = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Message = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Timestamp = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IpAddress = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ControllerName = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_LogEntries", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "MasterTrainerApplications",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FullName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    TcNo = table.Column<string>(type: "nvarchar(11)", maxLength: 11, nullable: false),
                    BirthYear = table.Column<int>(type: "int", nullable: false),
                    Phone = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Address = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    GraduationStatus = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CategoryId = table.Column<int>(type: "int", nullable: false),
                    CourseId = table.Column<int>(type: "int", nullable: false),
                    Specialty = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CvPath = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CriminalRecordPath = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DiplomaPath = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    AvailabilityJson = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Status = table.Column<int>(type: "int", nullable: false),
                    ApplyDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MasterTrainerApplications", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "NewsStories",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ImageUrl = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ActionUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_NewsStories", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "ProfanityBans",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserEmail = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    UserName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    OffenseCount = table.Column<int>(type: "int", nullable: false),
                    BanUntil = table.Column<DateTime>(type: "datetime2", nullable: true),
                    IsPermanent = table.Column<bool>(type: "bit", nullable: false),
                    LastOffenseText = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    AdminNote = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProfanityBans", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Students",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FirstName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    LastName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Password = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    TcNo = table.Column<string>(type: "nvarchar(450)", nullable: true),
                    BirthDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    BirthPlace = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Summary = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Skills = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ProfilePicture = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    IsEmployed = table.Column<bool>(type: "bit", nullable: false),
                    StartedBusiness = table.Column<bool>(type: "bit", nullable: false),
                    WelcomeEmailSent = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Students", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "TemporaryLinks",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CertificateCode = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Token = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ExpiryDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsUsed = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TemporaryLinks", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Courses",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CourseName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ImageUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Quota = table.Column<int>(type: "int", nullable: false),
                    StartDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    EndDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    StartTime = table.Column<TimeSpan>(type: "time", nullable: false),
                    EndTime = table.Column<TimeSpan>(type: "time", nullable: false),
                    IsActive = table.Column<bool>(type: "bit", nullable: false),
                    DurationHours = table.Column<int>(type: "int", nullable: false),
                    MaxAbsenceLimit = table.Column<int>(type: "int", nullable: false),
                    Price = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    LearningOutcomes = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Curriculum = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Requirements = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    WhoIsItFor = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ExamDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    CategoryId = table.Column<int>(type: "int", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    DeletedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    DeletedBy = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Courses", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Courses_Categories_CategoryId",
                        column: x => x.CategoryId,
                        principalTable: "Categories",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Applications",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FirstName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    LastName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    TcNo = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CourseId = table.Column<int>(type: "int", nullable: false),
                    ApplyDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DateOfBirth = table.Column<DateTime>(type: "datetime2", nullable: false),
                    EducationLevel = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Status = table.Column<int>(type: "int", nullable: false),
                    BirthPlace = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    AdminNote = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CertificateCode = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsCompleted = table.Column<bool>(type: "bit", nullable: false),
                    ExamGrade = table.Column<int>(type: "int", nullable: true),
                    IsPaid = table.Column<bool>(type: "bit", nullable: false),
                    PaymentMethod = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    TransactionId = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    StudentId = table.Column<int>(type: "int", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    DeletedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    DeletedBy = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Applications", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Applications_Courses_CourseId",
                        column: x => x.CourseId,
                        principalTable: "Courses",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Applications_Students_StudentId",
                        column: x => x.StudentId,
                        principalTable: "Students",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Comments",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserEmail = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Content = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Rating = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CourseId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Comments", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Comments_Courses_CourseId",
                        column: x => x.CourseId,
                        principalTable: "Courses",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "CourseChatMessages",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CourseId = table.Column<int>(type: "int", nullable: false),
                    SenderName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    SenderRole = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Message = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    OriginalMessage = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsCensored = table.Column<bool>(type: "bit", nullable: false),
                    SentAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    SenderEmail = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    InstructorId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CourseChatMessages", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CourseChatMessages_Courses_CourseId",
                        column: x => x.CourseId,
                        principalTable: "Courses",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "CourseResources",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    FilePath = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    FileType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UploadDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CourseId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CourseResources", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CourseResources_Courses_CourseId",
                        column: x => x.CourseId,
                        principalTable: "Courses",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "CourseReviews",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    StudentId = table.Column<int>(type: "int", nullable: false),
                    CourseId = table.Column<int>(type: "int", nullable: false),
                    Rating = table.Column<int>(type: "int", nullable: false),
                    Comment = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsApproved = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CourseReviews", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CourseReviews_Courses_CourseId",
                        column: x => x.CourseId,
                        principalTable: "Courses",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_CourseReviews_Students_StudentId",
                        column: x => x.StudentId,
                        principalTable: "Students",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ExhibitionItems",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ImageUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ModelUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    VideoUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Type = table.Column<int>(type: "int", nullable: false),
                    ArtistName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CourseId = table.Column<int>(type: "int", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    PositionX = table.Column<float>(type: "real", nullable: false),
                    PositionY = table.Column<float>(type: "real", nullable: false),
                    PositionZ = table.Column<float>(type: "real", nullable: false),
                    RotationY = table.Column<float>(type: "real", nullable: false),
                    TechDetails = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ExternalLink = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ExhibitionItems", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ExhibitionItems_Courses_CourseId",
                        column: x => x.CourseId,
                        principalTable: "Courses",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "GalleryItems",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ImageUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CourseId = table.Column<int>(type: "int", nullable: true),
                    ViewCount = table.Column<int>(type: "int", nullable: false),
                    ExifInfo = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Tags = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    DeletedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    DeletedBy = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_GalleryItems", x => x.Id);
                    table.ForeignKey(
                        name: "FK_GalleryItems_Courses_CourseId",
                        column: x => x.CourseId,
                        principalTable: "Courses",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Instructors",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FullName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ImageUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Username = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Password = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CourseId = table.Column<int>(type: "int", nullable: true),
                    CvFilePath = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    DeletedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    DeletedBy = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Instructors", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Instructors_Courses_CourseId",
                        column: x => x.CourseId,
                        principalTable: "Courses",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "News",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Content = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Date = table.Column<DateTime>(type: "datetime2", nullable: false),
                    PublishDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    PosterUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ImageUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CourseId = table.Column<int>(type: "int", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    DeletedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    DeletedBy = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_News", x => x.Id);
                    table.ForeignKey(
                        name: "FK_News_Courses_CourseId",
                        column: x => x.CourseId,
                        principalTable: "Courses",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "SuccessStories",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Summary = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Content = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CoverImage = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    BeforeImage = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    AfterImage = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    VideoUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CourseId = table.Column<int>(type: "int", nullable: true),
                    StudentId = table.Column<int>(type: "int", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsActive = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SuccessStories", x => x.Id);
                    table.ForeignKey(
                        name: "FK_SuccessStories_Courses_CourseId",
                        column: x => x.CourseId,
                        principalTable: "Courses",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_SuccessStories_Students_StudentId",
                        column: x => x.StudentId,
                        principalTable: "Students",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Attendances",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ApplicationId = table.Column<int>(type: "int", nullable: false),
                    CourseId = table.Column<int>(type: "int", nullable: false),
                    Date = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsPresent = table.Column<bool>(type: "bit", nullable: false),
                    Note = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Attendances", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Attendances_Applications_ApplicationId",
                        column: x => x.ApplicationId,
                        principalTable: "Applications",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Attendances_Courses_CourseId",
                        column: x => x.CourseId,
                        principalTable: "Courses",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "GalleryComments",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Content = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    UserEmail = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    X = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    Y = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    IsInstructorResponse = table.Column<bool>(type: "bit", nullable: false),
                    IsApproved = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    GalleryItemId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_GalleryComments", x => x.Id);
                    table.ForeignKey(
                        name: "FK_GalleryComments_GalleryItems_GalleryItemId",
                        column: x => x.GalleryItemId,
                        principalTable: "GalleryItems",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "GalleryLikes",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserEmail = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    GalleryItemId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_GalleryLikes", x => x.Id);
                    table.ForeignKey(
                        name: "FK_GalleryLikes_GalleryItems_GalleryItemId",
                        column: x => x.GalleryItemId,
                        principalTable: "GalleryItems",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "InstructorSchedules",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    InstructorId = table.Column<int>(type: "int", nullable: false),
                    Day = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    StartTime = table.Column<TimeSpan>(type: "time", nullable: false),
                    EndTime = table.Column<TimeSpan>(type: "time", nullable: false),
                    Note = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_InstructorSchedules", x => x.Id);
                    table.ForeignKey(
                        name: "FK_InstructorSchedules_Instructors_InstructorId",
                        column: x => x.InstructorId,
                        principalTable: "Instructors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Messages",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    SenderUsername = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ReceiverInstructorId = table.Column<int>(type: "int", nullable: false),
                    Subject = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Content = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Date = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsRead = table.Column<bool>(type: "bit", nullable: false),
                    ReceiverUsername = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsFromInstructor = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Messages", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Messages_Instructors_ReceiverInstructorId",
                        column: x => x.ReceiverInstructorId,
                        principalTable: "Instructors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "TeacherChatMessages",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    InstructorId = table.Column<int>(type: "int", nullable: false),
                    SenderName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Message = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    OriginalMessage = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsCensored = table.Column<bool>(type: "bit", nullable: false),
                    SentAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TeacherChatMessages", x => x.Id);
                    table.ForeignKey(
                        name: "FK_TeacherChatMessages_Instructors_InstructorId",
                        column: x => x.InstructorId,
                        principalTable: "Instructors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "NewsComments",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NewsId = table.Column<int>(type: "int", nullable: false),
                    Content = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    UserEmail = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsApproved = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_NewsComments", x => x.Id);
                    table.ForeignKey(
                        name: "FK_NewsComments_News_NewsId",
                        column: x => x.NewsId,
                        principalTable: "News",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "NewsLikes",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NewsId = table.Column<int>(type: "int", nullable: false),
                    UserEmail = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_NewsLikes", x => x.Id);
                    table.ForeignKey(
                        name: "FK_NewsLikes_News_NewsId",
                        column: x => x.NewsId,
                        principalTable: "News",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "AdminUsers",
                columns: new[] { "Id", "FullName", "Password", "Username" },
                values: new object[] { 1, "Betül Gökden", "0808", "Betül" });

            migrationBuilder.InsertData(
                table: "CalendarEvents",
                columns: new[] { "Id", "ColorCode", "End", "Start", "Title" },
                values: new object[,]
                {
                    { 1, "#C5A059", new DateTime(2026, 5, 1, 17, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2026, 5, 1, 9, 0, 0, 0, DateTimeKind.Unspecified), "Yaz Dönemi Kayıt Başlangıcı" },
                    { 2, "#10b981", new DateTime(2026, 5, 15, 16, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2026, 5, 15, 14, 0, 0, 0, DateTimeKind.Unspecified), "Sertifika Töreni" }
                });

            migrationBuilder.InsertData(
                table: "Categories",
                columns: new[] { "Id", "CategoryName", "DeletedAt", "DeletedBy", "Description", "IconClass", "IsDeleted" },
                values: new object[,]
                {
                    { 1, "Bilişim Teknolojileri", null, null, "Yazılım, donanım ve dijital beceriler", "bi-laptop", false },
                    { 2, "Yabancı Diller", null, null, "İngilizce, Almanca, Arapça dil kursları", "bi-translate", false },
                    { 3, "El Sanatları", null, null, "Ahşap boyama, nakış, seramik atölyeleri", "bi-palette", false },
                    { 4, "Müzik", null, null, "Enstrüman ve ses eğitimi programları", "bi-music-note-beamed", false },
                    { 5, "Spor ve Sağlık", null, null, "Fitness, yoga, yüzme kursları", "bi-heart-pulse", false },
                    { 6, "Aşçılık ve Pastacılık", null, null, "Mutfak sanatları ve gastronomi", "bi-cup-hot", false },
                    { 7, "Güzellik ve Bakım", null, null, "Kuaförlük, cilt bakımı, makyaj", "bi-scissors", false },
                    { 8, "Mesleki Eğitim", null, null, "Sertifikalı mesleki gelişim programları", "bi-briefcase", false }
                });

            migrationBuilder.InsertData(
                table: "Certificates",
                columns: new[] { "Id", "CertificateNo", "CourseName", "FullName", "IssueDate", "TcNo" },
                values: new object[,]
                {
                    { 1, "HE-2026-0001", "Yapay Zeka Destekli Python Programlama", "Ali Koç", new DateTime(2026, 4, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), "12345678901" },
                    { 2, "HE-2026-0002", "Akademik ve Günlük İngilizce (A1-A2)", "Ayşe Demir", new DateTime(2026, 4, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), "23456789012" }
                });

            migrationBuilder.InsertData(
                table: "GalleryItems",
                columns: new[] { "Id", "CourseId", "CreatedAt", "DeletedAt", "DeletedBy", "Description", "ExifInfo", "ImageUrl", "IsDeleted", "Tags", "Title", "ViewCount" },
                values: new object[,]
                {
                    { 1, null, new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(7782), null, null, "Temel bilişim eğitimlerimizden kareler.", null, "https://images.unsplash.com/photo-1427504494785-3a9ca7044f45?w=800", false, null, "Bilgisayar Okuryazarlığı", 0 },
                    { 2, null, new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(9309), null, null, "Grup çalışmaları ile sosyalleşme.", null, "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=800", false, null, "Etkili İletişim", 0 },
                    { 3, null, new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(9314), null, null, "İleri seviye kodlama atölyelerimiz.", null, "https://images.unsplash.com/photo-1542831371-29b0f74f9713?w=800", false, null, "Yazılım Geliştirme", 0 },
                    { 4, null, new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(9318), null, null, "Sanat atölyelerinde yaratıcılık.", null, "https://images.unsplash.com/photo-1513364776144-60967b0f800f?w=800", false, null, "Resim ve Sanat", 0 },
                    { 5, null, new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(9320), null, null, "Gurme lezzetlerin hazırlandığı mutfaklarımız.", null, "https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=800", false, null, "Aşçılık ve Mutfak", 0 },
                    { 6, null, new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(9323), null, null, "Topluluk önünde konuşma etkinliği.", null, "https://images.unsplash.com/photo-1524178232363-1fb2b075b655?w=800", false, null, "Sunum Eğitimi", 0 },
                    { 7, null, new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(9325), null, null, "Müziğin ritmini yakalayan öğrencilerimiz.", null, "https://images.unsplash.com/photo-1510915361894-db8b60106cb1?w=800", false, null, "Gitar Eğitimleri", 0 },
                    { 8, null, new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(9327), null, null, "Klasik müzik yeteneklerini geliştirirken.", null, "https://images.unsplash.com/photo-1507838153414-b4b713384a76?w=800", false, null, "Keman Sınıfı", 0 },
                    { 9, null, new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(9330), null, null, "Zihin ve beden bütünlüğü için aktiviteler.", null, "https://images.unsplash.com/photo-1518611012118-696072aa579a?w=800", false, null, "Spor ve Yoga", 0 },
                    { 10, null, new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(9332), null, null, "Proje fikirlerinin tartışıldığı toplantılar.", null, "https://images.unsplash.com/photo-1559136555-9303baea8ebd?w=800", false, null, "Girişimcilik", 0 },
                    { 11, null, new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(9334), null, null, "Yeni nesil mucitler iş başında.", null, "https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=800", false, null, "Robotik Kodlama", 0 },
                    { 12, null, new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(9336), null, null, "Dünya mutfaklarından harika tarifler.", null, "https://images.unsplash.com/photo-1606787619248-f301830a5a57?w=800", false, null, "Gastronomi Uzmanlığı", 0 }
                });

            migrationBuilder.InsertData(
                table: "News",
                columns: new[] { "Id", "Content", "CourseId", "Date", "DeletedAt", "DeletedBy", "ImageUrl", "IsDeleted", "PosterUrl", "PublishDate", "Title" },
                values: new object[,]
                {
                    { 1, "Halk Eğitim Merkezimizin 2026 yaz dönemi kurs kayıtları başlamıştır. 15 farklı branşta ücretsiz eğitim fırsatı! Kontenjanlar sınırlıdır, acele edin.", null, new DateTime(2026, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, "/images/news/summer_registrations.png", false, null, new DateTime(2026, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "2026 Yaz Dönemi Kayıtları Başladı!" },
                    { 2, "Bilişim teknolojileri kategorisinde yeni Python Programlama kursu açılmıştır. Yapay zeka ve veri bilimi alanına adım atmak isteyenler için harika bir fırsat.", null, new DateTime(2026, 4, 5, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, "/images/news/python_course.png", false, null, new DateTime(2026, 4, 5, 0, 0, 0, 0, DateTimeKind.Unspecified), "Python Programlama Kursu Açıldı" },
                    { 3, "2025-2026 eğitim dönemini başarıyla tamamlayan 450 kursiyerimize sertifikaları düzenlenen törenle verildi. Tüm mezunlarımızı tebrik ederiz.", null, new DateTime(2026, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, "/images/news/certificate_ceremony.png", false, null, new DateTime(2026, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), "Sertifika Töreni Gerçekleştirildi" },
                    { 4, "KOSGEB işbirliğiyle düzenlenen ücretsiz girişimcilik semineri 15 Haziran'da merkezimizde gerçekleştirilecektir. Tüm vatandaşlarımız davetlidir.", null, new DateTime(2026, 4, 8, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, "/images/news/entrepreneurship.png", false, null, new DateTime(2026, 4, 8, 0, 0, 0, 0, DateTimeKind.Unspecified), "Ücretsiz Girişimcilik Semineri" },
                    { 5, "Merkezimiz bünyesinde düzenlenecek olan 'Genç Mucitler' robotik kodlama yarışması için başvurular başladı. Kendi robotunu tasarla, ödülü kazan!", null, new DateTime(2026, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, "/images/news/robotics.png", false, null, new DateTime(2026, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "Robotik Kodlama Yarışması" },
                    { 6, "El sanatları kursiyerlerimizin yıl boyunca hazırladığı nadide eserler, 20 Mayıs'ta kapılarını ziyaretçilere açacak olan büyük sergimizde listelenecek.", null, new DateTime(2026, 5, 2, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, "/images/news/exhibition.png", false, null, new DateTime(2026, 5, 2, 0, 0, 0, 0, DateTimeKind.Unspecified), "Geleneksel El Sanatları Sergisi" },
                    { 7, "Her hafta Cumartesi günleri gerçekleştirilecek olan 'English Speaking Club' ile dil becerilerinizi eğlenceli bir ortamda geliştirin. Katılım ücretsizdir.", null, new DateTime(2026, 5, 3, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, "/images/news/speaking_club.png", false, null, new DateTime(2026, 5, 3, 0, 0, 0, 0, DateTimeKind.Unspecified), "İngilizce Konuşma Kulübü" },
                    { 8, "Dünya mutfağının seçkin lezzetlerini profesyonel şeflerden öğrenmek ister misiniz? Modern Gastronomi atölyelerimiz için yeni dönem kayıtları devam ediyor.", null, new DateTime(2026, 5, 4, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, "/images/news/gastronomy.png", false, null, new DateTime(2026, 5, 4, 0, 0, 0, 0, DateTimeKind.Unspecified), "Modern Gastronomi Atölyesi" }
                });

            migrationBuilder.InsertData(
                table: "Students",
                columns: new[] { "Id", "BirthDate", "BirthPlace", "Email", "FirstName", "IsDeleted", "IsEmployed", "LastName", "Password", "PhoneNumber", "ProfilePicture", "Skills", "StartedBusiness", "Summary", "TcNo", "WelcomeEmailSent" },
                values: new object[] { 99, new DateTime(2000, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "Ankara", "betulgokden8@gmail.com", "Betül", false, false, "Gökden", "cinar08", null, null, null, false, null, "12345678901", false });

            migrationBuilder.InsertData(
                table: "Courses",
                columns: new[] { "Id", "CategoryId", "CourseName", "Curriculum", "DeletedAt", "DeletedBy", "Description", "DurationHours", "EndDate", "EndTime", "ExamDate", "ImageUrl", "IsActive", "IsDeleted", "LearningOutcomes", "MaxAbsenceLimit", "Price", "Quota", "Requirements", "StartDate", "StartTime", "WhoIsItFor" },
                values: new object[,]
                {
                    { 1, 1, "Yapay Zeka Destekli Python Programlama", "Hafta 1: Python'a Giriş ve Değişkenler\nHafta 2: Kontrol Yapıları ve Döngüler\nHafta 3: Fonksiyonlar ve Modüler Programlama\nHafta 4: Nesne Yönelimli Programlama (OOP)\nHafta 5: Dosya İşlemleri ve Veri Tabanı\nHafta 6: Veri Analizi Temelleri (Pandas & Numpy)\nHafta 7: Yapay Zeka ve ML Giriş (Scikit-Learn)\nHafta 8: Bitirme Projesi ve Sertifika Töreni", null, null, "Geleceğin dünyasını kodlamaya hazır mısınız? Bu kurs, Python'un gücünü Yapay Zeka (AI) ile birleştirerek size eşsiz bir kariyer kapısı açıyor. Veri biliminden otomasyona kadar modern teknolojinin kalbinde yer alacaksınız. Sadece öğrenmekle kalmayacak, üreteceksiniz!", 80, new DateTime(2026, 7, 31, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 12, 0, 0, 0), new DateTime(2026, 7, 25, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1526379095098-d400fd0bf935?w=600", true, false, "Sıfırdan İleri Seviye Python Geliştirme\nYapay Zeka ve Makine Öğrenmesi Modelleri\nBüyük Veri Analizi ve Görselleştirme\nAkıllı Sohbet Botları (Chatbot) Tasarımı\nOtomatik Veri Madenciliği ve Raporlama", 4, 500m, 25, "Temel bilgisayar kullanımı.", new DateTime(2026, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 9, 0, 0, 0), "Kendini geliştirmek isteyen herkes." },
                    { 2, 1, "Modern Web Tasarım ve Full-Stack Giriş", "Hafta 1: Web Temelleri ve HTML5 Semantik Yapı\nHafta 2: CSS3 Tasarım, Renk Teorisi ve Tipografi\nHafta 3: Layout Sistemleri (Flexbox & CSS Grid)\nHafta 4: JavaScript Temelleri ve Algoritma Mantığı\nHafta 5: DOM Manipülasyonu ve Dinamik Formlar\nHafta 6: Modern Framework'lere Bakış (React/Vue)\nHafta 7: Web Erişilebilirliği ve Arama Motoru Uyumu\nHafta 8: Full-Stack Proje Sunumu ve Değerlendirme", null, null, "İnternetin görünen yüzünü ve arkasındaki teknolojiyi siz inşa edin. Modern web standartlarını (HTML5, CSS3, JS) öğrenerek dünyaca ünlü siteler gibi projeler geliştireceksiniz. Kendi dijital markanızı yaratma fırsatını yakalayın!", 60, new DateTime(2026, 7, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 12, 0, 0, 0), new DateTime(2026, 7, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1547658719-da2b51169166?w=600", true, false, "Profesyonel UI/UX Tasarım Prensipleri\nResponsive (Mobil Uyumlu) Modern Layoutlar\nJavaScript ile İnteraktif Web Uygulamaları\nBootstrap ve Tailwind ile Hızlı Prototipleme\nSEO ve Web Performans Optimizasyonu", 4, 500m, 30, "Temel bilgisayar kullanımı.", new DateTime(2026, 5, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 9, 0, 0, 0), "Kendini geliştirmek isteyen herkes." },
                    { 3, 1, "Bilgisayar İşletmenliği (Operatörlük)", "Hafta 1: Temel Bilgisayar ve Windows Kullanımı\nHafta 2: Word ile Profesyonel Dökümantasyon\nHafta 3: Excel: Temel Fonksiyonlar ve Tablolar\nHafta 4: Excel: Veri Analizi ve Grafik Oluşturma\nHafta 5: PowerPoint ile Sunum Sanatı\nHafta 6: Outlook ve Kurumsal E-Posta Yönetimi\nHafta 7: Bulut Depolama ve Ortak Çalışma Araçları\nHafta 8: Klavye Teknikleri ve Final Sınavı", null, null, "İş hayatının vazgeçilmez becerilerini kazanın. MS Office programlarını (Excel, Word, PowerPoint) uzman seviyesinde kullanarak iş verimliliğinizi 10 katına çıkarın. Resmi onaylı sertifikanızla CV'nizi parlatın.", 120, new DateTime(2026, 8, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 12, 0, 0, 0), new DateTime(2026, 8, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=600", true, false, "İleri Seviye Excel Formülleri ve Raporlama\nProfesyonel Yazışma ve Rapor Tasarımı (Word)\nEtkileyici Sunum Teknikleri (PowerPoint)\nWindows ve Dosya Yönetimi Uzmanlığı\nİnternet Güvenliği ve Bulut Teknolojileri", 4, 500m, 35, "Temel bilgisayar kullanımı.", new DateTime(2026, 4, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 9, 0, 0, 0), "Kendini geliştirmek isteyen herkes." },
                    { 4, 2, "Akademik ve Günlük İngilizce (A1-A2)", "Hafta 1: Kendini Tanıtma ve Temel Selamlaşma\nHafta 2: Şimdiki Zaman ve Günlük Rutinler\nHafta 3: Nesneler, Yerler ve Edatlar\nHafta 4: Geçmiş Zaman ve Anı Anlatma\nHafta 5: Gelecek Planları ve Hayaller\nHafta 6: Restoran, Alışveriş ve Hastane Diyalogları\nHafta 7: Seyahat, Havaalanı ve Otel İşlemleri\nHafta 8: Serbest Konuşma Pratiği ve Mezuniyet", null, null, "İngilizce öğrenmek artık bir lüks değil, bir zorunluluk. Korkularınızı geride bırakın! Konuşma odaklı eğitimimizle dünyanın neresinde olursanız olun kendinizi ifade edebileceksiniz. Yeni insanlar, yeni kültürler sizi bekliyor.", 90, new DateTime(2026, 8, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 12, 0, 0, 0), new DateTime(2026, 7, 28, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1543109740-4bdb38fda756?w=600", true, false, "Özgüvenli Günlük Konuşma Becerisi\nTemel Gramer ve Zamanların Doğru Kullanımı\n2000+ Kelimelik Aktif Kelime Dağarcığı\nDinlediğini Anlama ve Doğru Telaffuz\nYabancı Kaynakları Okuma ve Anlama Kapasitesi", 4, 500m, 20, "Temel bilgisayar kullanımı.", new DateTime(2026, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 9, 0, 0, 0), "Kendini geliştirmek isteyen herkes." },
                    { 5, 2, "Almanca Temel Kurs (A1)", "Hafta 1: Alfabe, Sayılar ve Temel Telaffuz\nHafta 2: Fiil Çekimleri ve Şahıs Zamirleri\nHafta 3: Aile, Ev ve Yaşam Alanları\nHafta 4: Hobiler ve Boş Zaman Aktiviteleri\nHafta 5: Saatler ve Zaman İfadeleri\nHafta 6: Okul ve İş Dünyası Terimleri\nHafta 7: Sağlık, Yemek ve Kültürel Alışkanlıklar\nHafta 8: Rol Yapma (Role Play) ve Final Testi", null, null, "Avrupa'nın kalbine giden yolu açın. Almanca öğrenerek eğitim ve kariyer fırsatlarını yakalayın. Sistematik yaklaşımımızla zor görünen bu dili eğlenerek öğreneceksiniz.", 60, new DateTime(2026, 8, 30, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 12, 0, 0, 0), new DateTime(2026, 8, 25, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1527866959252-deab85ef7d1b?w=600", true, false, "Temel Almanca Gramer Yapısı\nGünlük İhtiyaçları Karşılayacak Konuşma\nAlman Kültürü ve Yaşam Tarzı Bilgisi\nBasit Metinleri Okuma ve Yazma\nDoğru Fonetik ve Telaffuz Teknikleri", 4, 1000m, 15, "Temel bilgisayar kullanımı.", new DateTime(2026, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 9, 0, 0, 0), "Kendini geliştirmek isteyen herkes." },
                    { 6, 3, "Ahşap Boyama ve Dekorasyon Sanatı", "Hafta 1: Malzeme Bilgisi ve Yüzey Hazırlığı\nHafta 2: Temel Boyama ve Fırça Teknikleri\nHafta 3: Çatlatma ve Eskitme Yöntemleri\nHafta 4: Stencil (Şablon) ile Desen Oluşturma\nHafta 5: Dekupaj ve Kolaj Uygulamaları\nHafta 6: Rölyef Pasta ve Kabartma Teknikleri\nHafta 7: Takı Kutusu ve Obje Tasarımı\nHafta 8: Sergi Hazırlığı ve Final Ürünü", null, null, "Evinizdeki eski eşyaları birer sanat eserine dönüştürün! Ahşabın sıcaklığını renklerle birleştirerek yaratıcılığınızı konuşturun. Hem dinlendirici bir hobi edinin hem de kendi ürünlerinizi üretin.", 40, new DateTime(2026, 7, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 12, 0, 0, 0), new DateTime(2026, 7, 5, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1513364776144-60967b0f800f?w=600", true, false, "Ahşap Yüzey Hazırlama ve Zımparalama\nFarklı Boyama ve Eskitme Teknikleri\nDekupaj ve Transfer Uygulamaları\nVernikleme ve Koruma Yöntemleri\nSanatsal Kompozisyon ve Renk Teorisi", 4, 1000m, 20, "Temel bilgisayar kullanımı.", new DateTime(2026, 5, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 9, 0, 0, 0), "Kendini geliştirmek isteyen herkes." },
                    { 7, 3, "Geleneksel Seramik ve Çömlekçilik", "Hafta 1: Seramik Çamuru ve Alet Tanıtımı\nHafta 2: Plaka Yöntemi ile Kutu Yapımı\nHafta 3: Fitil (Sucuk) Yöntemi ile Vazo Tasarımı\nHafta 4: Çimdikleme Yöntemi ile Kase Yapımı\nHafta 5: Kuruma Süreçleri ve Rötuş\nHafta 6: Sır Altı Boyama Teknikleri\nHafta 7: Sırlama ve Fırın Hazırlığı\nHafta 8: Fırın Açılışı ve Ürün Teslimi", null, null, "Toprağın ellerinizde şekil alışına şahit olun. Çamurun terapi etkisinden faydalanırken, kendi mutfağınız için tabaklar, vazolar ve dekoratif objeler üreteceksiniz. Bin yıllık bir geleneği keşfedin.", 50, new DateTime(2026, 8, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 12, 0, 0, 0), new DateTime(2026, 8, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1565193566173-7a0ee3dbe261?w=600", true, false, "Çamur Hazırlama ve Yoğurma Teknikleri\nElde Şekillendirme (Fitil, Plaka, Sucuk)\nTurnet Kullanımı ve Simetri\nSırlama ve Boyama Sanatı\nPişirme Süreçleri ve Fırın Bilgisi", 4, 750m, 15, "Temel bilgisayar kullanımı.", new DateTime(2026, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 9, 0, 0, 0), "Kendini geliştirmek isteyen herkes." },
                    { 8, 4, "Gitar Eğitimi (Klasik ve Akustik)", "Hafta 1: Gitar Tanıtımı ve Boş Tel Egzersizleri\nHafta 2: Nota Yerleri ve İlk Akorlar\nHafta 3: Temel Ritim Kalıpları\nHafta 4: Arpej Teknikleri ve Parmak Hızı\nHafta 5: Bareli Akorlar ve Geçişler\nHafta 6: Şarkı Formları ve Eşlik Etme\nHafta 7: Tab Okuma ve Solo Giriş\nHafta 8: Konser Hazırlığı ve Performans", null, null, "Müziğin evrensel dilini gitarla keşfedin. Notaların büyülü dünyasına adım atarak sevdiğiniz şarkıları çalmaya başlayın. Parmak egzersizlerinden sahne duruşuna kadar tam kapsamlı bir eğitim.", 45, new DateTime(2026, 7, 30, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 12, 0, 0, 0), new DateTime(2026, 7, 25, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1510915361894-db8b60106cb1?w=600", true, false, "Nota Okuma ve Temel Müzik Teorisi\nDoğru Oturuş ve Tutuş Teknikleri\nAkustik ve Klasik Akor Bilgisi\nRitim ve Arpej Uygulamaları\nPopüler Parça Analizi ve İcrası", 4, 750m, 12, "Temel bilgisayar kullanımı.", new DateTime(2026, 5, 5, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 9, 0, 0, 0), "Kendini geliştirmek isteyen herkes." },
                    { 9, 4, "Bağlama (Saz) Kursu", "Hafta 1: Bağlama Parçaları ve Akort Yapımı\nHafta 2: Nota Yerleri ve İlk Egzersizler\nHafta 3: Basit Türküler ve Tartım Kalıpları\nHafta 4: Parmak Çarpma ve Çekme Teknikleri\nHafta 5: Orta Seviye Türkü İcrası\nHafta 6: Bağlama Düzeni ve Diğer Düzenler\nHafta 7: Yöresel Tavır Çalışmaları\nHafta 8: Türkü Sunumu ve Sertifika", null, null, "Özümüzden bir sesi, bağlamayı öğrenin. Anadolu'nun bin yıllık ezgilerini tellerle dile getirin. Türkülerimizi doğru teknik ve tavırla icra etmek için profesyonel bir başlangıç yapın.", 50, new DateTime(2026, 8, 30, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 12, 0, 0, 0), new DateTime(2026, 8, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1507838153414-b4b713384a76?w=600", true, false, "Bağlama Düzeni ve Tezene Teknikleri\nTemel Solfej ve Nota Bilgisi\nYöre Tavırları ve Ezgi Yapıları\nHalk Müziği Repertuvar Oluşturma\nKulaktan Çalma ve Duyuş Gelişimi", 4, 520m, 15, "Temel bilgisayar kullanımı.", new DateTime(2026, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 9, 0, 0, 0), "Kendini geliştirmek isteyen herkes." },
                    { 10, 5, "Modern Yoga ve Klinik Pilates", "Hafta 1: Temel Nefes ve Isınma Hareketleri\nHafta 2: Yoga Başlangıç Serileri (Asanalar)\nHafta 3: Pilates Temel Prensipleri ve Mat\nHafta 4: Denge ve Koordinasyon Çalışmaları\nHafta 5: İleri Seviye Esneme Hareketleri\nHafta 6: Karın ve Sırt Kaslarını Güçlendirme\nHafta 7: Derin Gevşeme ve Meditasyon\nHafta 8: Kişisel Rutin Oluşturma ve Test", null, null, "Vücudunuzu esnetin, zihninizi dinlendirin. Günlük stresin etkilerinden kurtulurken daha fit ve sağlıklı bir bedene kavuşun. Her yaşa uygun egzersizlerle yaşam kalitenizi artırın.", 36, new DateTime(2026, 7, 31, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 12, 0, 0, 0), new DateTime(2026, 7, 28, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=600", true, false, "Doğru Nefes ve Meditasyon Teknikleri\nVücut Esnekliği ve Denge Gelişimi\nCore Bölgesi Güçlendirme (Pilates)\nDuruş (Postür) Bozukluklarını Düzeltme\nZihinsel Odaklanma ve Stres Yönetimi", 4, 680m, 25, "Temel bilgisayar kullanımı.", new DateTime(2026, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 9, 0, 0, 0), "Kendini geliştirmek isteyen herkes." },
                    { 11, 6, "Geleneksel ve Modern Türk Mutfağı", "Hafta 1: Mutfak Düzeni ve Güvenliği\nHafta 2: Kesim Teknikleri ve Ön Hazırlık (Mise en Place)\nHafta 3: Çorbalar ve Başlangıç Yemekleri\nHafta 4: Osmanlı Saray Mutfağı Lezzetleri\nHafta 5: Anadolu'nun Yöresel Yemekleri\nHafta 6: Deniz Ürünleri ve Pişirme Yöntemleri\nHafta 7: Hamur İşleri ve Mantı Sanatı\nHafta 8: Modern Sunum Teknikleri ve Final Menüsü", null, null, "Mutfaktaki yeteneğinizi profesyonelliğe taşıyın. Kebaplardan zeytinyağlılara, saray mutfağından sokak lezzetlerine kadar Türk mutfağının tüm sırlarını uzman şeflerden öğrenin.", 60, new DateTime(2026, 7, 30, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 12, 0, 0, 0), new DateTime(2026, 7, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=600", true, false, "Mutfak Hijyeni ve Bıçak Kullanımı\nEt, Balık ve Kümes Hayvanları İşleme\nTemel Soslar ve Çorba Teknikleri\nZeytinyağlı ve Mezelerin Sırları\nTabak Sunumu ve Görsel Sanat", 4, 720m, 18, "Temel bilgisayar kullanımı.", new DateTime(2026, 5, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 9, 0, 0, 0), "Kendini geliştirmek isteyen herkes." },
                    { 12, 6, "Profesyonel Pastacılık ve Ekmekçilik", "Hafta 1: Pastacılık Malzemeleri ve Hijyen\nHafta 2: Pandispanya ve Temel Kekler\nHafta 3: Pasta Kremaları ve Ganaj Yapımı\nHafta 4: Şeker Hamuru ile Figür Tasarımı\nHafta 5: Tartlar, Kişler ve Kurabiyeler\nHafta 6: Mayalı Hamurlar ve Açma/Poğaça\nHafta 7: Dünya Tatlıları (Tiramisu, Cheesecake)\nHafta 8: Katlı Pasta Yapımı ve Sunum", null, null, "Tatlı bir kariyer başlangıcı yapın! Pasta süsleme tekniklerinden artisan ekmek yapımına kadar her şeyi uygulamalı olarak göreceksiniz. Kendi butik pastanenizi açma hayalinize bir adım daha yaklaşın.", 50, new DateTime(2026, 8, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 12, 0, 0, 0), new DateTime(2026, 8, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=600", true, false, "Temel Hamur ve Krema Teknikleri\nButik Pasta Tasarımı ve Süsleme\nArtisan (Ekşi Mayalı) Ekmek Yapımı\nÇikolata İşleme ve Şeker Sanatı\nMaliyet Hesaplama ve İşletme Bilgisi", 4, 840m, 15, "Temel bilgisayar kullanımı.", new DateTime(2026, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 9, 0, 0, 0), "Kendini geliştirmek isteyen herkes." },
                    { 13, 7, "Güzellik ve Cilt Bakım Teknikleri", "Hafta 1: Anatomi, Fizyoloji ve Hijyen\nHafta 2: Cilt Tipleri ve Bakım Ürünleri\nHafta 3: Yüz Masajı ve Lenf Drenaj\nHafta 4: Klasik ve Modern Makyaj Teknikleri\nHafta 5: Kaş ve Kirpik Tasarımı\nHafta 6: Vücut Bakımı ve Selülit Tedavileri\nHafta 7: El ve Ayak Bakımı (Manikür/Pedikür)\nHafta 8: Sektörel Trendler ve İş Bulma Stratejileri", null, null, "Profesyonel bir estetisyen olma yolunda ilk adımınızı atın. Cilt analizinden makyaj tekniklerine, masajdan epilasyona kadar geniş bir yelpazede uzmanlaşın. Güzellik sektörünün parlayan yıldızı olun.", 72, new DateTime(2026, 8, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 12, 0, 0, 0), new DateTime(2026, 8, 5, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1560750588-73207b1ef5b8?w=600", true, false, "Detaylı Cilt Analizi ve Teşhis\nProfesyonel Makyaj ve Kontürleme\nTemel Masaj ve Rahatlama Teknikleri\nEpilasyon ve Depilasyon Yöntemleri\nMüşteri İlişkileri ve Salon Yönetimi", 6, 950m, 12, "Temel bilgisayar kullanımı.", new DateTime(2026, 5, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 9, 0, 0, 0), "Kendini geliştirmek isteyen herkes." },
                    { 14, 8, "Dijital Muhasebe ve Ön Muhasebe Uzmanlığı", "Hafta 1: Temel Muhasebe Kavramları\nHafta 2: Bilanço ve Gelir Tablosu Yapısı\nHafta 3: Ticari Belgeler ve Kayıt Düzeni\nHafta 4: Bilgisayarlı Muhasebe Giriş\nHafta 5: Cari Hesap ve Stok Takibi\nHafta 6: KDV, Muhtasar ve Vergi İşlemleri\nHafta 7: Personel Özlük İşleri ve Bordrolama\nHafta 8: Dönem Sonu İşlemleri ve Kapanış", null, null, "Şirketlerin finansal dilini öğrenin. Bilgisayarlı muhasebe programları ve güncel mevzuat eğitimi ile iş dünyasının aranan personeli olun. Finansal okuryazarlığınızı zirveye taşıyın.", 90, new DateTime(2026, 8, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 12, 0, 0, 0), new DateTime(2026, 7, 25, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?w=600", true, false, "Tek Düzen Hesap Planı ve Mantığı\nFatura, Çek, Senet ve Bordro İşlemleri\nLOGO ve Zirve Muhasebe Programları\nVergi Mevzuatı ve Beyanname Süreçleri\nFinansal Analiz ve Raporlama Yetisi", 4, 760m, 30, "Temel bilgisayar kullanımı.", new DateTime(2026, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 9, 0, 0, 0), "Kendini geliştirmek isteyen herkes." },
                    { 15, 8, "Dijital Girişimcilik ve E-Ticaret Atölyesi", "Hafta 1: Girişimcilik Temelleri ve Fikir Doğrulama\nHafta 2: İş Planı ve Stratejik Yol Haritası\nHafta 3: E-Ticaret Platformları ve Kurulum\nHafta 4: Dijital Pazarlama ve SEO Giriş\nHafta 5: İçerik Üretimi ve Sosyal Medya Yönetimi\nHafta 6: Ödeme Sistemleri ve Lojistik Yönetimi\nHafta 7: Teşvikler, Hibeler ve Şirketleşme\nHafta 8: Demo Day: Proje Sunumları ve Sertifika", null, null, "Kendi işinizin patronu olun! Fikrinizi bir iş planına dönüştürmekten e-ticaret sitenizi kurmaya kadar her adımı birlikte atıyoruz. Girişimcilik ekosisteminde fark yaratacak stratejiler geliştirin.", 40, new DateTime(2026, 8, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 12, 0, 0, 0), new DateTime(2026, 8, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1559136555-9303baea8ebd?w=600", true, false, "İş Modeli Kanvası ve Strateji Oluşturma\nE-Ticaret Altyapıları ve Pazaryeri Yönetimi\nDijital Pazarlama ve Sosyal Medya Reklamcılığı\nFinansal Planlama ve Yatırımcı Sunumu\nMarka Tescil ve Hukuki Süreçler", 4, 590m, 25, "Temel bilgisayar kullanımı.", new DateTime(2026, 6, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 9, 0, 0, 0), "Kendini geliştirmek isteyen herkes." },
                    { 16, 1, "Siber Güvenlik ve Ağ Temelleri", "Hafta 1: Ağ Temelleri ve TCP/IP\nHafta 2: Bilgi Toplama ve Keşif Teknikleri\nHafta 3: Sistem Güvenliği ve Sıkılaştırma\nHafta 4: Web Uygulama Güvenliği\nHafta 5: Kablosuz Ağ Güvenliği\nHafta 6: Sosyal Mühendislik ve İnsan Faktörü\nHafta 7: Olay Müdahale ve Adli Bilişim\nHafta 8: Final Laboratuvar Uygulaması", null, null, "Dijital dünyayı korumayı öğrenin! Ağ güvenliğinden etik hackerlığa kadar geniş bir yelpazede temel eğitim alın. Siber tehditlere karşı nasıl savunma yapacağınızı uzmanından dinleyin.", 64, new DateTime(2026, 11, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 12, 0, 0, 0), new DateTime(2026, 10, 28, 0, 0, 0, 0, DateTimeKind.Unspecified), "https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=600", true, false, "TCP/IP ve Ağ Protokolleri Bilgisi\nSızma Testi (Pentest) Temelleri\nEtik Hackerlık Etik ve Teknikleri\nSistem ve Veri Güvenliği Stratejileri\nSiber Olaylara Müdahale Yöntemleri", 6, 0m, 20, "Temel bilgisayar kullanımı.", new DateTime(2026, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 9, 0, 0, 0), "Kendini geliştirmek isteyen herkes." }
                });

            migrationBuilder.InsertData(
                table: "Applications",
                columns: new[] { "Id", "AdminNote", "ApplyDate", "BirthPlace", "CertificateCode", "CourseId", "DateOfBirth", "DeletedAt", "DeletedBy", "EducationLevel", "Email", "ExamGrade", "FirstName", "IsCompleted", "IsDeleted", "IsPaid", "LastName", "PaymentMethod", "PhoneNumber", "Status", "StudentId", "TcNo", "TransactionId" },
                values: new object[,]
                {
                    { 1, null, new DateTime(2026, 1, 2, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "HE-2026-0001", 1, new DateTime(1990, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, "Üniversite", "ali.koc@email.com", null, "Ali", true, false, false, "Koç", null, "0532 111 22 33", 1, null, "12345678901", null },
                    { 2, null, new DateTime(2026, 2, 3, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "HE-2026-0002", 4, new DateTime(1992, 5, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, "Lise", "ayse.demir@email.com", null, "Ayşe", true, false, false, "Demir", null, "0533 222 33 44", 1, null, "23456789012", null },
                    { 3, null, new DateTime(2026, 4, 4, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, 8, new DateTime(1988, 12, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, "Üniversite", "mehmet.yilmaz@email.com", null, "Mehmet", false, false, false, "Yılmaz", null, "0534 333 44 55", 0, null, "34567890123", null },
                    { 4, null, new DateTime(2026, 4, 5, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, 11, new DateTime(1993, 8, 25, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, "Ön Lisans", "fatma.kara@email.com", null, "Fatma", false, false, false, "Kara", null, "0535 444 55 66", 0, null, "45678901234", null },
                    { 5, "Kontenjan doldu.", new DateTime(2026, 4, 5, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, 2, new DateTime(1991, 11, 30, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, "Lise", "hasan.celik@email.com", null, "Hasan", false, false, false, "Çelik", null, "0536 555 66 77", 2, null, "56789012345", null },
                    { 6, null, new DateTime(2026, 4, 6, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, 10, new DateTime(1994, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, "Üniversite", "zeynep.aydin@email.com", null, "Zeynep", false, false, false, "Aydın", null, "0537 666 77 88", 1, null, "67890123456", null },
                    { 7, null, new DateTime(2026, 4, 7, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, 13, new DateTime(1996, 6, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, "Lise", "emre.sahin@email.com", null, "Emre", false, false, false, "Şahin", null, "0538 777 88 99", 0, null, "78901234567", null },
                    { 8, null, new DateTime(2026, 4, 7, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, 14, new DateTime(1995, 3, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, "Üniversite", "derya.ozturk@email.com", null, "Derya", false, false, false, "Öztürk", null, "0539 888 99 00", 1, null, "89012345678", null },
                    { 16, null, new DateTime(2026, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, 16, new DateTime(1998, 4, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, "Üniversite", "hakan@email.com", null, "Hakan", false, false, false, "Yılmaz", null, "0541 000 11 22", 1, null, "11122233344", null },
                    { 17, null, new DateTime(2026, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, 16, new DateTime(2000, 10, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null, "Üniversite", "selin@email.com", null, "Selin", false, false, false, "Demir", null, "0541 000 11 33", 1, null, "22233344455", null }
                });

            migrationBuilder.InsertData(
                table: "Comments",
                columns: new[] { "Id", "Content", "CourseId", "CreatedAt", "Rating", "UserEmail" },
                values: new object[,]
                {
                    { 1, "Python kursu gerçekten harika! Yapay zeka projeleri çok etkileyici.", 1, new DateTime(2026, 4, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), 5, "ali@mail.com" },
                    { 2, "İçerik çok yoğun, bazı kısımları anlamak için tekrar izlemem gerekti. Biraz daha yavaş ilerleyebilirdi.", 1, new DateTime(2026, 4, 25, 0, 0, 0, 0, DateTimeKind.Unspecified), 3, "selin@mail.com" },
                    { 3, "Web tasarım kursunda öğrendiğim tekniklerle kendi portfolyomu oluşturdum. Teşekkürler!", 2, new DateTime(2026, 4, 28, 0, 0, 0, 0, DateTimeKind.Unspecified), 5, "murat@mail.com" },
                    { 4, "Gitar çalmayı hep istiyordum, bu kurs sayesinde ilk şarkımı çaldım. Eğitmen çok ilgili.", 8, new DateTime(2026, 4, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), 5, "deniz@mail.com" },
                    { 5, "Pastacılık kursu güzel ama mutfak biraz kalabalıktı. Daha küçük gruplar olsa daha iyi olurdu.", 12, new DateTime(2026, 4, 22, 0, 0, 0, 0, DateTimeKind.Unspecified), 3, "buse@mail.com" },
                    { 6, "Hocanın anlatımı çok teknik kalıyor, yeni başlayanlar zorlanabilir.", 1, new DateTime(2026, 4, 29, 0, 0, 0, 0, DateTimeKind.Unspecified), 2, "hakan@mail.com" }
                });

            migrationBuilder.InsertData(
                table: "CourseResources",
                columns: new[] { "Id", "CourseId", "FilePath", "FileType", "Title", "UploadDate" },
                values: new object[,]
                {
                    { 1, 1, "#", "PDF/Döküman", "1. Hafta: Python Kurulumu ve Geliştirme Ortamı", new DateTime(2026, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 2, 1, "#", "PDF/Döküman", "2. Hafta: Değişkenler ve Veri Tipleri", new DateTime(2026, 3, 8, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 3, 1, "#", "PDF/Döküman", "3. Hafta: Döngüler ve Karar Yapıları", new DateTime(2026, 3, 15, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 4, 1, "#", "PDF/Döküman", "4. Hafta: Fonksiyonlar ve Kapsam", new DateTime(2026, 3, 22, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 5, 1, "#", "PDF/Döküman", "5. Hafta: Hata Yönetimi ve Dosyalama", new DateTime(2026, 3, 29, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 6, 1, "#", "PDF/Döküman", "6. Hafta: Numpy ve Pandas Giriş", new DateTime(2026, 4, 5, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 7, 1, "#", "PDF/Döküman", "7. Hafta: Scikit-Learn ile Veri Tahmini", new DateTime(2026, 4, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 8, 1, "#", "PDF/Döküman", "8. Hafta: Bitirme Projesi Sunumu", new DateTime(2026, 4, 19, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 9, 2, "#", "PDF/Döküman", "1. Hafta: HTML5 Semantik Yapı", new DateTime(2026, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 10, 2, "#", "PDF/Döküman", "2. Hafta: CSS3 Tasarım ve Grid", new DateTime(2026, 3, 8, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 11, 2, "#", "PDF/Döküman", "3. Hafta: Responsive Tasarım Prensipleri", new DateTime(2026, 3, 15, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 12, 2, "#", "PDF/Döküman", "4. Hafta: JavaScript Temelleri", new DateTime(2026, 3, 22, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 13, 2, "#", "PDF/Döküman", "5. Hafta: DOM ve Eventler", new DateTime(2026, 3, 29, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 14, 2, "#", "PDF/Döküman", "6. Hafta: Modern JS ve ES6+", new DateTime(2026, 4, 5, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 15, 2, "#", "PDF/Döküman", "7. Hafta: React Bileşen Yapısı", new DateTime(2026, 4, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 16, 2, "#", "PDF/Döküman", "8. Hafta: Web Sitesi Yayınlama", new DateTime(2026, 4, 19, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 17, 3, "#", "PDF/Döküman", "1. Hafta: Donanım ve Windows 11", new DateTime(2026, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 18, 3, "#", "PDF/Döküman", "2. Hafta: Word ile Rapor Hazırlama", new DateTime(2026, 3, 8, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 19, 3, "#", "PDF/Döküman", "3. Hafta: Excel Temel Formüller", new DateTime(2026, 3, 15, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 20, 3, "#", "PDF/Döküman", "4. Hafta: Excel Veri Analizi", new DateTime(2026, 3, 22, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 21, 3, "#", "PDF/Döküman", "5. Hafta: PowerPoint Sunum Teknikleri", new DateTime(2026, 3, 29, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 22, 3, "#", "PDF/Döküman", "6. Hafta: Outlook ve Bulut Sistemleri", new DateTime(2026, 4, 5, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 23, 3, "#", "PDF/Döküman", "7. Hafta: Siber Güvenlik Farkındalığı", new DateTime(2026, 4, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 24, 3, "#", "PDF/Döküman", "8. Hafta: Ofis Yazılımları Sınavı", new DateTime(2026, 4, 19, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 25, 4, "#", "PDF/Döküman", "1. Hafta: Selamlaşma ve Alfabe", new DateTime(2026, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 26, 4, "#", "PDF/Döküman", "2. Hafta: Şimdiki Zaman Cümleleri", new DateTime(2026, 3, 8, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 27, 4, "#", "PDF/Döküman", "3. Hafta: Geçmiş Zaman ve Hikaye", new DateTime(2026, 3, 15, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 28, 4, "#", "PDF/Döküman", "4. Hafta: Gelecek Zaman ve Planlar", new DateTime(2026, 3, 22, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 29, 4, "#", "PDF/Döküman", "5. Hafta: Sıfatlar ve Karşılaştırmalar", new DateTime(2026, 3, 29, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 30, 4, "#", "PDF/Döküman", "6. Hafta: İş ve Sosyal Hayat", new DateTime(2026, 4, 5, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 31, 4, "#", "PDF/Döküman", "7. Hafta: Seyahat ve Kültür", new DateTime(2026, 4, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 32, 4, "#", "PDF/Döküman", "8. Hafta: Konuşma ve Dinleme Testi", new DateTime(2026, 4, 19, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 33, 5, "#", "PDF/Döküman", "1. Hafta: Almanca Sesletim Kuralları", new DateTime(2026, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 34, 5, "#", "PDF/Döküman", "2. Hafta: Temel Tanışma Kalıpları", new DateTime(2026, 3, 8, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 35, 5, "#", "PDF/Döküman", "3. Hafta: Düzenli ve Düzensiz Fiiller", new DateTime(2026, 3, 15, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 36, 5, "#", "PDF/Döküman", "4. Hafta: Zamirler ve İsim Halleri", new DateTime(2026, 3, 22, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 37, 5, "#", "PDF/Döküman", "5. Hafta: Zaman Zarfları ve Saatler", new DateTime(2026, 3, 29, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 38, 5, "#", "PDF/Döküman", "6. Hafta: Günlük Aktiviteler", new DateTime(2026, 4, 5, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 39, 5, "#", "PDF/Döküman", "7. Hafta: Yiyecek ve İçecekler", new DateTime(2026, 4, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 40, 5, "#", "PDF/Döküman", "8. Hafta: Genel A1 Tekrarı", new DateTime(2026, 4, 19, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 41, 6, "#", "PDF/Döküman", "1. Hafta: Fırça ve Boya Çeşitleri", new DateTime(2026, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 42, 6, "#", "PDF/Döküman", "2. Hafta: Ahşap Hazırlama Teknikleri", new DateTime(2026, 3, 8, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 43, 6, "#", "PDF/Döküman", "3. Hafta: Zımpara ve Astar Atma", new DateTime(2026, 3, 15, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 44, 6, "#", "PDF/Döküman", "4. Hafta: Akrilik Boyama Sanatı", new DateTime(2026, 3, 22, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 45, 6, "#", "PDF/Döküman", "5. Hafta: Eskitme ve Patina", new DateTime(2026, 3, 29, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 46, 6, "#", "PDF/Döküman", "6. Hafta: Dekupaj ve Transfer", new DateTime(2026, 4, 5, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 47, 6, "#", "PDF/Döküman", "7. Hafta: Vernikleme ve Koruma", new DateTime(2026, 4, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 48, 6, "#", "PDF/Döküman", "8. Hafta: Yıl Sonu Sergi Ürünü", new DateTime(2026, 4, 19, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 49, 7, "#", "PDF/Döküman", "1. Hafta: Çamur Türleri ve Hazırlama", new DateTime(2026, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 50, 7, "#", "PDF/Döküman", "2. Hafta: Elde Şekillendirme: Fitil", new DateTime(2026, 3, 8, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 51, 7, "#", "PDF/Döküman", "3. Hafta: Plaka Yöntemi ile Formlar", new DateTime(2026, 3, 15, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 52, 7, "#", "PDF/Döküman", "4. Hafta: Çimdikleme ve Kase Tasarımı", new DateTime(2026, 3, 22, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 53, 7, "#", "PDF/Döküman", "5. Hafta: Kuruma ve Rötuş Safhaları", new DateTime(2026, 3, 29, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 54, 7, "#", "PDF/Döküman", "6. Hafta: Sır Altı Boyama", new DateTime(2026, 4, 5, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 55, 7, "#", "PDF/Döküman", "7. Hafta: Sırlama Teknikleri", new DateTime(2026, 4, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 56, 7, "#", "PDF/Döküman", "8. Hafta: Fırınlama ve Teslim", new DateTime(2026, 4, 19, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 57, 8, "#", "PDF/Döküman", "1. Hafta: Gitar Tutuşu ve Akort", new DateTime(2026, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 58, 8, "#", "PDF/Döküman", "2. Hafta: Notaların Klavyedeki Yeri", new DateTime(2026, 3, 8, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 59, 8, "#", "PDF/Döküman", "3. Hafta: Temel Akorlar ve Geçişler", new DateTime(2026, 3, 15, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 60, 8, "#", "PDF/Döküman", "4. Hafta: Ritim ve Vuruş Kalıpları", new DateTime(2026, 3, 22, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 61, 8, "#", "PDF/Döküman", "5. Hafta: Arpej ve Parmak Stili", new DateTime(2026, 3, 29, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 62, 8, "#", "PDF/Döküman", "6. Hafta: Bareli Akorlara Giriş", new DateTime(2026, 4, 5, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 63, 8, "#", "PDF/Döküman", "7. Hafta: Solo ve Gam Pratikleri", new DateTime(2026, 4, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 64, 8, "#", "PDF/Döküman", "8. Hafta: Popüler Şarkı İcrası", new DateTime(2026, 4, 19, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 65, 9, "#", "PDF/Döküman", "1. Hafta: Bağlama Düzeni ve Tutuş", new DateTime(2026, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 66, 9, "#", "PDF/Döküman", "2. Hafta: Solfej ve Nota Okuma", new DateTime(2026, 3, 8, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 67, 9, "#", "PDF/Döküman", "3. Hafta: Tezene (Mızrap) Vuruşları", new DateTime(2026, 3, 15, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 68, 9, "#", "PDF/Döküman", "4. Hafta: Alt Tel Egzersizleri", new DateTime(2026, 3, 22, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 69, 9, "#", "PDF/Döküman", "5. Hafta: Orta ve Üst Tel Kullanımı", new DateTime(2026, 3, 29, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 70, 9, "#", "PDF/Döküman", "6. Hafta: Basit Halk Ezgileri", new DateTime(2026, 4, 5, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 71, 9, "#", "PDF/Döküman", "7. Hafta: Tavır ve Üslup Çalışması", new DateTime(2026, 4, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 72, 9, "#", "PDF/Döküman", "8. Hafta: Repertuvar ve Sınav", new DateTime(2026, 4, 19, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 73, 10, "#", "PDF/Döküman", "1. Hafta: Yoga ve Nefes Egzersizleri", new DateTime(2026, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 74, 10, "#", "PDF/Döküman", "2. Hafta: Güneşe Selam ve Asanalar", new DateTime(2026, 3, 8, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 75, 10, "#", "PDF/Döküman", "3. Hafta: Duruş ve Postür Analizi", new DateTime(2026, 3, 15, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 76, 10, "#", "PDF/Döküman", "4. Hafta: Core Bölgesi Gelişimi", new DateTime(2026, 3, 22, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 77, 10, "#", "PDF/Döküman", "5. Hafta: Esneklik ve Güç Dengesi", new DateTime(2026, 3, 29, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 78, 10, "#", "PDF/Döküman", "6. Hafta: Klinik Pilates Mat Egzersizleri", new DateTime(2026, 4, 5, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 79, 10, "#", "PDF/Döküman", "7. Hafta: Meditasyon ve Gevşeme", new DateTime(2026, 4, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 80, 10, "#", "PDF/Döküman", "8. Hafta: Kişisel Gelişim Planı", new DateTime(2026, 4, 19, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 81, 11, "#", "PDF/Döküman", "1. Hafta: Mutfak Ekipmanları ve Hijyen", new DateTime(2026, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 82, 11, "#", "PDF/Döküman", "2. Hafta: Profesyonel Bıçak Kullanımı", new DateTime(2026, 3, 8, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 83, 11, "#", "PDF/Döküman", "3. Hafta: Temel Çorba ve Soslar", new DateTime(2026, 3, 15, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 84, 11, "#", "PDF/Döküman", "4. Hafta: Et ve Sebze Pişirme", new DateTime(2026, 3, 22, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 85, 11, "#", "PDF/Döküman", "5. Hafta: Hamur İşleri ve Mantı", new DateTime(2026, 3, 29, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 86, 11, "#", "PDF/Döküman", "6. Hafta: Zeytinyağlılar ve Mezeler", new DateTime(2026, 4, 5, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 87, 11, "#", "PDF/Döküman", "7. Hafta: Osmanlı Saray Yemekleri", new DateTime(2026, 4, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 88, 11, "#", "PDF/Döküman", "8. Hafta: Modern Sunum Sanatı", new DateTime(2026, 4, 19, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 89, 12, "#", "PDF/Döküman", "1. Hafta: Pasta Malzemeleri Tanıtımı", new DateTime(2026, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 90, 12, "#", "PDF/Döküman", "2. Hafta: Pandispanya ve Kekler", new DateTime(2026, 3, 8, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 91, 12, "#", "PDF/Döküman", "3. Hafta: Pastacı Kreması Yapımı", new DateTime(2026, 3, 15, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 92, 12, "#", "PDF/Döküman", "4. Hafta: Şeker Hamuru ve Figür", new DateTime(2026, 3, 22, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 93, 12, "#", "PDF/Döküman", "5. Hafta: Tart ve Kurabiyeler", new DateTime(2026, 3, 29, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 94, 12, "#", "PDF/Döküman", "6. Hafta: Çikolata ve Tatlılar", new DateTime(2026, 4, 5, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 95, 12, "#", "PDF/Döküman", "7. Hafta: Katlı Pasta Tasarımı", new DateTime(2026, 4, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 96, 12, "#", "PDF/Döküman", "8. Hafta: Vitrin Pastacılığı", new DateTime(2026, 4, 19, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 97, 13, "#", "PDF/Döküman", "1. Hafta: Saç Anatomisi ve Analizi", new DateTime(2026, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 98, 13, "#", "PDF/Döküman", "2. Hafta: Hijyen ve Müşteri İlişkileri", new DateTime(2026, 3, 8, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 99, 13, "#", "PDF/Döküman", "3. Hafta: Temel Kesim Teknikleri", new DateTime(2026, 3, 15, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 100, 13, "#", "PDF/Döküman", "4. Hafta: Fön ve Şekillendirme", new DateTime(2026, 3, 22, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 101, 13, "#", "PDF/Döküman", "5. Hafta: Boya ve Renk Teorisi", new DateTime(2026, 3, 29, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 102, 13, "#", "PDF/Döküman", "6. Hafta: Modern Renklendirme", new DateTime(2026, 4, 5, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 103, 13, "#", "PDF/Döküman", "7. Hafta: Topuz ve Gelin Saçı", new DateTime(2026, 4, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 104, 13, "#", "PDF/Döküman", "8. Hafta: Salon Yönetimi", new DateTime(2026, 4, 19, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 105, 14, "#", "PDF/Döküman", "1. Hafta: Tek Düzen Hesap Planı", new DateTime(2026, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 106, 14, "#", "PDF/Döküman", "2. Hafta: Fatura ve İrsaliye Kaydı", new DateTime(2026, 3, 8, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 107, 14, "#", "PDF/Döküman", "3. Hafta: Banka ve Kasa İşlemleri", new DateTime(2026, 3, 15, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 108, 14, "#", "PDF/Döküman", "4. Hafta: Cari Hesap Takibi", new DateTime(2026, 3, 22, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 109, 14, "#", "PDF/Döküman", "5. Hafta: Vergi ve Beyannameler", new DateTime(2026, 3, 29, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 110, 14, "#", "PDF/Döküman", "6. Hafta: Personel ve Bordrolama", new DateTime(2026, 4, 5, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 111, 14, "#", "PDF/Döküman", "7. Hafta: Bilgisayarlı Muhasebe", new DateTime(2026, 4, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 112, 14, "#", "PDF/Döküman", "8. Hafta: Yıl Sonu Kapanış", new DateTime(2026, 4, 19, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 113, 15, "#", "PDF/Döküman", "1. Hafta: Girişimcilik ve İnovasyon", new DateTime(2026, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 114, 15, "#", "PDF/Döküman", "2. Hafta: İş Modeli Oluşturma", new DateTime(2026, 3, 8, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 115, 15, "#", "PDF/Döküman", "3. Hafta: E-Ticaret Altyapıları", new DateTime(2026, 3, 15, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 116, 15, "#", "PDF/Döküman", "4. Hafta: Dijital Pazarlama ve SEO", new DateTime(2026, 3, 22, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 117, 15, "#", "PDF/Döküman", "5. Hafta: Sosyal Medya Reklamcılığı", new DateTime(2026, 3, 29, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 118, 15, "#", "PDF/Döküman", "6. Hafta: Ödeme ve Lojistik Sistemi", new DateTime(2026, 4, 5, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 119, 15, "#", "PDF/Döküman", "7. Hafta: Finansal Planlama", new DateTime(2026, 4, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 120, 15, "#", "PDF/Döküman", "8. Hafta: Mezuniyet Proje Sunumu", new DateTime(2026, 4, 19, 0, 0, 0, 0, DateTimeKind.Unspecified) }
                });

            migrationBuilder.InsertData(
                table: "ExhibitionItems",
                columns: new[] { "Id", "ArtistName", "CourseId", "CreatedAt", "ExternalLink", "ImageUrl", "ModelUrl", "PositionX", "PositionY", "PositionZ", "RotationY", "TechDetails", "Title", "Type", "VideoUrl" },
                values: new object[,]
                {
                    { 1, "Emine Yılmaz", 6, new DateTime(2026, 5, 2, 18, 23, 13, 666, DateTimeKind.Local).AddTicks(3623), null, "/images/exhibition/lace.png", null, 0f, 1.6f, -6f, 0f, null, "Zarif Çeyizlik Dantel", 0, null },
                    { 2, "Fatma Demir", 7, new DateTime(2026, 5, 2, 18, 23, 13, 666, DateTimeKind.Local).AddTicks(6665), null, "/images/exhibition/cini.png", null, 5.2f, 1.6f, -3f, -60f, null, "Geleneksel Çini Boyama", 0, null },
                    { 3, "Zeynep Kaya", 6, new DateTime(2026, 5, 2, 18, 23, 13, 666, DateTimeKind.Local).AddTicks(6680), null, "/images/exhibition/jewelry.png", null, 5.2f, 1.6f, 3f, -120f, null, "Altın İşlemeli Nakış", 0, null },
                    { 4, "Ömer Çelik", 7, new DateTime(2026, 5, 2, 18, 23, 13, 666, DateTimeKind.Local).AddTicks(6687), null, "/images/exhibition/wood_carving.png", null, 0f, 1.6f, 6f, 180f, null, "Ahşap Oyma Sanatı", 0, null },
                    { 5, "Ayşe Yıldız", 6, new DateTime(2026, 5, 2, 18, 23, 13, 666, DateTimeKind.Local).AddTicks(6692), null, "/images/exhibition/jewelry.png", null, -5.2f, 1.6f, 3f, 120f, null, "Gümüş Telkari İşçiliği", 0, null },
                    { 6, "Mehmet Aydın", 7, new DateTime(2026, 5, 2, 18, 23, 13, 666, DateTimeKind.Local).AddTicks(6698), null, "/images/exhibition/ebru.png", null, -5.2f, 1.6f, -3f, 60f, null, "Ebru Sanatı Ustası", 0, null }
                });

            migrationBuilder.InsertData(
                table: "Instructors",
                columns: new[] { "Id", "CourseId", "CvFilePath", "DeletedAt", "DeletedBy", "FullName", "ImageUrl", "IsDeleted", "Password", "Title", "Username" },
                values: new object[,]
                {
                    { 1, 1, null, null, null, "Dr. Ahmet Yılmaz", null, false, null, "Bilişim Teknolojileri Öğretmeni", null },
                    { 2, 2, null, null, null, "Elif Kaya", null, false, null, "Web Tasarım Uzmanı", null },
                    { 3, 3, null, null, null, "Mehmet Demir", null, false, null, "Bilgisayar Eğitmeni", null },
                    { 4, 4, null, null, null, "Sarah Johnson", null, false, null, "İngilizce Öğretmeni", null },
                    { 5, 5, null, null, null, "Hans Weber", null, false, null, "Almanca Öğretmeni", null },
                    { 6, 6, null, null, null, "Zeynep Arslan", null, false, null, "El Sanatları Ustası", null },
                    { 7, 7, null, null, null, "Fatma Çelik", null, false, null, "Seramik Sanatçısı", null },
                    { 8, 8, null, null, null, "Can Özkan", null, false, null, "Müzik Öğretmeni", null },
                    { 9, 9, null, null, null, "Hasan Korkmaz", null, false, null, "Halk Müziği Sanatçısı", null },
                    { 10, 10, null, null, null, "Ayşe Yıldırım", null, false, null, "Yoga Eğitmeni", null },
                    { 11, 11, null, null, null, "Şef Mustafa Bey", null, false, null, "Aşçıbaşı", null },
                    { 12, 12, null, null, null, "Pınar Aydın", null, false, null, "Pastacılık Ustası", null },
                    { 13, 13, null, null, null, "Derya Şahin", null, false, null, "Kuaför / Güzellik Uzmanı", null },
                    { 14, 14, null, null, null, "Burak Öztürk", null, false, null, "Mali Müşavir", null },
                    { 15, 15, null, null, null, "Prof. Dr. Selin Aktaş", null, false, null, "Girişimcilik Danışmanı", null },
                    { 16, 16, null, null, null, "Caner Kandemir", null, false, "123", "Kıdemli Güvenlik Analisti", "caner" }
                });

            migrationBuilder.InsertData(
                table: "InstructorSchedules",
                columns: new[] { "Id", "Day", "EndTime", "InstructorId", "Note", "StartTime" },
                values: new object[] { 1, "Monday", new TimeSpan(0, 12, 0, 0, 0), 1, "Python Giriş", new TimeSpan(0, 9, 0, 0, 0) });

            migrationBuilder.CreateIndex(
                name: "IX_Applications_CourseId",
                table: "Applications",
                column: "CourseId");

            migrationBuilder.CreateIndex(
                name: "IX_Applications_StudentId",
                table: "Applications",
                column: "StudentId");

            migrationBuilder.CreateIndex(
                name: "IX_Attendances_ApplicationId",
                table: "Attendances",
                column: "ApplicationId");

            migrationBuilder.CreateIndex(
                name: "IX_Attendances_CourseId",
                table: "Attendances",
                column: "CourseId");

            migrationBuilder.CreateIndex(
                name: "IX_Comments_CourseId",
                table: "Comments",
                column: "CourseId");

            migrationBuilder.CreateIndex(
                name: "IX_CourseChatMessages_CourseId",
                table: "CourseChatMessages",
                column: "CourseId");

            migrationBuilder.CreateIndex(
                name: "IX_CourseResources_CourseId",
                table: "CourseResources",
                column: "CourseId");

            migrationBuilder.CreateIndex(
                name: "IX_CourseReviews_CourseId",
                table: "CourseReviews",
                column: "CourseId");

            migrationBuilder.CreateIndex(
                name: "IX_CourseReviews_StudentId",
                table: "CourseReviews",
                column: "StudentId");

            migrationBuilder.CreateIndex(
                name: "IX_Courses_CategoryId",
                table: "Courses",
                column: "CategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_ExhibitionItems_CourseId",
                table: "ExhibitionItems",
                column: "CourseId");

            migrationBuilder.CreateIndex(
                name: "IX_GalleryComments_GalleryItemId",
                table: "GalleryComments",
                column: "GalleryItemId");

            migrationBuilder.CreateIndex(
                name: "IX_GalleryItems_CourseId",
                table: "GalleryItems",
                column: "CourseId");

            migrationBuilder.CreateIndex(
                name: "IX_GalleryLikes_GalleryItemId",
                table: "GalleryLikes",
                column: "GalleryItemId");

            migrationBuilder.CreateIndex(
                name: "IX_Instructors_CourseId",
                table: "Instructors",
                column: "CourseId");

            migrationBuilder.CreateIndex(
                name: "IX_InstructorSchedules_InstructorId",
                table: "InstructorSchedules",
                column: "InstructorId");

            migrationBuilder.CreateIndex(
                name: "IX_Messages_ReceiverInstructorId",
                table: "Messages",
                column: "ReceiverInstructorId");

            migrationBuilder.CreateIndex(
                name: "IX_News_CourseId",
                table: "News",
                column: "CourseId");

            migrationBuilder.CreateIndex(
                name: "IX_NewsComments_NewsId",
                table: "NewsComments",
                column: "NewsId");

            migrationBuilder.CreateIndex(
                name: "IX_NewsLikes_NewsId",
                table: "NewsLikes",
                column: "NewsId");

            migrationBuilder.CreateIndex(
                name: "IX_Students_TcNo",
                table: "Students",
                column: "TcNo",
                unique: true,
                filter: "[TcNo] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_SuccessStories_CourseId",
                table: "SuccessStories",
                column: "CourseId");

            migrationBuilder.CreateIndex(
                name: "IX_SuccessStories_StudentId",
                table: "SuccessStories",
                column: "StudentId");

            migrationBuilder.CreateIndex(
                name: "IX_TeacherChatMessages_InstructorId",
                table: "TeacherChatMessages",
                column: "InstructorId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AdminUsers");

            migrationBuilder.DropTable(
                name: "Attendances");

            migrationBuilder.DropTable(
                name: "CalendarEvents");

            migrationBuilder.DropTable(
                name: "Certificates");

            migrationBuilder.DropTable(
                name: "Comments");

            migrationBuilder.DropTable(
                name: "Complaints");

            migrationBuilder.DropTable(
                name: "CourseChatMessages");

            migrationBuilder.DropTable(
                name: "CourseResources");

            migrationBuilder.DropTable(
                name: "CourseReviews");

            migrationBuilder.DropTable(
                name: "EmailLogs");

            migrationBuilder.DropTable(
                name: "ExhibitionItems");

            migrationBuilder.DropTable(
                name: "GalleryComments");

            migrationBuilder.DropTable(
                name: "GalleryLikes");

            migrationBuilder.DropTable(
                name: "InstructorSchedules");

            migrationBuilder.DropTable(
                name: "LogEntries");

            migrationBuilder.DropTable(
                name: "MasterTrainerApplications");

            migrationBuilder.DropTable(
                name: "Messages");

            migrationBuilder.DropTable(
                name: "NewsComments");

            migrationBuilder.DropTable(
                name: "NewsLikes");

            migrationBuilder.DropTable(
                name: "NewsStories");

            migrationBuilder.DropTable(
                name: "ProfanityBans");

            migrationBuilder.DropTable(
                name: "SuccessStories");

            migrationBuilder.DropTable(
                name: "TeacherChatMessages");

            migrationBuilder.DropTable(
                name: "TemporaryLinks");

            migrationBuilder.DropTable(
                name: "Applications");

            migrationBuilder.DropTable(
                name: "GalleryItems");

            migrationBuilder.DropTable(
                name: "News");

            migrationBuilder.DropTable(
                name: "Instructors");

            migrationBuilder.DropTable(
                name: "Students");

            migrationBuilder.DropTable(
                name: "Courses");

            migrationBuilder.DropTable(
                name: "Categories");
        }
    }
}

