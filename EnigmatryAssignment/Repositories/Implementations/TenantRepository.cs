using EnigmatryAssignment.Models;
using EnigmatryAssignment.Models.DomainModels;
using EnigmatryAssignment.Repositories.Interfaces;

namespace EnigmatryAssignment.Repositories.Implementations
{
    public class TenantRepository : ITenantRepository
    {
        private readonly EnigmatryAssignmentDbContext _enigmatryAssignmentDbContext;

        public TenantRepository(EnigmatryAssignmentDbContext enigmatryAssignmentDbContext)
        {
            _enigmatryAssignmentDbContext = enigmatryAssignmentDbContext;
        }
        public bool IsTenantWhiteListed(int tenantId)
        {
            Tenant tenant = _enigmatryAssignmentDbContext.Tenants.FirstOrDefault(t => t.TenantId == tenantId);

            if (tenant.IsWhitelisted)
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
