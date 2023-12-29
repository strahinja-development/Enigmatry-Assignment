using EnigmatryAssignment.Models.DomainModels;

namespace EnigmatryAssignment.Repositories.Interfaces
{
    public interface ITransactionRepository
    {
        public List<Transaction> GetTransactionsByAccountId(int accountId);
    }
}
