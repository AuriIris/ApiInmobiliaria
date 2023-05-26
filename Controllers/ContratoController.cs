using System.Collections.Generic;
using System.Linq;
using api.Models;
using Microsoft.AspNetCore.Mvc;

namespace api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ContratoController : ControllerBase
    {
        private readonly DataContext _context;

        public ContratoController(DataContext context)
        {
            _context = context;
        }

        [HttpGet("inmuebles")]
        public IActionResult GetInmuebles()
        {
            List<Inmueble> inmuebles = _context.Inmueble.ToList();
            return Ok(inmuebles);
        }
         [HttpGet("contrato-vigente/{idInmueble}")]
        public IActionResult ObtenerContratoVigente(int idInmueble)
        {
            DateTime fechaActual = DateTime.Now;
            Contrato contrato = _context.Contrato.FirstOrDefault(c => c.IdInmueble == idInmueble && c.FecDesde <= fechaActual && c.FecHasta >= fechaActual);

            if (contrato == null)
            {
                return NotFound();
            }

            return Ok(contrato);
        }


        [HttpGet("inquilino/{idInmueble}")]
        public IActionResult ObtenerInquilino(int idInmueble)
        {
            Contrato contrato = _context.Contrato.FirstOrDefault(c => c.IdInmueble == idInmueble);
            if (contrato == null)
            {
                return NotFound();
            }

            Inquilino inquilino = _context.Inquilino.FirstOrDefault(i => i.Id == contrato.IdInquilino);
            if (inquilino == null)
            {
                return NotFound();
            }

            return Ok(inquilino);
        }

        [HttpGet("{idContrato}/pagos")]
        public IActionResult ObtenerPagos(int idContrato)
        {
            Contrato contrato = _context.Contrato.FirstOrDefault(c => c.Id == idContrato);
            if (contrato == null)
            {
                return NotFound();
            }

            List<Pago> pagos = _context.Pago.Where(p => p.IdContrato == idContrato).ToList();
            return Ok(pagos);
        }
    

    }
}
