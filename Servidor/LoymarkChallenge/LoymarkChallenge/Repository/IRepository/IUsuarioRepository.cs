using LoymarkChallenge.Models;

namespace LoymarkChallenge.Repository.IRepository
{
    public interface IUsuarioRepository
    {
        public bool CreateUsuario(Usuario usuario);
        public bool UsuarioExists(string CorreoElectronico);
        public Usuario GetUsuario(int id_usuario);
        public bool UpdateUsuario(Usuario usuario);
        public ICollection<Usuario> GetUsuarios();
    }
}
