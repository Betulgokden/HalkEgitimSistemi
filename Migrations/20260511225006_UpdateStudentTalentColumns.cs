using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace HalkEgitimSistemi.Migrations
{
    /// <inheritdoc />
    public partial class UpdateStudentTalentColumns : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            /*
            migrationBuilder.DropForeignKey(
                name: "FK_Students_Neighborhoods_NeighborhoodId",
                table: "Students");

            migrationBuilder.DropIndex(
                name: "IX_Students_NeighborhoodId",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "NeighborhoodId",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "CreatedAt",
                table: "JobPostings");
            */

            migrationBuilder.AddColumn<string>(
                name: "Badges",
                table: "Students",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsAvailableForWork",
                table: "Students",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsSpotlight",
                table: "Students",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsVerified",
                table: "Students",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<string>(
                name: "PortfolioUrl",
                table: "Students",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "SecurityLog",
                table: "Students",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "SuccessScore",
                table: "Students",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "Badges",
                table: "Employers",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsVerified",
                table: "Employers",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.CreateTable(
                name: "JobApplications",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    JobPostingId = table.Column<int>(type: "int", nullable: false),
                    StudentId = table.Column<int>(type: "int", nullable: true),
                    ApplicantFullName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ApplicantEmail = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ApplicantPhone = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ExperienceSummary = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Status = table.Column<int>(type: "int", nullable: false),
                    AppliedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    StudentSignatureData = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    EmployerStampData = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    AdminStampData = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PdfReportPath = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_JobApplications", x => x.Id);
                    table.ForeignKey(
                        name: "FK_JobApplications_JobPostings_JobPostingId",
                        column: x => x.JobPostingId,
                        principalTable: "JobPostings",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_JobApplications_Students_StudentId",
                        column: x => x.StudentId,
                        principalTable: "Students",
                        principalColumn: "Id");
                });

            migrationBuilder.InsertData(
                table: "Courses",
                columns: new[] { "Id", "CategoryId", "CourseName", "Curriculum", "DeletedAt", "DeletedBy", "Description", "DurationHours", "EndDate", "EndTime", "ExamDate", "ImageUrl", "IsActive", "IsDeleted", "IsLive", "LearningOutcomes", "LiveRoomId", "MaxAbsenceLimit", "Price", "Quota", "Requirements", "StartDate", "StartTime", "WeeklySyllabus", "WhoIsItFor" },
                values: new object[,]
                {
                    { 17, 8, "Profesyonel Arıcılık ve Bal Üretimi", "", null, null, "", 40, new DateTime(2026, 6, 30, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 12, 0, 0, 0), null, "https://images.unsplash.com/photo-1587334206571-3390ccc205df?w=600", true, false, false, "", null, 4, 300m, 30, "Temel bilgisayar kullanımı.", new DateTime(2026, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 9, 0, 0, 0), "Pazartesi: 09:00-12:00\nSalı: 09:00-12:00\nÇarşamba: 09:00-12:00", "Kendini geliştirmek isteyen herkes." },
                    { 18, 8, "Modern Seralarda Organik Tarım", "", null, null, "", 60, new DateTime(2026, 7, 25, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 12, 0, 0, 0), null, "https://images.unsplash.com/photo-1592419044706-39796d40f98c?w=600", true, false, false, "", null, 4, 450m, 25, "Temel bilgisayar kullanımı.", new DateTime(2026, 5, 25, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 9, 0, 0, 0), "Pazartesi: 09:00-12:00\nSalı: 09:00-12:00\nÇarşamba: 09:00-12:00", "Kendini geliştirmek isteyen herkes." }
                });

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 611, DateTimeKind.Local).AddTicks(4984));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 611, DateTimeKind.Local).AddTicks(6960));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 611, DateTimeKind.Local).AddTicks(6965));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 611, DateTimeKind.Local).AddTicks(6969));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 611, DateTimeKind.Local).AddTicks(6972));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 611, DateTimeKind.Local).AddTicks(7000));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 1, 50, 3, 613, DateTimeKind.Local).AddTicks(3578));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 1, 50, 3, 613, DateTimeKind.Local).AddTicks(3806));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 611, DateTimeKind.Local).AddTicks(531));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 611, DateTimeKind.Local).AddTicks(1540));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 611, DateTimeKind.Local).AddTicks(1568));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 611, DateTimeKind.Local).AddTicks(1571));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 611, DateTimeKind.Local).AddTicks(1573));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 611, DateTimeKind.Local).AddTicks(1575));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 611, DateTimeKind.Local).AddTicks(1576));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 611, DateTimeKind.Local).AddTicks(1689));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 611, DateTimeKind.Local).AddTicks(1691));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 611, DateTimeKind.Local).AddTicks(1693));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 611, DateTimeKind.Local).AddTicks(1694));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 611, DateTimeKind.Local).AddTicks(1696));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 1, 50, 3, 613, DateTimeKind.Local).AddTicks(5579));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 1, 50, 3, 613, DateTimeKind.Local).AddTicks(5990));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 1, 50, 3, 613, DateTimeKind.Local).AddTicks(5993));

            // JobPostings seed data removed due to migration stability issues.


            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 1, 50, 3, 613, DateTimeKind.Local).AddTicks(1010));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 8, 1, 50, 3, 613, DateTimeKind.Local).AddTicks(1288));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 613, DateTimeKind.Local).AddTicks(6797));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 613, DateTimeKind.Local).AddTicks(8598));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 613, DateTimeKind.Local).AddTicks(8602));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 613, DateTimeKind.Local).AddTicks(8605));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 613, DateTimeKind.Local).AddTicks(8607));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 1,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 614, DateTimeKind.Local).AddTicks(4262));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 2,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 614, DateTimeKind.Local).AddTicks(4729));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 3,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 12, 1, 50, 3, 614, DateTimeKind.Local).AddTicks(4736));

            migrationBuilder.UpdateData(
                table: "Students",
                keyColumn: "Id",
                keyValue: 99,
                columns: new[] { "Badges", "EloRating", "IsAvailableForWork", "IsSpotlight", "IsVerified", "PortfolioUrl", "SecurityLog", "SuccessScore" },
                values: new object[] { null, 1200, true, false, false, null, null, 0 });

            migrationBuilder.CreateIndex(
                name: "IX_JobApplications_JobPostingId",
                table: "JobApplications",
                column: "JobPostingId");

            migrationBuilder.CreateIndex(
                name: "IX_JobApplications_StudentId",
                table: "JobApplications",
                column: "StudentId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "JobApplications");

            migrationBuilder.DeleteData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 17);

            migrationBuilder.DeleteData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 18);

            migrationBuilder.DeleteData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 3);

            migrationBuilder.DropColumn(
                name: "Badges",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "IsAvailableForWork",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "IsSpotlight",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "IsVerified",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "PortfolioUrl",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "SecurityLog",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "SuccessScore",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "Badges",
                table: "Employers");

            migrationBuilder.DropColumn(
                name: "IsVerified",
                table: "Employers");

            migrationBuilder.AddColumn<int>(
                name: "NeighborhoodId",
                table: "Students",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "CreatedAt",
                table: "JobPostings",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 193, DateTimeKind.Local).AddTicks(1385));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 193, DateTimeKind.Local).AddTicks(3976));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 193, DateTimeKind.Local).AddTicks(3983));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 193, DateTimeKind.Local).AddTicks(4023));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 193, DateTimeKind.Local).AddTicks(4027));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 193, DateTimeKind.Local).AddTicks(4030));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 8, 0, 19, 8, 196, DateTimeKind.Local).AddTicks(1864));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 0, 19, 8, 196, DateTimeKind.Local).AddTicks(2579));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 192, DateTimeKind.Local).AddTicks(5747));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 192, DateTimeKind.Local).AddTicks(7189));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 192, DateTimeKind.Local).AddTicks(7195));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 192, DateTimeKind.Local).AddTicks(7198));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 192, DateTimeKind.Local).AddTicks(7200));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 192, DateTimeKind.Local).AddTicks(7203));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 192, DateTimeKind.Local).AddTicks(7206));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 192, DateTimeKind.Local).AddTicks(7208));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 192, DateTimeKind.Local).AddTicks(7210));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 192, DateTimeKind.Local).AddTicks(7212));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 192, DateTimeKind.Local).AddTicks(7214));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 192, DateTimeKind.Local).AddTicks(7216));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 1, 0, 19, 8, 197, DateTimeKind.Local).AddTicks(7514));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 6, 0, 19, 8, 197, DateTimeKind.Local).AddTicks(9574));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 0, 19, 8, 197, DateTimeKind.Local).AddTicks(9584));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 6, 0, 19, 8, 195, DateTimeKind.Local).AddTicks(5045));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 0, 19, 8, 195, DateTimeKind.Local).AddTicks(5661));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 198, DateTimeKind.Local).AddTicks(5038));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 199, DateTimeKind.Local).AddTicks(1690));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 199, DateTimeKind.Local).AddTicks(1717));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 199, DateTimeKind.Local).AddTicks(1725));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 199, DateTimeKind.Local).AddTicks(1731));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 1,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 200, DateTimeKind.Local).AddTicks(9200));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 2,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 200, DateTimeKind.Local).AddTicks(9635));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 3,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 11, 0, 19, 8, 200, DateTimeKind.Local).AddTicks(9640));

            migrationBuilder.UpdateData(
                table: "Students",
                keyColumn: "Id",
                keyValue: 99,
                columns: new[] { "EloRating", "NeighborhoodId" },
                values: new object[] { 1000, null });

            migrationBuilder.CreateIndex(
                name: "IX_Students_NeighborhoodId",
                table: "Students",
                column: "NeighborhoodId");

            migrationBuilder.AddForeignKey(
                name: "FK_Students_Neighborhoods_NeighborhoodId",
                table: "Students",
                column: "NeighborhoodId",
                principalTable: "Neighborhoods",
                principalColumn: "Id");
        }
    }
}
