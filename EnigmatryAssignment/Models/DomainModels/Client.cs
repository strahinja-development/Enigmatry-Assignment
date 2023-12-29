namespace EnigmatryAssignment.Models.DomainModels
{
    public class Client
    {
        public int ClientId { get; set; }
        public string ClientVAT { get; set; }
        public string RegistrationNumber { get; set; }
        public string CompanyType { get; set; }
        public bool IsWhitelisted { get; set; }
        public int DocumentId { get; set; }
        public int TenantId { get; set; }
        public int AccountId { get; set; }

        public Tenant Tenant { get; set; }
        public Document Document { get; set; }
        public Account Account { get; set; }
    }
}
