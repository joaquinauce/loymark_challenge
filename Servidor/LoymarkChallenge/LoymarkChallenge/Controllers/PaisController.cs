using AutoMapper;
using LoymarkChallenge.Models.Dto.PaisDto;
using LoymarkChallenge.Repository.IRepository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LoymarkChallenge.Controllers
{
    [Route("api/Pais")]
    [ApiController]
    public class PaisController : ControllerBase
    {
        private readonly IPaisRepository _paRepo;
        private readonly IMapper _mapper;

        public PaisController(IPaisRepository paisRepo, IMapper mapper)
        {
            _paRepo = paisRepo;
            _mapper = mapper;
        }
        [HttpGet]
        public IActionResult GetPaises()
        {
            var listaPaises = _paRepo.GetPaises();
            var listaPaisesDto = new List<PaisDto>();

            if (listaPaises.Count == 0)
            {
                return NotFound();
            }

            foreach (var item in listaPaises)
            {
                listaPaisesDto.Add(_mapper.Map<PaisDto>(item));
            }
            return Ok(listaPaisesDto);
        }
    }
}
