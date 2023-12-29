using EnigmatryAssignment.Models;
using EnigmatryAssignment.Models.DomainModels;
using EnigmatryAssignment.Repositories.Interfaces;

namespace EnigmatryAssignment.Repositories.Implementations
{
    public class AccountRepository : IAccountRepository
    {

        private readonly EnigmatryAssignmentDbContext _enigmatryAssignmentDbContext;

        public AccountRepository(EnigmatryAssignmentDbContext enigmatryAssignmentDbContext)
        {
            _enigmatryAssignmentDbContext = enigmatryAssignmentDbContext;
        }
        public Account GetAccountById(int id)
        {
            return _enigmatryAssignmentDbContext.Accounts.FirstOrDefault(a => a.AccountId == id);
        }
    }
}
