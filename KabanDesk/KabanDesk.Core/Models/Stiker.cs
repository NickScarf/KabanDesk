using System.Collections.Generic;
using System.Runtime.Serialization;

namespace KabanDesk.Core.Models
{
    public class Stiker
    {
        [DataMember(Name = "id")]
        public int Id { get; set; }

        [DataMember(Name = "info")]
        public string Info { get; set; }

        [DataMember(Name = "workers")]
        public List<User> Workers { get; set; }
    }
}
