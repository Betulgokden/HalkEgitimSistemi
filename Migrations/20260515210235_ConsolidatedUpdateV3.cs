using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace HalkEgitimSistemi.Migrations
{
    /// <inheritdoc />
    public partial class ConsolidatedUpdateV3 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 19,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 16, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1097), new DateTime(2026, 6, 15, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1479) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 20,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 16, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1546), new DateTime(2026, 5, 21, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1549) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 21,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 16, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1555), new DateTime(2026, 5, 31, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1558) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 22,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 16, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1561), new DateTime(2026, 6, 5, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1564) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 23,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 16, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1567), new DateTime(2026, 5, 26, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1570) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 24,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 16, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1573), new DateTime(2026, 6, 10, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1576) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 25,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 16, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1744), new DateTime(2026, 6, 25, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1747) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 26,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 16, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1751), new DateTime(2026, 6, 30, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1753) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 27,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 16, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1756), new DateTime(2026, 5, 28, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1759) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 28,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 16, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1762), new DateTime(2026, 6, 5, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1765) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 29,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 16, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1768), new DateTime(2026, 6, 20, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1771) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 30,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 16, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1774), new DateTime(2026, 5, 26, 0, 2, 32, 821, DateTimeKind.Local).AddTicks(1797) });

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 823, DateTimeKind.Local).AddTicks(2963));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 823, DateTimeKind.Local).AddTicks(6170));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 823, DateTimeKind.Local).AddTicks(6181));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 823, DateTimeKind.Local).AddTicks(6186));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 823, DateTimeKind.Local).AddTicks(6189));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 823, DateTimeKind.Local).AddTicks(6193));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 0, 2, 32, 826, DateTimeKind.Local).AddTicks(5784));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 0, 2, 32, 826, DateTimeKind.Local).AddTicks(6111));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 822, DateTimeKind.Local).AddTicks(7006));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 822, DateTimeKind.Local).AddTicks(8664));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 822, DateTimeKind.Local).AddTicks(8670));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 822, DateTimeKind.Local).AddTicks(8699));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 822, DateTimeKind.Local).AddTicks(8701));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 822, DateTimeKind.Local).AddTicks(8704));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 822, DateTimeKind.Local).AddTicks(8706));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 822, DateTimeKind.Local).AddTicks(8709));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 822, DateTimeKind.Local).AddTicks(8711));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 822, DateTimeKind.Local).AddTicks(8713));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 822, DateTimeKind.Local).AddTicks(8716));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 822, DateTimeKind.Local).AddTicks(8718));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 6, 0, 2, 32, 826, DateTimeKind.Local).AddTicks(8573));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 2, 32, 826, DateTimeKind.Local).AddTicks(9173));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 0, 2, 32, 826, DateTimeKind.Local).AddTicks(9179));

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 828, DateTimeKind.Local).AddTicks(3324));

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 828, DateTimeKind.Local).AddTicks(6473));

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 828, DateTimeKind.Local).AddTicks(6481));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 0, 2, 32, 826, DateTimeKind.Local).AddTicks(3105));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 0, 2, 32, 826, DateTimeKind.Local).AddTicks(3454));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 827, DateTimeKind.Local).AddTicks(270));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 827, DateTimeKind.Local).AddTicks(2969));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 827, DateTimeKind.Local).AddTicks(2977));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 827, DateTimeKind.Local).AddTicks(2981));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 827, DateTimeKind.Local).AddTicks(2985));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 1,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 828, DateTimeKind.Local).AddTicks(287));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 2,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 828, DateTimeKind.Local).AddTicks(780));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 3,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 16, 0, 2, 32, 828, DateTimeKind.Local).AddTicks(785));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 19,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 15, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7572), new DateTime(2026, 6, 14, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7826) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 20,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 15, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7878), new DateTime(2026, 5, 20, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7880) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 21,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 15, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7885), new DateTime(2026, 5, 30, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7886) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 22,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 15, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7889), new DateTime(2026, 6, 4, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7891) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 23,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 15, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7893), new DateTime(2026, 5, 25, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7895) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 24,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 15, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7897), new DateTime(2026, 6, 9, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7899) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 25,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 15, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7902), new DateTime(2026, 6, 24, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7904) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 26,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 15, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7906), new DateTime(2026, 6, 29, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7908) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 27,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 15, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7910), new DateTime(2026, 5, 27, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7912) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 28,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 15, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7914), new DateTime(2026, 6, 4, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7915) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 29,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 15, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7918), new DateTime(2026, 6, 19, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7920) });

            migrationBuilder.UpdateData(
                table: "Courses",
                keyColumn: "Id",
                keyValue: 30,
                columns: new[] { "EndDate", "StartDate" },
                values: new object[] { new DateTime(2026, 8, 15, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7936), new DateTime(2026, 5, 25, 23, 53, 18, 86, DateTimeKind.Local).AddTicks(7938) });

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 88, DateTimeKind.Local).AddTicks(2983));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 88, DateTimeKind.Local).AddTicks(5005));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 88, DateTimeKind.Local).AddTicks(5010));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 88, DateTimeKind.Local).AddTicks(5014));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 88, DateTimeKind.Local).AddTicks(5016));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 88, DateTimeKind.Local).AddTicks(5019));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 12, 23, 53, 18, 90, DateTimeKind.Local).AddTicks(2778));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 14, 23, 53, 18, 90, DateTimeKind.Local).AddTicks(3008));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 87, DateTimeKind.Local).AddTicks(8653));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 87, DateTimeKind.Local).AddTicks(9815));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 87, DateTimeKind.Local).AddTicks(9820));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 87, DateTimeKind.Local).AddTicks(9843));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 87, DateTimeKind.Local).AddTicks(9845));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 87, DateTimeKind.Local).AddTicks(9847));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 87, DateTimeKind.Local).AddTicks(9849));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 87, DateTimeKind.Local).AddTicks(9850));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 87, DateTimeKind.Local).AddTicks(9852));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 87, DateTimeKind.Local).AddTicks(9854));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 87, DateTimeKind.Local).AddTicks(9856));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 87, DateTimeKind.Local).AddTicks(9858));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 5, 23, 53, 18, 90, DateTimeKind.Local).AddTicks(4704));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 23, 53, 18, 90, DateTimeKind.Local).AddTicks(5135));

            migrationBuilder.UpdateData(
                table: "Ideas",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 13, 23, 53, 18, 90, DateTimeKind.Local).AddTicks(5139));

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 91, DateTimeKind.Local).AddTicks(3516));

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 91, DateTimeKind.Local).AddTicks(5448));

            migrationBuilder.UpdateData(
                table: "JobPostings",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 91, DateTimeKind.Local).AddTicks(5453));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 10, 23, 53, 18, 90, DateTimeKind.Local).AddTicks(937));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 11, 23, 53, 18, 90, DateTimeKind.Local).AddTicks(1183));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 90, DateTimeKind.Local).AddTicks(5893));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 90, DateTimeKind.Local).AddTicks(8056));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 90, DateTimeKind.Local).AddTicks(8064));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 90, DateTimeKind.Local).AddTicks(8068));

            migrationBuilder.UpdateData(
                table: "QuizQuestions",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 90, DateTimeKind.Local).AddTicks(8070));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 1,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 91, DateTimeKind.Local).AddTicks(2410));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 2,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 91, DateTimeKind.Local).AddTicks(2652));

            migrationBuilder.UpdateData(
                table: "SiteSettings",
                keyColumn: "Id",
                keyValue: 3,
                column: "LastUpdated",
                value: new DateTime(2026, 5, 15, 23, 53, 18, 91, DateTimeKind.Local).AddTicks(2656));
        }
    }
}
