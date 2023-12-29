using EnigmatryAssignment.Models;
using EnigmatryAssignment.Models.DomainModels;
using EnigmatryAssignment.Repositories.Interfaces;

namespace EnigmatryAssignment.Repositories.Implementations
{
    public class TransactionRepository : ITransactionRepository
    {

        private readonly EnigmatryAssignmentDbContext _enigmatryAssignmentDbContext;

        public TransactionRepository(EnigmatryAssignmentDbContext enigmatryAssignmentDbContext)
        {
            _enigmatryAssignmentDbContext = enigmatryAssignmentDbContext;
        }
        public List<Transaction> GetTransactionsByAccountId(int accountId)
        {
            return _enigmatryAssignmentDbContext.Transactions.Where(t => t.AccountId == accountId).ToList();
        }
    }
}
