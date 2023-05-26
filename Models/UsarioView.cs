namespace api.Models;

public class UsuarioView
{
    public string? Mail { get; set; } ="";

    public string? Telefono { get; set; } ="";

    public string? Direccion { get; set; } ="";

    public UsuarioView(){

    }
    public UsuarioView(Usuario usuario){
        this.Direccion = usuario.Direccion; 
        this.Mail= usuario.Mail; 
        this.Telefono= usuario.Telefono;
        
    }



    
}
