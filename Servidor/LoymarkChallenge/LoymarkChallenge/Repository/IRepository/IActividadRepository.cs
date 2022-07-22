using LoymarkChallenge.Models;

namespace LoymarkChallenge.Repository.IRepository
{
    public interface IActividadRepository
    {
        public ICollection<Actividad> GetActividades();
        public bool CreateActividad(Actividad actividad);
    }
}
