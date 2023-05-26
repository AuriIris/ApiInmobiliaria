using System.ComponentModel.DataAnnotations.Schema;

namespace api.Models;
public class Contrato
{
    public int Id { get; set; }
    public DateTime FecDesde { get; set; }
    public DateTime FecHasta { get; set; }

    public int IdInquilino { get; set; }

    [NotMapped]
    public Inquilino? Inquilino1 { get; set; }

    public int IdInmueble {get; set;}
    [NotMapped]
    public Inmueble? Inmueble1{ get; set; }
   
}