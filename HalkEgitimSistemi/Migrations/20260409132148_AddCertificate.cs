using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace HalkEgitimSistemi.Migrations
{
    /// <inheritdoc />
    public partial class AddCertificate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "CertificateCode",
                table: "Applications",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsCompleted",
                table: "Applications",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.UpdateData(
                table: "Applications",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "ApplyDate", "CertificateCode", "IsCompleted" },
                values: new object[] { new DateTime(2026, 1, 2, 0, 0, 0, 0, DateTimeKind.Unspecified), "HE-2026-0001", true });

            migrationBuilder.UpdateData(
                table: "Applications",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "ApplyDate", "CertificateCode", "IsCompleted" },
                values: new object[] { new DateTime(2026, 2, 3, 0, 0, 0, 0, DateTimeKind.Unspecified), "HE-2026-0002", true });

            migrationBuilder.UpdateData(
                table: "Applications",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "CertificateCode", "IsCompleted" },
                values: new object[] { null, false });

            migrationBuilder.UpdateData(
                table: "Applications",
                keyColumn: "Id",
                keyValue: 4,
                columns: new[] { "CertificateCode", "IsCompleted" },
                values: new object[] { null, false });

            migrationBuilder.UpdateData(
                table: "Applications",
                keyColumn: "Id",
                keyValue: 5,
                columns: new[] { "CertificateCode", "IsCompleted" },
                values: new object[] { null, false });

            migrationBuilder.UpdateData(
                table: "Applications",
                keyColumn: "Id",
                keyValue: 6,
                columns: new[] { "CertificateCode", "IsCompleted" },
                values: new object[] { null, false });

            migrationBuilder.UpdateData(
                table: "Applications",
                keyColumn: "Id",
                keyValue: 7,
                columns: new[] { "CertificateCode", "IsCompleted" },
                values: new object[] { null, false });

            migrationBuilder.UpdateData(
                table: "Applications",
                keyColumn: "Id",
                keyValue: 8,
                columns: new[] { "CertificateCode", "IsCompleted" },
                values: new object[] { null, false });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CertificateCode",
                table: "Applications");

            migrationBuilder.DropColumn(
                name: "IsCompleted",
                table: "Applications");

            migrationBuilder.UpdateData(
                table: "Applications",
                keyColumn: "Id",
                keyValue: 1,
                column: "ApplyDate",
                value: new DateTime(2026, 4, 2, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.UpdateData(
                table: "Applications",
                keyColumn: "Id",
                keyValue: 2,
                column: "ApplyDate",
                value: new DateTime(2026, 4, 3, 0, 0, 0, 0, DateTimeKind.Unspecified));
        }
    }
}
