
using api.Models;
using Microsoft.EntityFrameworkCore;

public class DataContext : DbContext
	{
		public DataContext(DbContextOptions<DataContext> options) : base(options)
		{

		}
		
		public DbSet<Persona> Persona { get; set; }
        public DbSet<Usuario> Usuario { get; set; }
		public DbSet<Propietario> Propietario { get; set; }
		public DbSet<Inquilino> Inquilino { get; set; }
		public DbSet<Contrato> Contrato { get; set; }
		public DbSet<Pago> Pago { get; set; }
		public DbSet<Inmueble> Inmueble { get; set; }

		
	}
    
