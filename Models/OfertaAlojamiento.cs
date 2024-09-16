namespace Fodun.Models{
    public class OfertaAlojamiento{
        public int AlojamientoId {get; set;}
        public Alojamiento Alojamiento {get; set;}

        public int SedeId {get; set;}
        public Sede Sede {get; set;}

        public string Nombre {get; set;}
        public int Capacidad {get; set;}
        public int NumeroHabitaciones {get; set;}
        public string Descripcion {get; set;}
        public string Estado {get; set;}
        public string Ubicacion {get; set;}
        public string Imagen {get; set;}
        public string Tipo {get; set;}
        
    }
}