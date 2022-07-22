using LoymarkChallenge.Data;
using LoymarkChallenge.Models;
using LoymarkChallenge.Repository.IRepository;
using Microsoft.EntityFrameworkCore;

namespace LoymarkChallenge.Repository
{
    public class UsuarioRepository : IUsuarioRepository
    {
        private readonly ApplicationDbContext _db;
        public UsuarioRepository(ApplicationDbContext db)
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

        public bool CreateUsuario(Usuario usuario)
        {
            _db.Usuarios.Add(usuario);
            return Save();

        }
        public Usuario GetUsuario(int id_usuario)
        {
            return _db.Usuarios.Include(p => p.Pais).FirstOrDefault(u => u.id_usuario == id_usuario);
        }
        public bool UsuarioExists(string CorreoElectronico)
        {
            return _db.Usuarios.Any(p => p.email.ToLower().Trim() == CorreoElectronico.ToLower().Trim());
        }

        public bool UpdateUsuario(Usuario usuario)
        {
            _db.Usuarios.Update(usuario);
            return Save();
        }
        public ICollection<Usuario> GetUsuarios()
        {
            return _db.Usuarios.Include(p => p.Pais).Where(u => u.fecha_baja == null).OrderBy(u => u.apellido).ToList();
        }
    }
}
    