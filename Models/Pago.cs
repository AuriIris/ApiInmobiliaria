using System.ComponentModel.DataAnnotations.Schema;

namespace api.Models;
public class Pago
{


    public int Id { get; set; }
    public double Monto { get; set; }
    public DateTime Fecha { get; set; }
    public int IdContrato { get; set; }
    [NotMapped]
    public Contrato? Contrato1 { get; set; }
    


  
}