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
    public class MovimientosCuenta
    {
        public DateTime? fecha { get; set; }
        public string cliente { get; set; }
        public string numeroCuenta { get; set; }
        public string tipoCuenta { get; set; }
        public decimal saldoInicial { get; set; }
        public string tipoMovimiento { get; set; }
        public bool estado { get; set; }
        public decimal movimiento { get; set; }
        public decimal saldoDisponible { get; set; }
    }

    public class CuentasClientes
    {
        public int idCuenta { get; set; }
        public string numero { get; set; }

    }

    public class EstadoCuenta
    {
        public string numeroCuenta { get; set; }
        public decimal totalSaldos { get; set; }
        public decimal totalDebidos { get; set; }
        public decimal totalCreditos { get; set; }
    }
    
}
