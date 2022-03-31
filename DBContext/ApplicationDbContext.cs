using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApplication3.Models;

namespace WebApplication3.DBContext
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
        }        
        public DbSet<Cliente> Cliente{ get; set; }
        public DbSet<WebApplication3.Models.Cuenta> Cuenta { get; set; }
        public DbSet<WebApplication3.Models.Movimientos> Movimientos { get; set; }

    }
}
