using EnigmatryAssignment.Models;
using EnigmatryAssignment.Models.DomainModels;
using EnigmatryAssignment.Repositories.Interfaces;
using EnigmatryAssignment.Service.Interfaces;
using System.Security.Cryptography;
using System.Text;

namespace EnigmatryAssignment.Service.Implementations
{
    public class EnigmatryAssignmentService : IEnigmatryAssignmentService
    {
        private readonly IProductRepository _productRepository;
        private readonly ITenantRepository _tenantRepository;
        private readonly IClientRepository _clientRepository;
        private readonly IAccountRepository _accountRepository;
        private readonly ITransactionRepository _transactionRepository;

        public EnigmatryAssignmentService(IProductRepository productRepository, ITenantRepository tenantRepository, IClientRepository clientRepository,
            IAccountRepository accountRepository, ITransactionRepository transactionRepository)
        {
            _productRepository = productRepository;
            _tenantRepository = tenantRepository;
            _clientRepository = clientRepository;
            _accountRepository = accountRepository;
            _transactionRepository = transactionRepository;
        }
        public Status<FinancialDocumentationResponse> GetFinancialDocumentation(FinancialDocumentationRequest request)
        {
            if (!_productRepository.IsProductCodeSupported(request.ProductCode))
            {
                return new Status<FinancialDocumentationResponse>()
                {
                    Data = null,
                    StatusMessage = "Product Code: " + request.ProductCode + " is not supported.",
                    StatusCode = StatusCodes.Status403Forbidden
                };
            }

            if (!_tenantRepository.IsTenantWhiteListed(request.TenantId))
            {
                return new Status<FinancialDocumentationResponse>()
                {
                    Data = null,
                    StatusMessage = "Tenant with tenant id: " + request.TenantId + " is not whitelisted.",
                    StatusCode = StatusCodes.Status403Forbidden
                };
            }

            Client client = _clientRepository.GetClientByTenantIdAndDocumentId(request.TenantId, request.DocumentId);

            if (!_clientRepository.IsClientWhiteListed(request.TenantId, client.ClientId))
            {
                return new Status<FinancialDocumentationResponse>()
                {
                    Data = null,
                    StatusMessage = "Client with tenant id: " + request.TenantId + " and client id: " + client.ClientId + " is not whitelisted.",
                    StatusCode = StatusCodes.Status403Forbidden
                };
            }

            if (client.CompanyType.Equals("small"))
            {
                return new Status<FinancialDocumentationResponse>()
                {
                    Data = null,
                    StatusMessage = "Company type 'small' is not supported.",
                    StatusCode = StatusCodes.Status403Forbidden
                };
            }
            
            Account account = _accountRepository.GetAccountById(client.AccountId);

            List<Transaction> accountTransactions = _transactionRepository.GetTransactionsByAccountId(client.AccountId);

            List<Transaction> transactions = new List<Transaction>();

            foreach(Transaction transaction in accountTransactions)
            {
                transactions.Add(new Transaction()
                {
                    Id = transaction.Id,
                    TransactionId = new String(transaction.TransactionId.Select(r => r == ' ' ? ' ' : '#').ToArray()),
                    Amount = transaction.Amount,
                    TransactionDate = transaction.TransactionDate,
                    Description = new String(transaction.Description.Select(r => r == ' ' ? ' ' : '#').ToArray()),
                    TransactionCategory = transaction.TransactionCategory
                });
            }

            return new Status<FinancialDocumentationResponse>()
            {
                Data = new FinancialDocumentationResponse()
                {
                    data = new Account()
                    {
                        AccountId = account.AccountId,
                        AccountNumber = Convert.ToBase64String(SHA256.HashData(Encoding.UTF8.GetBytes(account.AccountNumber))),
                        Balance = account.Balance,
                        Currency = account.Currency,
                        Transactions = transactions
                    },
                    company = new Company()
                    {
                        RegistrationNumber = client.RegistrationNumber,
                        CompanyType = client.CompanyType
                    }
                },
                StatusMessage = "OK.",
                StatusCode = StatusCodes.Status200OK
            };
        }
    }
}
