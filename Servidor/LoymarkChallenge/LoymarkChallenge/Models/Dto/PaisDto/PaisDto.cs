using System.ComponentModel.DataAnnotations;

namespace LoymarkChallenge.Models.Dto.PaisDto
{
    public class PaisDto
    {
        public int id_pais { get; set; }
        [Required(ErrorMessage = "El campo Nombre es obligatorio")]
        public string Nombre { get; set; }
        public string codigo_internacional { get; set; }
    }
}
