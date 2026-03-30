namespace HalkEgitimSistemi.Models
{
    public class Student
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }

        // Bir öğrenci birden fazla kursa başvurabilir
        public List<Application> Applications { get; set; }
    }
}