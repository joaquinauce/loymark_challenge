using AutoMapper;
using LoymarkChallenge.Models;
using LoymarkChallenge.Models.Dto.PaisDto;
using LoymarkChallenge.Models.Dto.UsuarioDto;

namespace LoymarkChallenge.Mappers
{
    public class Mappers : Profile
    {
        public Mappers()
        {
            CreateMap<Pais, PaisDto>().ReverseMap();
            CreateMap<Usuario, CreateUsuarioDto>().ReverseMap();
        }
    }
}
