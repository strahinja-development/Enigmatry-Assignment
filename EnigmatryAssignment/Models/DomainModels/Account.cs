namespace EnigmatryAssignment.Models.DomainModels
{
    public class Account
    {
        public int AccountId { get; set; }
        public string AccountNumber { get; set; }
        public decimal Balance { get; set; }
        public string Currency {  get; set; }

        public virtual ICollection<Transaction> Transactions { get; set; }
    }
}
