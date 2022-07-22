using LoymarkChallenge.Models;

namespace LoymarkChallenge.Repository.IRepository
{
    public interface IPaisRepository
    {
        public ICollection<Pais> GetPaises();
        public Pais GetPais(int IdPais);
    }
}
