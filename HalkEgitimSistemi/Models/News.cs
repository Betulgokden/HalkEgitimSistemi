using System;

namespace HalkEgitimSistemi.Models
{
    public class News
    {
        public int Id { get; set; }
        public string Title { get; set; } = string.Empty;
        public string Content { get; set; } = string.Empty;

        // Önceki adımlarda eklediğimiz alanlar
        public DateTime Date { get; set; } = DateTime.Now;
        public string PosterUrl { get; set; } = string.Empty;

        // KALAN 7 HATAYI SIFIRLAYACAK OLAN EKSİK ALAN:
        public DateTime PublishDate { get; set; } = DateTime.Now;
    }
}