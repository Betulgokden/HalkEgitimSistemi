using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HalkEgitimSistemi.Models
{
    public class LibraryBook
    {
        public int Id { get; set; }

        [Required]
        public string Title { get; set; } = string.Empty;

        [Required]
        public string Author { get; set; } = string.Empty;

        public string Category { get; set; } = string.Empty;

        public string CoverImageUrl { get; set; } = string.Empty;

        public string PdfUrl { get; set; } = string.Empty;

        public string PreviewLink { get; set; } = string.Empty;

        public string Description { get; set; } = string.Empty;

        public string PublishedDate { get; set; } = string.Empty;

        public int? PageCount { get; set; }

        // 3D placement coordinates
        public float PositionX { get; set; }
        public float PositionY { get; set; }
        public float PositionZ { get; set; }
        public float RotationY { get; set; }

        // Kursiyer & Ders Notu Özellikleri (Yeni)
        public bool IsCourseNote { get; set; } = false;
        public int StarCount { get; set; } = 0;
        public int? StudentId { get; set; }
        public Student? Student { get; set; }
        public int? CourseId { get; set; }
        public Course? Course { get; set; }

        public ICollection<LibraryBookPage> Pages { get; set; } = new List<LibraryBookPage>();
    }
}
