using EnigmatryAssignment.Models;
using EnigmatryAssignment.Models.DomainModels;
using EnigmatryAssignment.Repositories.Interfaces;
using System.Reflection.Metadata;
using System.Runtime.Intrinsics.Arm;

namespace EnigmatryAssignment.Repositories.Implementations
{
    public class ClientRepository : IClientRepository
    {
        private readonly EnigmatryAssignmentDbContext _enigmatryAssignmentDbContext;

        public ClientRepository(EnigmatryAssignmentDbContext enigmatryAssignmentDbContext)
        {
            _enigmatryAssignmentDbContext = enigmatryAssignmentDbContext;
        }
        public Client GetClientByTenantIdAndDocumentId(int tenantId, int documentId)
        {
            Client client = _enigmatryAssignmentDbContext.Clients.FirstOrDefault(c => c.TenantId == tenantId && c.DocumentId == documentId);

            return client;
        }

        public bool IsClientWhiteListed(int tenantId, int clientId)
        {
            Client client = _enigmatryAssignmentDbContext.Clients.FirstOrDefault(c => c.TenantId == tenantId && c.ClientId == clientId);

            if (client.IsWhitelisted)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
