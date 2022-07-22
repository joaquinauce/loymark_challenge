using LoymarkChallenge.Data;
using LoymarkChallenge.Models;
using LoymarkChallenge.Repository.IRepository;
using Microsoft.EntityFrameworkCore;

namespace LoymarkChallenge.Repository
{
    public class ActividadRepository : IActividadRepository
    {
        private readonly ApplicationDbContext _db;
        public ActividadRepository(ApplicationDbContext db)
        {
            _db = db;
        }


        public bool Save()
        {
            try
            {
                return _db.SaveChanges() > 0 ? true : false;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool CreateActividad(Actividad actividad)
        {
            _db.Actividades.Add(actividad);
            return Save();
        }

       public ICollection<Actividad> GetActividades()
        {
            return _db.Actividades.OrderByDescending(a => a.id_actividad).ToList();
        }
    }
}
