using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication3.Models
{
    public class Cuenta
    {
        [Key]
        public int idCuenta { get; set; }

        public string numero { get; set; }
        public decimal saldoInicial { get; set; }
        public bool estado { get; set; }

        public decimal limiteRetiroDiario { get; set; }
        public Cliente Cliente{ get; set; }
        [ForeignKey("Cliente")]
        public int idCliente { get; set; }

        public TipoCuenta TipoCuenta { get; set; }
        [ForeignKey("TipoCuenta")]
        public int idTipoCuenta { get; set; }

        public ICollection<Movimientos> Movimientos { get; set; }

    }
}
