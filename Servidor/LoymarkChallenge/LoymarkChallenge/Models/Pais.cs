using System.ComponentModel.DataAnnotations;

namespace LoymarkChallenge.Models
{
    public class Pais
    {
        [Key]
        public int id_Pais { get; set; }
        public string nombre { get; set; }
        public string codigo_internacional { get; set; }

    }
}
