namespace UTube_Backend.Models
{
    public class Video
    {
        public int id { get; set; }
        public string title { get; set; }
        public string description { get; set; }
        public string thumbnail { get; set; }
        public string url { get; set; }
        public string category { get; set; }
        public DateTime uploadedDate { get; set; }
    }
}
