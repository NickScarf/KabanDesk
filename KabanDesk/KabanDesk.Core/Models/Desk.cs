using System;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace KabanDesk.Core.Models
{
    public class Desk
    {
        [DataMember(Name = "id")]
        public int Id { get; set; }

        [DataMember(Name = "owner")]
        public User Owner { get; set; }

        [DataMember(Name = "dates")]
        public List<DateTime> Dates { get; set; }

        [DataMember(Name = "stikers")]
        public List<Stiker> Stikers { get; set; }
    }
}
