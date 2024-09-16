namespace Fodun.Models{
    public class Pago{
        public int PagoId {get; set;}
        public int ResevaId {get; set;}
        public DateOnly FechaPago {get; set;}
        public decimal MontoPagado {get; set;}
        public string MetodoPago {get; set;}
    }
}