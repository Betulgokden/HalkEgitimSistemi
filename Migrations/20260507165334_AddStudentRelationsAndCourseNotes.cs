using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace HalkEgitimSistemi.Migrations
{
    /// <inheritdoc />
    public partial class AddStudentRelationsAndCourseNotes : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_TeacherChatMessages_Instructors_InstructorId",
                table: "TeacherChatMessages");

            migrationBuilder.DropColumn(
                name: "ViewCount",
                table: "News");

            migrationBuilder.AlterColumn<int>(
                name: "InstructorId",
                table: "TeacherChatMessages",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddColumn<int>(
                name: "CourseId",
                table: "LibraryBooks",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsCourseNote",
                table: "LibraryBooks",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<int>(
                name: "StarCount",
                table: "LibraryBooks",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "StudentId",
                table: "LibraryBooks",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "StudentId",
                table: "ExhibitionItems",
                type: "int",
                nullable: true);

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "CreatedAt", "StudentId" },
                values: new object[] { new DateTime(2026, 5, 7, 19, 53, 29, 382, DateTimeKind.Local).AddTicks(384), null });

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "CreatedAt", "StudentId" },
                values: new object[] { new DateTime(2026, 5, 7, 19, 53, 29, 382, DateTimeKind.Local).AddTicks(2961), null });

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "CreatedAt", "StudentId" },
                values: new object[] { new DateTime(2026, 5, 7, 19, 53, 29, 382, DateTimeKind.Local).AddTicks(2968), null });

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 4,
                columns: new[] { "CreatedAt", "StudentId" },
                values: new object[] { new DateTime(2026, 5, 7, 19, 53, 29, 382, DateTimeKind.Local).AddTicks(2972), null });

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 5,
                columns: new[] { "CreatedAt", "StudentId" },
                values: new object[] { new DateTime(2026, 5, 7, 19, 53, 29, 382, DateTimeKind.Local).AddTicks(2975), null });

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 6,
                columns: new[] { "CreatedAt", "StudentId" },
                values: new object[] { new DateTime(2026, 5, 7, 19, 53, 29, 382, DateTimeKind.Local).AddTicks(2978), null });

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
                columns: new[] { "CourseId", "IsCourseNote", "StarCount", "StudentId" },
                values: new object[] { null, false, 0, null });

            migrationBuilder.UpdateData(
                table: "LibraryBooks",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "CourseId", "IsCourseNote", "StarCount", "StudentId" },
                values: new object[] { null, false, 0, null });

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

            migrationBuilder.CreateIndex(
                name: "IX_LibraryBooks_CourseId",
                table: "LibraryBooks",
                column: "CourseId");

            migrationBuilder.CreateIndex(
                name: "IX_LibraryBooks_StudentId",
                table: "LibraryBooks",
                column: "StudentId");

            migrationBuilder.CreateIndex(
                name: "IX_ExhibitionItems_StudentId",
                table: "ExhibitionItems",
                column: "StudentId");

            migrationBuilder.AddForeignKey(
                name: "FK_ExhibitionItems_Students_StudentId",
                table: "ExhibitionItems",
                column: "StudentId",
                principalTable: "Students",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_LibraryBooks_Courses_CourseId",
                table: "LibraryBooks",
                column: "CourseId",
                principalTable: "Courses",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_LibraryBooks_Students_StudentId",
                table: "LibraryBooks",
                column: "StudentId",
                principalTable: "Students",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_TeacherChatMessages_Instructors_InstructorId",
                table: "TeacherChatMessages",
                column: "InstructorId",
                principalTable: "Instructors",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ExhibitionItems_Students_StudentId",
                table: "ExhibitionItems");

            migrationBuilder.DropForeignKey(
                name: "FK_LibraryBooks_Courses_CourseId",
                table: "LibraryBooks");

            migrationBuilder.DropForeignKey(
                name: "FK_LibraryBooks_Students_StudentId",
                table: "LibraryBooks");

            migrationBuilder.DropForeignKey(
                name: "FK_TeacherChatMessages_Instructors_InstructorId",
                table: "TeacherChatMessages");

            migrationBuilder.DropIndex(
                name: "IX_LibraryBooks_CourseId",
                table: "LibraryBooks");

            migrationBuilder.DropIndex(
                name: "IX_LibraryBooks_StudentId",
                table: "LibraryBooks");

            migrationBuilder.DropIndex(
                name: "IX_ExhibitionItems_StudentId",
                table: "ExhibitionItems");

            migrationBuilder.DropColumn(
                name: "CourseId",
                table: "LibraryBooks");

            migrationBuilder.DropColumn(
                name: "IsCourseNote",
                table: "LibraryBooks");

            migrationBuilder.DropColumn(
                name: "StarCount",
                table: "LibraryBooks");

            migrationBuilder.DropColumn(
                name: "StudentId",
                table: "LibraryBooks");

            migrationBuilder.DropColumn(
                name: "StudentId",
                table: "ExhibitionItems");

            migrationBuilder.AlterColumn<int>(
                name: "InstructorId",
                table: "TeacherChatMessages",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddColumn<int>(
                name: "ViewCount",
                table: "News",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 14, 54, 47, 996, DateTimeKind.Local).AddTicks(5127));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 14, 54, 47, 996, DateTimeKind.Local).AddTicks(7386));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 14, 54, 47, 996, DateTimeKind.Local).AddTicks(7391));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 14, 54, 47, 996, DateTimeKind.Local).AddTicks(7395));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 14, 54, 47, 996, DateTimeKind.Local).AddTicks(7398));

            migrationBuilder.UpdateData(
                table: "ExhibitionItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 14, 54, 47, 996, DateTimeKind.Local).AddTicks(7401));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 4, 14, 54, 47, 998, DateTimeKind.Local).AddTicks(5575));

            migrationBuilder.UpdateData(
                table: "GalleryComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 6, 14, 54, 47, 998, DateTimeKind.Local).AddTicks(5829));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 14, 54, 47, 996, DateTimeKind.Local).AddTicks(552));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 14, 54, 47, 996, DateTimeKind.Local).AddTicks(1753));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 14, 54, 47, 996, DateTimeKind.Local).AddTicks(1758));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 14, 54, 47, 996, DateTimeKind.Local).AddTicks(1787));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 14, 54, 47, 996, DateTimeKind.Local).AddTicks(1789));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 14, 54, 47, 996, DateTimeKind.Local).AddTicks(1791));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 14, 54, 47, 996, DateTimeKind.Local).AddTicks(1793));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 14, 54, 47, 996, DateTimeKind.Local).AddTicks(1795));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 14, 54, 47, 996, DateTimeKind.Local).AddTicks(1797));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 14, 54, 47, 996, DateTimeKind.Local).AddTicks(1799));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 14, 54, 47, 996, DateTimeKind.Local).AddTicks(1801));

            migrationBuilder.UpdateData(
                table: "GalleryItems",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 7, 14, 54, 47, 996, DateTimeKind.Local).AddTicks(1803));

            migrationBuilder.UpdateData(
                table: "News",
                keyColumn: "Id",
                keyValue: 1,
                column: "ViewCount",
                value: 0);

            migrationBuilder.UpdateData(
                table: "News",
                keyColumn: "Id",
                keyValue: 2,
                column: "ViewCount",
                value: 0);

            migrationBuilder.UpdateData(
                table: "News",
                keyColumn: "Id",
                keyValue: 3,
                column: "ViewCount",
                value: 0);

            migrationBuilder.UpdateData(
                table: "News",
                keyColumn: "Id",
                keyValue: 4,
                column: "ViewCount",
                value: 0);

            migrationBuilder.UpdateData(
                table: "News",
                keyColumn: "Id",
                keyValue: 5,
                column: "ViewCount",
                value: 0);

            migrationBuilder.UpdateData(
                table: "News",
                keyColumn: "Id",
                keyValue: 6,
                column: "ViewCount",
                value: 0);

            migrationBuilder.UpdateData(
                table: "News",
                keyColumn: "Id",
                keyValue: 7,
                column: "ViewCount",
                value: 0);

            migrationBuilder.UpdateData(
                table: "News",
                keyColumn: "Id",
                keyValue: 8,
                column: "ViewCount",
                value: 0);

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 2, 14, 54, 47, 998, DateTimeKind.Local).AddTicks(3349));

            migrationBuilder.UpdateData(
                table: "NewsComments",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2026, 5, 3, 14, 54, 47, 998, DateTimeKind.Local).AddTicks(3736));

            migrationBuilder.AddForeignKey(
                name: "FK_TeacherChatMessages_Instructors_InstructorId",
                table: "TeacherChatMessages",
                column: "InstructorId",
                principalTable: "Instructors",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
