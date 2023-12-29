namespace EnigmatryAssignment.Models.DomainModels
{
    public class Transaction
    {
        public int Id { get; set; }
        public string TransactionId { get; set; }
        public decimal Amount { get; set; }
        public DateTime TransactionDate { get; set; }
        public string Description { get; set; }
        public string TransactionCategory { get; set; }
        public int AccountId { get; set; }
        public Account Account { get; set; }
    }
}
