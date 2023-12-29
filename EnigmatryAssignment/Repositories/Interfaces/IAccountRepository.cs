using EnigmatryAssignment.Models.DomainModels;

namespace EnigmatryAssignment.Repositories.Interfaces
{
    public interface IAccountRepository
    {
        public Account GetAccountById(int id);
    }
}
