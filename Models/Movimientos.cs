using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication3.Models
{
    public class Movimientos
    {
        [Key]
        public int idMovimiento { get; set; }



        public TipoMovimiento TipoMovimiento { get; set; }
        [ForeignKey("TipoMovimiento")]
        public int idTipoMovimiento { get; set; }
        public DateTime? fecha { get; set; }

        public decimal valor { get; set; }
        public decimal saldo { get; set; }

        public Cuenta Cuenta{ get; set; }
        [ForeignKey("Cuenta")]
        public int idCuenta { get; set; }
    }
}
