using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication3.DBContext;
using WebApplication3.Models;

namespace WebApplication3.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MovimientosController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public MovimientosController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Movimientos
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Movimientos>>> GetMovimientos()
        {
            return await _context.Movimientos.ToListAsync();
        }

        // GET: api/Movimientos/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Movimientos>> GetMovimientos(int id)
        {
            var movimientos = await _context.Movimientos.FindAsync(id);

            if (movimientos == null)
            {
                return NotFound();
            }

            return movimientos;
        }

        // PUT: api/Movimientos/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutMovimientos(int id, Movimientos movimientos)
        {
            if (id != movimientos.idMovimiento)
            {
                return BadRequest();
            }

            _context.Entry(movimientos).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MovimientosExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Movimientos
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Movimientos>> PostMovimientos(Movimientos movimientos)
        {            
            
            if(movimientos.TipoMovimiento.idTipoMovimiento == 2)
            {
                //verifico el saldo disponible
                var saldo = _context.Movimientos.Where(x => x.Cuenta.idCuenta == movimientos.idCuenta).Select(x => x.saldo).LastOrDefault();
                if(saldo ==0 || saldo < movimientos.valor)
                {
                    return BadRequest("Saldo no disponible");
                }

                //obtengo el total de lo retirado el dia de hoy
                var retiros = _context.Movimientos.Where(x => x.Cuenta.idCuenta == movimientos.idCuenta && x.TipoMovimiento.idTipoMovimiento == 2 && x.fecha.Value.Date == DateTime.Now.Date).Sum(x => x.valor);
                //verifico si lo retirado no sobrepasa el limite
                if ((movimientos.valor > movimientos.Cuenta.limiteRetiroDiario - retiros))
                {
                    return BadRequest("Cupo excedido diario");
                }
            }
           
            _context.Movimientos.Add(movimientos);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetMovimientos", new { id = movimientos.idMovimiento }, movimientos);
        }

        [HttpGet]
        [Route("api/TrataMovimientos/Estado/{fechaInicio}/{fechaFin}/{idCliente}")]
        public async Task<ActionResult<IEnumerable<EstadoCuenta>>> ObtenerEstadoCuenta (DateTime fechaInicio, DateTime fechaFin, int idCliente)
        {
            List<EstadoCuenta> estadoCuenta = new List<EstadoCuenta>();
            var cuentas = await _context.Movimientos.Where(x => (x.fecha.Value >= fechaInicio.Date && x.fecha.Value.Date<= fechaFin.Date) && x.Cuenta.Cliente.clienteid ==idCliente).GroupBy(x => new { x.Cuenta.numero }).ToListAsync();

            foreach(var cuenta in cuentas)
            {
                EstadoCuenta estado = new EstadoCuenta();
                estado.totalDebidos =await _context.Movimientos.Where(x => (x.fecha.Value >= fechaInicio.Date && x.fecha.Value.Date <= fechaFin.Date) && x.Cuenta.numero == cuenta.Key.numero && x.idTipoMovimiento ==2).SumAsync(x => x.valor);
                estado.totalCreditos = await _context.Movimientos.Where(x => (x.fecha.Value >= fechaInicio.Date && x.fecha.Value.Date <= fechaFin.Date) && x.Cuenta.numero == cuenta.Key.numero && x.idTipoMovimiento == 1).SumAsync(x => x.valor);
                estado.totalSaldos = estado.totalCreditos - estado.totalDebidos;
                estadoCuenta.Add(estado);
            }
            return estadoCuenta;

        }

        // DELETE: api/Movimientos/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteMovimientos(int id)
        {
            var movimientos = await _context.Movimientos.FindAsync(id);
            if (movimientos == null)
            {
                return NotFound();
            }

            _context.Movimientos.Remove(movimientos);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool MovimientosExists(int id)
        {
            return _context.Movimientos.Any(e => e.idMovimiento == id);
        }
    }
}
