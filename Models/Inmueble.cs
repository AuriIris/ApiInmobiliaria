
using System.ComponentModel.DataAnnotations.Schema;

namespace api.Models;

public class Inmueble
{
    public enum enTipo
    {

        Casa = 1,
        Departamento = 2,

        Local = 3,

    }
    public enum enUso
    {
        Comercial = 1,
        Hogar = 2,
    }
    public enum enEstado
    {
        Disponible = 1,
        NoDisponible = 2,
    }

    public int Id { get; set; }
    public int  Tipo { get; set; }
    public String?  Direccion { get; set; }
    public int  Uso { get; set; }
    public int  CantHamb  { get; set; }
    public String?  Latitud { get; set; }
    public String?  Longitud { get; set; }
    public Double  Precio { get; set; }
    public int  Estado { get; set; }
    public int IdPropietario{ get; set; }
     [NotMapped]
    public Propietario? Duenio { get; set;} 

    
}