using System.Collections.Generic;
using System.Linq;
using api.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class InmuebleController : ControllerBase
    {
        private readonly DataContext _context;

        public InmuebleController(DataContext context)
        {
            _context = context;
        }

        [HttpGet("propiedades")]
        public IActionResult GetPropiedades()
        {
            var mail = User.Identity.Name;
            var propietario = _context.Propietario.FirstOrDefault(x => x.Mail == mail);
            if (propietario == null)
            {
                return NotFound();
            }

            var propiedades = _context.Inmueble.Where(i => i.IdPropietario == propietario.Id).ToList();

            return Ok(propiedades);
        }
        [HttpGet("alquiladas")]
        public IEnumerable<Contrato> GetContratosAlquilados()
        {
            DateTime fechaActual = DateTime.Now;
            
            var contratosAlquilados = _context.Contrato
                .Where(c => c.FecDesde <= fechaActual && c.FecHasta >= fechaActual)
                .Join(_context.Inmueble,
                    contrato => contrato.IdInmueble,
                    inmueble => inmueble.Id,
                    (contrato, inmueble) => new { Contrato = contrato, Inmueble = inmueble })
                .Join(_context.Inquilino,
                    contratoInmueble => contratoInmueble.Contrato.IdInquilino,
                    inquilino => inquilino.Id,
                    (contratoInmueble, inquilino) => new Contrato
                    {
                        Id = contratoInmueble.Contrato.Id,
                        FecDesde = contratoInmueble.Contrato.FecDesde,
                        FecHasta = contratoInmueble.Contrato.FecHasta,
                        IdInquilino = contratoInmueble.Contrato.IdInquilino,
                        Inquilino1 = inquilino,
                        IdInmueble = contratoInmueble.Contrato.IdInmueble,
                        Inmueble1 = contratoInmueble.Inmueble
                    })
                .ToList();

            return contratosAlquilados;
        }



    }
}
