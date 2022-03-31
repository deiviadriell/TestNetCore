using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication3.Models
{
    public class TipoMovimiento
    {
        [Key]
        public int idTipoMovimiento { get; set; }
        public string tipoMovimiento { get; set; }

         public ICollection<Movimientos> Movimientos{ get; set; }
    }
}
