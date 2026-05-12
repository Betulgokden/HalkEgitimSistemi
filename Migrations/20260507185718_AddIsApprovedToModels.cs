using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace HalkEgitimSistemi.Migrations
{
    /// <inheritdoc />
    public partial class AddIsApprovedToModels : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "IsApproved",
                table: "Students",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsApproved",
                table: "Instructors",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 21, 57, 15, 280, DateTimeKind.Local).AddTicks(4543));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 21, 57, 15, 280, DateTimeKind.Local).AddTicks(6865));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 21, 57, 15, 280, DateTimeKind.Local).AddTicks(6872));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 21, 57, 15, 280, DateTimeKind.Local).AddTicks(6875));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 21, 57, 15, 280, DateTimeKind.Local).AddTicks(6878));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 21, 57, 15, 280, DateTimeKind.Local).AddTicks(6881));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 4, 21, 57, 15, 282, DateTimeKind.Local).AddTicks(3129));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 6, 21, 57, 15, 282, DateTimeKind.Local).AddTicks(3344));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 21, 57, 15, 279, DateTimeKind.Local).AddTicks(9899));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 21, 57, 15, 280, DateTimeKind.Local).AddTicks(1220));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 21, 57, 15, 280, DateTimeKind.Local).AddTicks(1225));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 21, 57, 15, 280, DateTimeKind.Local).AddTicks(1228));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 21, 57, 15, 280, DateTimeKind.Local).AddTicks(1247));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 21, 57, 15, 280, DateTimeKind.Local).AddTicks(1249));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 21, 57, 15, 280, DateTimeKind.Local).AddTicks(1251));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 21, 57, 15, 280, DateTimeKind.Local).AddTicks(1252));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 21, 57, 15, 280, DateTimeKind.Local).AddTicks(1254));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 21, 57, 15, 280, DateTimeKind.Local).AddTicks(1256));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 21, 57, 15, 280, DateTimeKind.Local).AddTicks(1257));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 21, 57, 15, 280, DateTimeKind.Local).AddTicks(1259));

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 1,
                column: "IsApproved",
                value: true);

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
                table: "LibraryBooks",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "Category", "IsCourseNote", "StarCount" },
                values: new object[] { "Yazılım", true, 12 });

            migrationBuilder.UpdateData(
                table: "LibraryBooks",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "Author", "Category", "IsCourseNote", "StarCount" },
                values: new object[] { "Prof. Dr. İlber Ortaylı", "Sanat", true, 8 });

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 21, 57, 15, 282, DateTimeKind.Local).AddTicks(1334));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 3, 21, 57, 15, 282, DateTimeKind.Local).AddTicks(1656));

            migrationBuilder.UpdateData(
                table: "Students",
                keyColumn: "Id",
                keyValue: 99,
                column: "IsApproved",
                value: false);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsApproved",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "IsApproved",
                table: "Instructors");

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 19, 53, 29, 382, DateTimeKind.Local).AddTicks(384));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 19, 53, 29, 382, DateTimeKind.Local).AddTicks(2961));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 19, 53, 29, 382, DateTimeKind.Local).AddTicks(2968));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 19, 53, 29, 382, DateTimeKind.Local).AddTicks(2972));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 19, 53, 29, 382, DateTimeKind.Local).AddTicks(2975));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 19, 53, 29, 382, DateTimeKind.Local).AddTicks(2978));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 4, 19, 53, 29, 384, DateTimeKind.Local).AddTicks(2974));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 6, 19, 53, 29, 384, DateTimeKind.Local).AddTicks(3196));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 19, 53, 29, 381, DateTimeKind.Local).AddTicks(2737));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 19, 53, 29, 381, DateTimeKind.Local).AddTicks(5370));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 19, 53, 29, 381, DateTimeKind.Local).AddTicks(5383));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 19, 53, 29, 381, DateTimeKind.Local).AddTicks(5389));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 19, 53, 29, 381, DateTimeKind.Local).AddTicks(5426));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 19, 53, 29, 381, DateTimeKind.Local).AddTicks(5429));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 19, 53, 29, 381, DateTimeKind.Local).AddTicks(5433));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 19, 53, 29, 381, DateTimeKind.Local).AddTicks(5436));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 19, 53, 29, 381, DateTimeKind.Local).AddTicks(5439));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 19, 53, 29, 381, DateTimeKind.Local).AddTicks(5442));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 19, 53, 29, 381, DateTimeKind.Local).AddTicks(5446));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 19, 53, 29, 381, DateTimeKind.Local).AddTicks(5449));

            migrationBuilder.UpdateData(
                table: "LibraryBooks",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "Category", "IsCourseNote", "StarCount" },
                values: new object[] { "", false, 0 });

            migrationBuilder.UpdateData(
                table: "LibraryBooks",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "Author", "Category", "IsCourseNote", "StarCount" },
                values: new object[] { "Prof. Dr. İber Ortaylı", "", false, 0 });

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 19, 53, 29, 384, DateTimeKind.Local).AddTicks(1143));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 3, 19, 53, 29, 384, DateTimeKind.Local).AddTicks(1431));
        }
    }
}
