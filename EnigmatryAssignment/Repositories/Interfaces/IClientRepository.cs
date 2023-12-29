using EnigmatryAssignment.Models.DomainModels;

namespace EnigmatryAssignment.Repositories.Interfaces
{
    public interface IClientRepository
    {
        public Client GetClientByTenantIdAndDocumentId(int tenantId, int documentId);
        public bool IsClientWhiteListed(int tenantId, int clientId);
    }
}
