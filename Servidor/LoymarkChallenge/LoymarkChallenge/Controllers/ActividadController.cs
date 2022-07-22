using LoymarkChallenge.Repository.IRepository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LoymarkChallenge.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ActividadController : ControllerBase
    {
        private readonly IActividadRepository _actividadRepository;
        private readonly IUsuarioRepository _usuarioRepository;

        public ActividadController(IActividadRepository actividadRepository, IUsuarioRepository usuarioRepository)
        {
            _actividadRepository = actividadRepository;
            _usuarioRepository = usuarioRepository;
        }

        [HttpGet]
        public IActionResult GetActividades()
        {
            var lstActividades = _actividadRepository.GetActividades();

            if (lstActividades == null)
            {
                return NotFound();
            }

            return Ok(lstActividades);
        }
    }
}
