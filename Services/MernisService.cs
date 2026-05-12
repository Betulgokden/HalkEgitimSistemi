using System.Text;
using System.Xml.Linq;

namespace HalkEgitimSistemi.Services
{
    public class MernisService
    {
        private readonly HttpClient _httpClient;

        public MernisService()
        {
            _httpClient = new HttpClient();
        }

        public async Task<bool> ValidateIdentity(string tcNo, string firstName, string lastName, int birthYear)
        {
            try
            {
                // SOAP 1.1 request body
                string soapRequest = $@"<?xml version=""1.0"" encoding=""utf-8""?>
<soap:Envelope xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" xmlns:soap=""http://schemas.xmlsoap.org/soap/envelope/"">
  <soap:Body>
    <TCKimlikNoDogrula xmlns=""http://tckimlik.nvi.gov.tr/WS"">
      <TCKimlikNo>{tcNo}</TCKimlikNo>
      <Ad>{firstName.ToUpper()}</Ad>
      <Soyad>{lastName.ToUpper()}</Soyad>
      <DogumYili>{birthYear}</DogumYili>
    </TCKimlikNoDogrula>
  </soap:Body>
</soap:Envelope>";

                var content = new StringContent(soapRequest, Encoding.UTF8, "text/xml");
                content.Headers.Add("SOAPAction", "http://tckimlik.nvi.gov.tr/WS/TCKimlikNoDogrula");

                var response = await _httpClient.PostAsync("https://tckimlik.nvi.gov.tr/Service/KPSPublic.asmx", content);
                var responseContent = await response.Content.ReadAsStringAsync();

                XDocument doc = XDocument.Parse(responseContent);
                XNamespace ns = "http://tckimlik.nvi.gov.tr/WS";
                var result = doc.Descendants(ns + "TCKimlikNoDogrulaResult").FirstOrDefault()?.Value;

                return result?.ToLower() == "true";
            }
            catch (Exception ex)
            {
                // Log exception if needed
                Console.WriteLine("MERNIS Validation Error: " + ex.Message);
                return false;
            }
        }
    }
}
