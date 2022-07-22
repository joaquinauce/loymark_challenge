using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LoymarkChallenge.Models
{
    public class Actividad
    {
        [Key]
        public int id_actividad { get; set; }
        public DateTime create_date { get; set; }
        public int id_usuario { get; set; }
        [ForeignKey("id_usuario")]
        public Usuario Usuario { get; set; }
        public string actividad { get; set; }
    }
}
