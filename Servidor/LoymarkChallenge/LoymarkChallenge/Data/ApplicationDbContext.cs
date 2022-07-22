using LoymarkChallenge.Models;
using Microsoft.EntityFrameworkCore;

namespace LoymarkChallenge.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
        }

        public DbSet<Actividad> Actividades { get; set; }
        public DbSet<Pais> Paises { get; set; }
        public DbSet<Usuario> Usuarios { get; set; }
    }
}
