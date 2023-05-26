namespace api.Models;

public class Propietario
{
    public int Id { get; set; }
    public string? Dni { get; set; }="";
    public string? Apellido { get; set; }="";
    public string? Nombre { get; set; }="";
    public string? Telefono { get; set; }="";
    public string? Mail { get; set; }="";
     public string? Direccion{get;set;}="";
    public string Clave{get;set;}="";
   
}
