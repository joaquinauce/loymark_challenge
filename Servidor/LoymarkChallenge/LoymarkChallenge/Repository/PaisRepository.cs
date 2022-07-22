using LoymarkChallenge.Data;
using LoymarkChallenge.Models;
using LoymarkChallenge.Repository.IRepository;

namespace LoymarkChallenge.Repository
{
    public class PaisRepository : IPaisRepository
    {
        private readonly ApplicationDbContext _db;
        public PaisRepository(ApplicationDbContext db)
        {
            _db = db;
        }
        public ICollection<Pais> GetPaises()
        {
            return _db.Paises.OrderBy(p => p.nombre).ToList();
        }

        public Pais GetPais(int IdPais)
        {
            return _db.Paises.FirstOrDefault(p => p.id_Pais == IdPais);
        }
    }
}
