using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication3.Models
{
    public class Cliente
    {

        [Key]
        public int clienteid { get; set; }
        public string nombres { get; set; }
        public int? genero { get; set; }
        public int? edad { get; set; }
        public string identificacion { get; set; }
        public string direccion { get; set; }
        public string telefono { get; set; }
        public string clave { get; set; }
        [Required] [MaxLength(100)]
        public bool estado { get; set; }       
        public ICollection<Cuenta> Cuentas { get; set; }

        
    }
}
