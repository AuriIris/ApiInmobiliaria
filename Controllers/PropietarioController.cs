using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cryptography.KeyDerivation;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using api.Models;

namespace api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PropietarioController : ControllerBase
    {
        private readonly DataContext _context;
        private readonly IConfiguration _config;

        public PropietarioController(DataContext context, IConfiguration config)
        {
            _context = context;
            _config = config;
        }

        [HttpGet("{id}")]
        public Propietario Get(int id)
        {
            return _context.Propietario.Find(id);
        }

        [HttpPost("login")]
        public IActionResult Login(LoginView login)
        {
            var propietario = _context.Propietario.FirstOrDefault(x => x.Mail == login.Mail);
            if (propietario == null)
            {
                return NotFound();
            }

            string hashed = Convert.ToBase64String(KeyDerivation.Pbkdf2(
                password: login.Clave,
                salt: Encoding.ASCII.GetBytes(_config["Salt"]),
                prf: KeyDerivationPrf.HMACSHA1,
                iterationCount: 1000,
                numBytesRequested: 256 / 8));

            if (propietario.Clave != hashed)
            {
                return BadRequest("Contraseña incorrecta");
            }

            var key = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(_config["TokenAuthentication:SecretKey"]));
            var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, propietario.Mail),
                new Claim("Id", propietario.Id.ToString()),
                new Claim(ClaimTypes.Role, "Propietario")
            };

            var token = new JwtSecurityToken(
                issuer: _config["TokenAuthentication:Issuer"],
                audience: _config["TokenAuthentication:Audience"],
                claims: claims,
                expires: DateTime.Now.AddDays(60),
                signingCredentials: credentials
            );

            return Ok(new JwtSecurityTokenHandler().WriteToken(token));
        }

        [HttpGet("perfil")]
        [Authorize]
        public IActionResult ObtenerPerfil()
        {
            var mail = User.Identity.Name;
            var propietario = _context.Propietario.FirstOrDefault(x => x.Mail == mail);
            if (propietario == null)
            {
                return NotFound();
            }
            return Ok(propietario);
        }

        [HttpPut("{id}")]
        [Authorize]
        public IActionResult ActualizarPerfil([FromBody] Propietario nuevoPerfil)
        {
            var mail = User.Identity.Name;
            var propietario = _context.Propietario.FirstOrDefault(x => x.Mail == mail);
            if (propietario == null)
            {
                return NotFound();
            }
            propietario.Nombre=nuevoPerfil.Nombre;
            propietario.Apellido=nuevoPerfil.Apellido;
            propietario.Dni=propietario.Dni;
            propietario.Mail = nuevoPerfil.Mail;
            propietario.Direccion = nuevoPerfil.Direccion;
            propietario.Telefono = nuevoPerfil.Telefono;
            
            _context.Update(propietario);
            _context.SaveChanges();
            var perfilActualizado = _context.Propietario.FirstOrDefault(x => x.Mail == mail);
            return Ok(perfilActualizado);
        }

       
    }
}
