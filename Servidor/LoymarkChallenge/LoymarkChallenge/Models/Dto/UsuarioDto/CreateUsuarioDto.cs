using System.ComponentModel.DataAnnotations;

namespace LoymarkChallenge.Models.Dto.UsuarioDto
{
    public class CreateUsuarioDto
    {
        public int id_usuario { get; set; }
        [Required(ErrorMessage = "El nombre es obligatorio")]
        public string nombre { get; set; }
        [Required(ErrorMessage = "El apellido es obligatorio")]
        public string apellido { get; set; }
        [Required(ErrorMessage = "El correo electronico es obligatorio")]
        public string email { get; set; }
        [Required(ErrorMessage = "La fecha de nacimiento es obligatoria")]
        public DateTime fecha_nacimiento { get; set; }

        public string? telefono { get; set; }
        [Required(ErrorMessage = "El pais de residencia es obligatorio")]
        public int id_pais { get; set; }
        public bool recibe_informacion { get; set; }
    }
}
