using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace HalkEgitimSistemi.Migrations
{
    /// <inheritdoc />
    public partial class AddIdeaBankV2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {




            migrationBuilder.CreateTable(
                name: "Ideas",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Category = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    AuthorName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Likes = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Ideas", x => x.Id);
                });



            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(5255));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(7203));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(7208));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(7212));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(7241));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(7244));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 6, 13, 58, 19, 553, DateTimeKind.Local).AddTicks(9718));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 8, 13, 58, 19, 554, DateTimeKind.Local).AddTicks(687));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(1361));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(2360));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(2364));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(2366));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(2368));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(2370));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(2371));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(2373));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(2379));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(2381));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(2383));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 9, 13, 58, 19, 550, DateTimeKind.Local).AddTicks(2384));

            migrationBuilder.InsertData(
                table: "Ideas",
                columns: new[] { "Id", "AuthorName", "Category", "CreatedAt", "Description", "Likes", "Title" },
                values: new object[,]
                {
                    { 1, "Betül Gökden", "Dijitalleşme", new DateTime(2026, 4, 29, 13, 58, 19, 554, DateTimeKind.Local).AddTicks(7970), "Kursiyerlerin ödevlerini takip edebileceği bir mobil uygulama.", 45, "Dijital Kurs Asistanı" },
                    { 2, "Mehmet Demir", "Sanat & Kültür", new DateTime(2026, 5, 4, 13, 58, 19, 554, DateTimeKind.Local).AddTicks(9343), "Köy okullarına gidip çocuklara ebru sanatı öğretecek bir minibüs.", 120, "Gezici Sanat Atölyesi" },
                    { 3, "Fatma Çelik", "Sosyal Sorumluluk", new DateTime(2026, 5, 7, 13, 58, 19, 554, DateTimeKind.Local).AddTicks(9352), "Dikiş nakış kurslarındaki atık kumaşlardan oyuncak yapıp bağışlama.", 88, "Atık Kumaş Dönüşümü" }
                });

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 4, 13, 58, 19, 552, DateTimeKind.Local).AddTicks(8011));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 5, 13, 58, 19, 552, DateTimeKind.Local).AddTicks(9521));

            migrationBuilder.UpdateData(
                table: "Students",
                keyColumn: "Id",
                keyValue: 99,
                columns: new[] { "Email", "Password" },
                values: new object[] { "betul.gokden@halkegitim.com", "123" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {


            migrationBuilder.DropTable(
                name: "Ideas");



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
                columns: new[] { "Email", "Password" },
                values: new object[] { "betulgokden8@gmail.com", "cinar08" });
        }
    }
}
