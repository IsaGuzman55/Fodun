namespace Fodun.Models{
    public class Tarifa{
        public int TarifaId {get; set;}
        public int AlojamientoId {get; set;}
        public string Temporada {get; set;}
        public decimal PrecioBase {get; set;}
        public int MaxPersonas {get; set;}
        public decimal PrecioPersonaAdicional {get; set;}
    }
}