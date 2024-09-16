namespace Fodun.Models{
    public class Sede{
        public int SedeId {get; set;}
        public string Nombre {get; set;}
        public string Tipo {get; set;}
        public string Ubicacion {get; set;}
        public int CapacidadTotal {get; set;}
        public string Descripcion {get; set;}
        public string Imagen {get; set;}

        public ICollection<OfertaAlojamiento> sqlAlojamientos { get; set; }
    }
}