using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace HalkEgitimSistemi.Migrations
{
    /// <inheritdoc />
    public partial class AddInstructorDetailsFinal : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
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

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 19,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 14, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(6736), new DateTime(2026, 6, 13, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(7295) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 20,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 14, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(7411), new DateTime(2026, 5, 19, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(7418) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 21,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 14, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(7428), new DateTime(2026, 5, 29, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(7431) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 22,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 14, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(7436), new DateTime(2026, 6, 3, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(7439) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 23,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 14, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(7470), new DateTime(2026, 5, 24, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(7473) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 24,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 14, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(7478), new DateTime(2026, 6, 8, 19, 46, 4, 392, DateTimeKind.Local).AddTicks(7481) });

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 400, DateTimeKind.Local).AddTicks(3075));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 401, DateTimeKind.Local).AddTicks(760));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 401, DateTimeKind.Local).AddTicks(794));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 401, DateTimeKind.Local).AddTicks(1028));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 401, DateTimeKind.Local).AddTicks(1037));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 401, DateTimeKind.Local).AddTicks(1043));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 19, 46, 4, 413, DateTimeKind.Local).AddTicks(65));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 19, 46, 4, 413, DateTimeKind.Local).AddTicks(731));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(1202));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(3480));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(3494));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(3499));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(3503));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(3507));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(3606));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(3611));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(3616));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(3620));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(3625));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 397, DateTimeKind.Local).AddTicks(3630));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 4, 19, 46, 4, 413, DateTimeKind.Local).AddTicks(7245));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 19, 46, 4, 413, DateTimeKind.Local).AddTicks(8534));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 19, 46, 4, 413, DateTimeKind.Local).AddTicks(8543));

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 418, DateTimeKind.Local).AddTicks(6656));

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 419, DateTimeKind.Local).AddTicks(1699));

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 419, DateTimeKind.Local).AddTicks(1711));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 19, 46, 4, 412, DateTimeKind.Local).AddTicks(3363));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 19, 46, 4, 412, DateTimeKind.Local).AddTicks(4175));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 414, DateTimeKind.Local).AddTicks(6614));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 416, DateTimeKind.Local).AddTicks(919));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 416, DateTimeKind.Local).AddTicks(960));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 416, DateTimeKind.Local).AddTicks(969));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 416, DateTimeKind.Local).AddTicks(975));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 1,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 418, DateTimeKind.Local).AddTicks(1672));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 2,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 418, DateTimeKind.Local).AddTicks(2423));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 3,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 14, 19, 46, 4, 418, DateTimeKind.Local).AddTicks(2430));
        }
    }
}
