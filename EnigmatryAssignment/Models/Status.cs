namespace EnigmatryAssignment.Models
{
    public class Status<T> where T : class
    {
        public T Data { get; set; }
        public string StatusMessage { get; set; }
        public int StatusCode {  get; set; } 
    }
}
