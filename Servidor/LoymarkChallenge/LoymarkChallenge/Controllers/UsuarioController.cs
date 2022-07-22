using AutoMapper;
using LoymarkChallenge.Models;
using LoymarkChallenge.Models.Dto.UsuarioDto;
using LoymarkChallenge.Repository.IRepository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LoymarkChallenge.Controllers
{
    [Route("api/usuarios")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        private readonly IUsuarioRepository _usuarioRepo;
        private readonly IPaisRepository _paisRepo;
        private readonly IActividadRepository _actividadRepo;
        private readonly IMapper _mapper;

        public UsuarioController(IUsuarioRepository usuarioRepo, IPaisRepository paisRepository, IActividadRepository actividadRepository, IMapper mapper)
        {
            _usuarioRepo = usuarioRepo;
            _paisRepo = paisRepository; 
            _actividadRepo = actividadRepository;
            _mapper = mapper;
        }
        [HttpGet("{id_usuario:int}", Name = "GetUsuario")]
        public IActionResult GetUsuario(int id_usuario)
        {
            var usuario = _usuarioRepo.GetUsuario(id_usuario);

            if (usuario == null)
            {
                return NotFound();
            }

            return Ok(usuario);
        }

        [HttpPost]
        public IActionResult CreateUsuario(CreateUsuarioDto usuarioDto)
        {
            if (usuarioDto == null)
            {
                return BadRequest();
            }

            if (_usuarioRepo.UsuarioExists(usuarioDto.email))
            {
                ModelState.AddModelError("", "El correo electronico ya existe");
                return StatusCode(412, ModelState);
            }

            var pais = _paisRepo.GetPais(usuarioDto.id_pais);

            if (pais == null)
            {
                ModelState.AddModelError("", $"El pais no existe");
                return StatusCode(500, ModelState);
            }

            var usuario = _mapper.Map<Usuario>(usuarioDto);

            usuario.Pais = pais;
            usuario.pais_codigo = pais.codigo_internacional;
            usuario.fecha_baja = null;

            if (!_usuarioRepo.CreateUsuario(usuario))
            {
                ModelState.AddModelError("", $"Algo salió mal creando el registro {usuario.nombre}");
                return StatusCode(500, ModelState);
            }

            string RecibeInformacion = "NO";
            if (usuario.recibe_informacion)
            {
                RecibeInformacion = "SI";
            }

            Actividad actividad = new Actividad();
            actividad.Usuario = usuario;
            actividad.create_date = DateTime.Now;
            actividad.actividad = "Se ha dado de alta un nuevo usuario: " + usuario.apellido + ", " + usuario.nombre + ". Su Correo es: " + usuario.email
                + ". Fecha de nacimiento: " + usuario.fecha_nacimiento + ", pais de residencia" + pais.nombre + " - " + pais.codigo_internacional 
                + ". El usuario decide " + RecibeInformacion + " recibir informacion.";

            _actividadRepo.CreateActividad(actividad);

            return Ok();
        }

        [HttpPatch("{id_usuario:int}", Name = "UpdateUsuario")]
        public IActionResult UpdateUsuario(int id_usuario, [FromBody] CreateUsuarioDto usuarioDto)
        {
            if (usuarioDto == null || id_usuario != usuarioDto.id_usuario)
            {
                return BadRequest();
            }

            if (_usuarioRepo.UsuarioExists(id_usuario, usuarioDto.email))
            {
                ModelState.AddModelError("", "El correo electronico ya existe");
                return StatusCode(412, ModelState);
            }

            var pais = _paisRepo.GetPais(usuarioDto.id_pais);

            if (pais == null)
            {
                ModelState.AddModelError("", $"El pais no existe");
                return StatusCode(500, ModelState);
            }

            var usuario = _mapper.Map<Usuario>(usuarioDto);

            usuario.Pais = pais;
            usuario.pais_codigo = pais.codigo_internacional;

            if (!_usuarioRepo.UpdateUsuario(usuario))
            {
                ModelState.AddModelError("", $"Algo salió mal al actualizar el registro {usuario.nombre}");
                return StatusCode(500, ModelState);
            }

            Actividad actividad = new Actividad();
            actividad.Usuario = usuario;
            actividad.create_date = DateTime.Now;
            actividad.actividad = "Se ha actualizado el usuario " + usuario.apellido + ", " + usuario.nombre;

            _actividadRepo.CreateActividad(actividad);

            return Ok();
        }

        [HttpPatch("DeleteUsuario/{id_usuario}")]
        public IActionResult DeleteUsuario(int id_usuario)
        {
            if (id_usuario == 0)
            {
                return BadRequest();
            }

            Usuario usuario = _usuarioRepo.GetUsuario(id_usuario);

            if (usuario == null)
            {
                return NotFound();
            }

            usuario.fecha_baja = DateTime.Now;

            if (!_usuarioRepo.UpdateUsuario(usuario))
            {
                ModelState.AddModelError("", $"Algo salió mal al dar de baja el registro {usuario.nombre}");
                return StatusCode(500, ModelState);

            }

            Actividad actividad = new Actividad();
            actividad.Usuario = usuario;
            actividad.create_date = DateTime.Now;
            actividad.actividad = "Se ha dado de baja el usuario " + usuario.apellido + ", " + usuario.nombre;

            _actividadRepo.CreateActividad(actividad);

            return Ok();
        }

        [HttpGet]
        public IActionResult GetUsuarios()
        {
            var lstUsuarios = _usuarioRepo.GetUsuarios();

            return Ok(lstUsuarios);
        }
    }
}
