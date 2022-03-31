using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication3.Models
{
    public class TipoCuenta
    {
        [Key]
        public int idTipoCuenta { get; set; }
        public string tipoCuenta { get; set; }
        public ICollection<Cuenta> Cuentas { get; set; }

    }
}
