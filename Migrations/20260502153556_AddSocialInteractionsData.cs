using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace HalkEgitimSistemi.Migrations
{
    /// <inheritdoc />
    public partial class AddSocialInteractionsData : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 35, 53, 545, DateTimeKind.Local).AddTicks(9688));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 35, 53, 546, DateTimeKind.Local).AddTicks(3029));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 35, 53, 546, DateTimeKind.Local).AddTicks(3039));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 35, 53, 546, DateTimeKind.Local).AddTicks(3045));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 35, 53, 546, DateTimeKind.Local).AddTicks(3050));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 35, 53, 546, DateTimeKind.Local).AddTicks(3055));

            migrationBuilder.InsertData(
                table: "GalleryComments",
                columns: new[] { "Id", "Content", "CreatedAt", "GalleryItemId", "IsApproved", "IsInstructorResponse", "UserEmail", "X", "Y" },
                values: new object[,]
                {
                    { 1, "Bu fotoğraf harika çıkmış!", new DateTime(2026, 4, 24, 18, 35, 53, 548, DateTimeKind.Local).AddTicks(5120), 1, true, false, "mine@gmail.com", null, null },
                    { 2, "Eğitimler çok verimli geçiyor, belli oluyor.", new DateTime(2026, 4, 26, 18, 35, 53, 548, DateTimeKind.Local).AddTicks(5483), 3, true, false, "nihat@gmail.com", null, null },
                    { 3, "El sanatları sergisini kaçırmayın derim.", new DateTime(2026, 4, 30, 18, 35, 53, 548, DateTimeKind.Local).AddTicks(5490), 6, true, false, "oya@gmail.com", null, null }
                });

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 35, 53, 544, DateTimeKind.Local).AddTicks(1001));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 35, 53, 544, DateTimeKind.Local).AddTicks(3020));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 35, 53, 544, DateTimeKind.Local).AddTicks(3031));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 35, 53, 544, DateTimeKind.Local).AddTicks(3036));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 35, 53, 544, DateTimeKind.Local).AddTicks(3040));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 35, 53, 544, DateTimeKind.Local).AddTicks(3043));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 35, 53, 544, DateTimeKind.Local).AddTicks(3048));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 35, 53, 544, DateTimeKind.Local).AddTicks(3051));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 35, 53, 544, DateTimeKind.Local).AddTicks(3055));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 35, 53, 544, DateTimeKind.Local).AddTicks(3058));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 35, 53, 544, DateTimeKind.Local).AddTicks(3062));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 35, 53, 544, DateTimeKind.Local).AddTicks(3065));

            migrationBuilder.InsertData(
                table: "GalleryLikes",
                columns: new[] { "Id", "CreatedAt", "GalleryItemId", "UserEmail" },
                values: new object[,]
                {
                    { 1, new DateTime(2026, 4, 22, 18, 35, 53, 548, DateTimeKind.Local).AddTicks(2089), 1, "caner@gmail.com" },
                    { 2, new DateTime(2026, 4, 23, 18, 35, 53, 548, DateTimeKind.Local).AddTicks(2470), 1, "derya@gmail.com" },
                    { 3, new DateTime(2026, 4, 24, 18, 35, 53, 548, DateTimeKind.Local).AddTicks(2478), 2, "elif@gmail.com" },
                    { 4, new DateTime(2026, 4, 25, 18, 35, 53, 548, DateTimeKind.Local).AddTicks(2483), 3, "fatih@gmail.com" },
                    { 5, new DateTime(2026, 4, 26, 18, 35, 53, 548, DateTimeKind.Local).AddTicks(2489), 4, "gamze@gmail.com" },
                    { 6, new DateTime(2026, 4, 27, 18, 35, 53, 548, DateTimeKind.Local).AddTicks(2494), 5, "hande@gmail.com" },
                    { 7, new DateTime(2026, 4, 28, 18, 35, 53, 548, DateTimeKind.Local).AddTicks(2500), 6, "ilker@gmail.com" },
                    { 8, new DateTime(2026, 4, 29, 18, 35, 53, 548, DateTimeKind.Local).AddTicks(2505), 7, "jale@gmail.com" },
                    { 9, new DateTime(2026, 4, 30, 18, 35, 53, 548, DateTimeKind.Local).AddTicks(2510), 8, "kenan@gmail.com" },
                    { 10, new DateTime(2026, 5, 1, 18, 35, 53, 548, DateTimeKind.Local).AddTicks(2515), 9, "leyla@gmail.com" }
                });

            migrationBuilder.InsertData(
                table: "NewsComments",
                columns: new[] { "Id", "Content", "CreatedAt", "IsApproved", "NewsId", "UserEmail" },
                values: new object[,]
                {
                    { 1, "Kayıtlar için sabırsızlanıyoruz! Çok heyecan verici.", new DateTime(2026, 4, 27, 18, 35, 53, 547, DateTimeKind.Local).AddTicks(9290), true, 1, "merve@gmail.com" },
                    { 2, "Hangi belgeler gerekiyor acaba? Bilgi verir misiniz?", new DateTime(2026, 4, 28, 18, 35, 53, 547, DateTimeKind.Local).AddTicks(9664), true, 1, "ozan@gmail.com" },
                    { 3, "Python eğitimi çok kaliteli görünüyor, kesinlikle katılacağım.", new DateTime(2026, 4, 30, 18, 35, 53, 547, DateTimeKind.Local).AddTicks(9672), true, 2, "selin@gmail.com" },
                    { 4, "Gençler için harika bir fırsat, emeği geçenlere teşekkürler.", new DateTime(2026, 5, 1, 18, 35, 53, 547, DateTimeKind.Local).AddTicks(9679), true, 5, "umut@gmail.com" }
                });

            migrationBuilder.InsertData(
                table: "NewsLikes",
                columns: new[] { "Id", "NewsId", "UserEmail" },
                values: new object[,]
                {
                    { 1, 1, "ayse@gmail.com" },
                    { 2, 1, "mehmet@gmail.com" },
                    { 3, 1, "fatma@hotmail.com" },
                    { 4, 2, "ali@gmail.com" },
                    { 5, 2, "zeynep@yahoo.com" },
                    { 6, 3, "can@gmail.com" },
                    { 7, 3, "asli@gmail.com" },
                    { 8, 3, "berat@gmail.com" },
                    { 9, 4, "ece@gmail.com" },
                    { 10, 5, "hakan@gmail.com" }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "GalleryLikes",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "GalleryLikes",
                keyColumn: "Id",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "GalleryLikes",
                keyColumn: "Id",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "GalleryLikes",
                keyColumn: "Id",
                keyValue: 4);

            migrationBuilder.DeleteData(
                table: "GalleryLikes",
                keyColumn: "Id",
                keyValue: 5);

            migrationBuilder.DeleteData(
                table: "GalleryLikes",
                keyColumn: "Id",
                keyValue: 6);

            migrationBuilder.DeleteData(
                table: "GalleryLikes",
                keyColumn: "Id",
                keyValue: 7);

            migrationBuilder.DeleteData(
                table: "GalleryLikes",
                keyColumn: "Id",
                keyValue: 8);

            migrationBuilder.DeleteData(
                table: "GalleryLikes",
                keyColumn: "Id",
                keyValue: 9);

            migrationBuilder.DeleteData(
                table: "GalleryLikes",
                keyColumn: "Id",
                keyValue: 10);

            migrationBuilder.DeleteData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 4);

            migrationBuilder.DeleteData(
                table: "NewsLikes",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "NewsLikes",
                keyColumn: "Id",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "NewsLikes",
                keyColumn: "Id",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "NewsLikes",
                keyColumn: "Id",
                keyValue: 4);

            migrationBuilder.DeleteData(
                table: "NewsLikes",
                keyColumn: "Id",
                keyValue: 5);

            migrationBuilder.DeleteData(
                table: "NewsLikes",
                keyColumn: "Id",
                keyValue: 6);

            migrationBuilder.DeleteData(
                table: "NewsLikes",
                keyColumn: "Id",
                keyValue: 7);

            migrationBuilder.DeleteData(
                table: "NewsLikes",
                keyColumn: "Id",
                keyValue: 8);

            migrationBuilder.DeleteData(
                table: "NewsLikes",
                keyColumn: "Id",
                keyValue: 9);

            migrationBuilder.DeleteData(
                table: "NewsLikes",
                keyColumn: "Id",
                keyValue: 10);

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 23, 13, 666, DateTimeKind.Local).AddTicks(3623));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 23, 13, 666, DateTimeKind.Local).AddTicks(6665));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 23, 13, 666, DateTimeKind.Local).AddTicks(6680));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 23, 13, 666, DateTimeKind.Local).AddTicks(6687));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 23, 13, 666, DateTimeKind.Local).AddTicks(6692));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 23, 13, 666, DateTimeKind.Local).AddTicks(6698));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(7782));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(9309));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(9314));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(9318));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(9320));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(9323));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(9325));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(9327));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(9330));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(9332));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(9334));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 18, 23, 13, 663, DateTimeKind.Local).AddTicks(9336));
        }
    }
}
