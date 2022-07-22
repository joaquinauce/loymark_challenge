using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LoymarkChallenge.Models
{
    public class Usuario
    {
        [Key]
        public int id_usuario { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string email { get; set; }
        public DateTime fecha_nacimiento { get; set; }
        public string telefono { get; set; }
        public int id_pais { get; set; }
        [ForeignKey("id_pais")]
        public Pais Pais { get; set; }
        public string pais_codigo { get; set; }
        public bool recibe_informacion{ get; set; }
        public DateTime? fecha_baja { get; set; }
    }
}
