using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace HalkEgitimSistemi.Migrations
{
    /// <inheritdoc />
    public partial class AddMissingJobPostingColumnsV2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            /*
            migrationBuilder.DropForeignKey(
                name: "FK_JobPostings_Employers_EmployerId",
                table: "JobPostings");

            migrationBuilder.DropIndex(
                name: "IX_JobPostings_EmployerId",
                table: "JobPostings");
            */

            migrationBuilder.AlterColumn<string>(
                name: "Title",
                table: "JobPostings",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(100)",
                oldMaxLength: 100);

            /*
            migrationBuilder.AddColumn<string>(
                name: "CompanyName",
                table: "JobPostings",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "ContactEmail",
                table: "JobPostings",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "Deadline",
                table: "JobPostings",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "JobType",
                table: "JobPostings",
                type: "nvarchar(max)",
                nullable: true);
            */

            /*
            migrationBuilder.AddColumn<string>(
                name: "DiscountCode",
                table: "Applications",
                type: "nvarchar(max)",
                nullable: true);
            */

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 195, DateTimeKind.Local).AddTicks(1655));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 195, DateTimeKind.Local).AddTicks(4778));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 195, DateTimeKind.Local).AddTicks(4786));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 195, DateTimeKind.Local).AddTicks(4791));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 195, DateTimeKind.Local).AddTicks(4794));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 195, DateTimeKind.Local).AddTicks(4798));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 1, 27, 32, 200, DateTimeKind.Local).AddTicks(5235));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 1, 27, 32, 200, DateTimeKind.Local).AddTicks(5719));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(4530));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(6492));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(6505));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(6509));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(6511));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(6515));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(6517));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(6562));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(6565));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(6568));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(6571));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 194, DateTimeKind.Local).AddTicks(6574));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 3, 1, 27, 32, 200, DateTimeKind.Local).AddTicks(8584));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 8, 1, 27, 32, 200, DateTimeKind.Local).AddTicks(9266));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 1, 27, 32, 200, DateTimeKind.Local).AddTicks(9272));

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "Address", "BirthYear", "IsApproved" },
                values: new object[] { "Borçka, Artvin", 1985, false });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 2,
                column: "IsApproved",
                value: false);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 3,
                column: "IsApproved",
                value: false);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 4,
                column: "IsApproved",
                value: false);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 5,
                column: "IsApproved",
                value: false);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 6,
                column: "IsApproved",
                value: false);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 7,
                column: "IsApproved",
                value: false);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 8,
                column: "IsApproved",
                value: false);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 9,
                column: "IsApproved",
                value: false);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 10,
                column: "IsApproved",
                value: false);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 11,
                column: "IsApproved",
                value: false);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 12,
                column: "IsApproved",
                value: false);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 13,
                column: "IsApproved",
                value: false);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 14,
                column: "IsApproved",
                value: false);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 15,
                column: "IsApproved",
                value: false);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 16,
                column: "IsApproved",
                value: false);

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "CompanyName", "ContactEmail", "CreatedAt", "Deadline", "JobType" },
                values: new object[] { "", "", new DateTime(2026, 5, 13, 1, 27, 32, 202, DateTimeKind.Local).AddTicks(5627), null, "Tam Zamanlı" });

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "CompanyName", "ContactEmail", "CreatedAt", "Deadline", "JobType" },
                values: new object[] { "", "", new DateTime(2026, 5, 13, 1, 27, 32, 202, DateTimeKind.Local).AddTicks(8794), null, "Tam Zamanlı" });

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "CompanyName", "ContactEmail", "CreatedAt", "Deadline", "JobType" },
                values: new object[] { "", "", new DateTime(2026, 5, 13, 1, 27, 32, 202, DateTimeKind.Local).AddTicks(8802), null, "Tam Zamanlı" });

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 8, 1, 27, 32, 200, DateTimeKind.Local).AddTicks(882));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 1, 27, 32, 200, DateTimeKind.Local).AddTicks(1541));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 201, DateTimeKind.Local).AddTicks(509));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 201, DateTimeKind.Local).AddTicks(3567));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 201, DateTimeKind.Local).AddTicks(3574));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 201, DateTimeKind.Local).AddTicks(3578));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 201, DateTimeKind.Local).AddTicks(3582));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 1,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 202, DateTimeKind.Local).AddTicks(416));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 2,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 202, DateTimeKind.Local).AddTicks(798));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 3,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 13, 1, 27, 32, 202, DateTimeKind.Local).AddTicks(803));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CompanyName",
                table: "JobPostings");

            migrationBuilder.DropColumn(
                name: "ContactEmail",
                table: "JobPostings");

            migrationBuilder.DropColumn(
                name: "Deadline",
                table: "JobPostings");

            migrationBuilder.DropColumn(
                name: "JobType",
                table: "JobPostings");

            migrationBuilder.DropColumn(
                name: "DiscountCode",
                table: "Applications");

            migrationBuilder.AlterColumn<string>(
                name: "Title",
                table: "JobPostings",
                type: "nvarchar(100)",
                maxLength: 100,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 901, DateTimeKind.Local).AddTicks(5699));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 901, DateTimeKind.Local).AddTicks(7730));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 901, DateTimeKind.Local).AddTicks(7735));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 901, DateTimeKind.Local).AddTicks(7739));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 901, DateTimeKind.Local).AddTicks(7742));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 901, DateTimeKind.Local).AddTicks(7770));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 12, 49, 2, 903, DateTimeKind.Local).AddTicks(5224));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 12, 49, 2, 903, DateTimeKind.Local).AddTicks(5557));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 901, DateTimeKind.Local).AddTicks(1445));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 901, DateTimeKind.Local).AddTicks(2517));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 901, DateTimeKind.Local).AddTicks(2546));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 901, DateTimeKind.Local).AddTicks(2548));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 901, DateTimeKind.Local).AddTicks(2550));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 901, DateTimeKind.Local).AddTicks(2552));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 901, DateTimeKind.Local).AddTicks(2553));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 901, DateTimeKind.Local).AddTicks(2555));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 901, DateTimeKind.Local).AddTicks(2557));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 901, DateTimeKind.Local).AddTicks(2559));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 901, DateTimeKind.Local).AddTicks(2560));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 901, DateTimeKind.Local).AddTicks(2562));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 12, 49, 2, 903, DateTimeKind.Local).AddTicks(8101));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 12, 49, 2, 903, DateTimeKind.Local).AddTicks(8849));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 12, 49, 2, 903, DateTimeKind.Local).AddTicks(8854));

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "Address", "BirthYear", "IsApproved" },
                values: new object[] { null, null, true });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 2,
                column: "IsApproved",
                value: true);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 3,
                column: "IsApproved",
                value: true);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 4,
                column: "IsApproved",
                value: true);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 5,
                column: "IsApproved",
                value: true);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 6,
                column: "IsApproved",
                value: true);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 7,
                column: "IsApproved",
                value: true);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 8,
                column: "IsApproved",
                value: true);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 9,
                column: "IsApproved",
                value: true);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 10,
                column: "IsApproved",
                value: true);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 11,
                column: "IsApproved",
                value: true);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 12,
                column: "IsApproved",
                value: true);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 13,
                column: "IsApproved",
                value: true);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 14,
                column: "IsApproved",
                value: true);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 15,
                column: "IsApproved",
                value: true);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 16,
                column: "IsApproved",
                value: true);

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 905, DateTimeKind.Local).AddTicks(2172));

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 905, DateTimeKind.Local).AddTicks(4835));

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 905, DateTimeKind.Local).AddTicks(4844));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 12, 49, 2, 903, DateTimeKind.Local).AddTicks(2832));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 8, 12, 49, 2, 903, DateTimeKind.Local).AddTicks(3435));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 904, DateTimeKind.Local).AddTicks(217));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 904, DateTimeKind.Local).AddTicks(2627));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 904, DateTimeKind.Local).AddTicks(2634));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 904, DateTimeKind.Local).AddTicks(2638));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 904, DateTimeKind.Local).AddTicks(2641));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 1,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 905, DateTimeKind.Local).AddTicks(176));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 2,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 905, DateTimeKind.Local).AddTicks(588));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 3,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 12, 12, 49, 2, 905, DateTimeKind.Local).AddTicks(591));

            migrationBuilder.CreateIndex(
                name: "IX_JobPostings_EmployerId",
                table: "JobPostings",
                column: "EmployerId");

            migrationBuilder.AddForeignKey(
                name: "FK_JobPostings_Employers_EmployerId",
                table: "JobPostings",
                column: "EmployerId",
                principalTable: "Employers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
