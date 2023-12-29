using EnigmatryAssignment.Models.DomainModels;
using Microsoft.EntityFrameworkCore;

namespace EnigmatryAssignment.Models
{
    public class EnigmatryAssignmentDbContext : DbContext
    {
        public EnigmatryAssignmentDbContext(DbContextOptions<EnigmatryAssignmentDbContext> options) : base(options)
        {

        }

        public DbSet<Account> Accounts { get; set; }
        public DbSet<Client> Clients { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Tenant> Tenants { get; set; }
        public DbSet<Transaction> Transactions { get; set; }
        public DbSet<Document> Documents { get; set; }
    }
}
