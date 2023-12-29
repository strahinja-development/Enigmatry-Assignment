using EnigmatryAssignment.Models;

namespace EnigmatryAssignment.Service.Interfaces
{
    public interface IEnigmatryAssignmentService
    {
        public Status<FinancialDocumentationResponse> GetFinancialDocumentation(FinancialDocumentationRequest request);
    }
}
