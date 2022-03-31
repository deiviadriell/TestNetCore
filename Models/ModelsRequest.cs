using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication3.Models
{
    public class ModelsRequest
    {
    }
    public class CuentasView
    {
        public string numeroCuenta { get; set; }
        public string tipo { get; set; }
        public decimal saldoInicial { get; set; }
        public bool estado { get; set; }
        public string cliente { get; set; }
    }

    public class EstadoCuenta
    {
        public string numeroCuenta { get; set; }
        public decimal totalSaldos { get; set; }
        public decimal totalDebidos { get; set; }
        public decimal totalCreditos { get; set; }
    }
}
