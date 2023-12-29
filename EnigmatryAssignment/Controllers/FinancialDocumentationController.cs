using EnigmatryAssignment.Models;
using EnigmatryAssignment.Service.Interfaces;
using Microsoft.AspNetCore.Mvc;
using System.Text.Json;

namespace EnigmatryAssignment.Controllers
{
    [ApiController]
    [Route("[controller]/[action]")]
    public class FinancialDocumentationController : ControllerBase
    {
        private readonly IEnigmatryAssignmentService _enigmatryAssignmentService;

        public FinancialDocumentationController(IEnigmatryAssignmentService enigmatryAssignmentService)
        {
            _enigmatryAssignmentService = enigmatryAssignmentService;
        }

        [HttpPost]
        [ActionName("GetFinancialDocumentation")]
        public ActionResult<FinancialDocumentationResponse> GetFinancialDocumentation([FromBody] FinancialDocumentationRequest financialDocumentationRequest)
        {
            if (financialDocumentationRequest == null)
            {
                return StatusCode(StatusCodes.Status400BadRequest, "Input cannot be null");
            }

            Status<FinancialDocumentationResponse> status = _enigmatryAssignmentService.GetFinancialDocumentation(financialDocumentationRequest);
            
            if(status.StatusCode == StatusCodes.Status200OK)
            {
                return status.Data;
            }
            else
            {
                return StatusCode(status.StatusCode, status.StatusMessage);
            }
        }
    }
}
