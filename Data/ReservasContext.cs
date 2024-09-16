using Microsoft.EntityFrameworkCore;
using Fodun.Models;

namespace Fodun.Data
{
    public class ReservasContext : DbContext
    {
        public ReservasContext(DbContextOptions<ReservasContext> options) : base(options)
        {
        }

        public DbSet<Usuario> Usuarios { get; set; }
        public DbSet<Alojamiento> Alojamientos { get; set; }
        public DbSet<Disponible> Disponibles { get; set; }
        public DbSet<Pago> Pagos { get; set; }
        public DbSet<Reserva> Reservas { get; set; }
        public DbSet<Sede> Sedes { get; set; }
        public DbSet<Tarifa> Tarifas { get; set; }

    }
}
