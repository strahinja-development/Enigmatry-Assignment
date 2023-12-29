namespace EnigmatryAssignment.Repositories.Interfaces
{
    public interface ITenantRepository
    {
        public bool IsTenantWhiteListed(int  tenantId);
    }
}
