using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace HalkEgitimSistemi.Migrations
{
    /// <inheritdoc />
    public partial class ApplicationGuncellendi : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Applications_Students_StudentId",
                table: "Applications");

            migrationBuilder.RenameColumn(
                name: "Status",
                table: "Applications",
                newName: "PhoneNumber");

            migrationBuilder.RenameColumn(
                name: "ApplicationDate",
                table: "Applications",
                newName: "ApplyDate");

            migrationBuilder.AlterColumn<int>(
                name: "StudentId",
                table: "Applications",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddColumn<string>(
                name: "BirthPlace",
                table: "Applications",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "EducationStatus",
                table: "Applications",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "FullName",
                table: "Applications",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddForeignKey(
                name: "FK_Applications_Students_StudentId",
                table: "Applications",
                column: "StudentId",
                principalTable: "Students",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Applications_Students_StudentId",
                table: "Applications");

            migrationBuilder.DropColumn(
                name: "BirthPlace",
                table: "Applications");

            migrationBuilder.DropColumn(
                name: "EducationStatus",
                table: "Applications");

            migrationBuilder.DropColumn(
                name: "FullName",
                table: "Applications");

            migrationBuilder.RenameColumn(
                name: "PhoneNumber",
                table: "Applications",
                newName: "Status");

            migrationBuilder.RenameColumn(
                name: "ApplyDate",
                table: "Applications",
                newName: "ApplicationDate");

            migrationBuilder.AlterColumn<int>(
                name: "StudentId",
                table: "Applications",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Applications_Students_StudentId",
                table: "Applications",
                column: "StudentId",
                principalTable: "Students",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
