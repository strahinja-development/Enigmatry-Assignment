using EnigmatryAssignment.Models;
using EnigmatryAssignment.Models.DomainModels;
using EnigmatryAssignment.Repositories.Interfaces;

namespace EnigmatryAssignment.Repositories.Implementations
{
    public class ProductRepository : IProductRepository
    {
        private readonly EnigmatryAssignmentDbContext _enigmatryAssignmentDbContext;

        public ProductRepository(EnigmatryAssignmentDbContext enigmatryAssignmentDbContext)
        {
            _enigmatryAssignmentDbContext = enigmatryAssignmentDbContext;
        }
        public bool IsProductCodeSupported(string productCode)
        {
            Product product = _enigmatryAssignmentDbContext.Products.FirstOrDefault(p => p.ProductCode == productCode);

            if(product.IsProductCodeSupported) 
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
