using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace HalkEgitimSistemi.Migrations
{
    /// <inheritdoc />
    public partial class AddInstructorAuth : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Password",
                table: "Instructors",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Username",
                table: "Instructors",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "Password", "Username" },
                values: new object[] { null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "Password", "Username" },
                values: new object[] { null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "Password", "Username" },
                values: new object[] { null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 4,
                columns: new[] { "Password", "Username" },
                values: new object[] { null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 5,
                columns: new[] { "Password", "Username" },
                values: new object[] { null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 6,
                columns: new[] { "Password", "Username" },
                values: new object[] { null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 7,
                columns: new[] { "Password", "Username" },
                values: new object[] { null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 8,
                columns: new[] { "Password", "Username" },
                values: new object[] { null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 9,
                columns: new[] { "Password", "Username" },
                values: new object[] { null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 10,
                columns: new[] { "Password", "Username" },
                values: new object[] { null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 11,
                columns: new[] { "Password", "Username" },
                values: new object[] { null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 12,
                columns: new[] { "Password", "Username" },
                values: new object[] { null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 13,
                columns: new[] { "Password", "Username" },
                values: new object[] { null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 14,
                columns: new[] { "Password", "Username" },
                values: new object[] { null, null });

            migrationBuilder.UpdateData(
                table: "Instructors",
                keyColumn: "Id",
                keyValue: 15,
                columns: new[] { "Password", "Username" },
                values: new object[] { null, null });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Password",
                table: "Instructors");

            migrationBuilder.DropColumn(
                name: "Username",
                table: "Instructors");
        }
    }
}
