using Microsoft.AspNetCore.Identity;

namespace Fodun.Models{
    public class Usuario{
        public int UsuarioId {get; set;}
        public string Documento {get; set;}
        public string Nombre {get; set;}
        public DateOnly FechaNacimiento {get; set;}
        public string Celular {get; set;}
        public string Email {get; set;}
        public string Departamento {get; set;}
        public string Municipio {get; set;}
        public string Barrio {get; set;}
        public string Direccion {get; set;}
        public string Telefono {get; set;}
        public string PreguntaSecreta {get; set;}
        public string RespuestaSecreta {get; set;}
        public string Clave {get; set;}
    }
}