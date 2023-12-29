namespace EnigmatryAssignment.Models.DomainModels
{
    public class Document
    {
        public int DocumentId { get; set; }
        public virtual ICollection<Client> Clients { get; set; }


    }
}
