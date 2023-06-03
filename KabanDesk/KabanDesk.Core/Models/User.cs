using System.Runtime.Serialization;

namespace KabanDesk.Core.Models
{
    public class User
    {
        [DataMember(Name = "id")]
        public int Id { get; set; }

        [DataMember(Name = "firstName")]
        public string FirstName { get; set; }

        [DataMember(Name = "lastName")]
        public string LastName { get; set; }

        [DataMember(Name = "role")]
        public bool Role { get; set; }
    }
}
