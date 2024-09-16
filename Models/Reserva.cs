namespace Fodun.Models{
    public class Reserva{
        public int ReservaId {get; set;}
        public int UsuarioId {get; set;}
        public int AlojamientoId {get; set;}
        public DateOnly FechaReserva {get; set;}
        public DateOnly FechaInicio {get; set;}
        public DateOnly FechaSalida {get; set;}
        public int NumeroPersonas {get; set;}
        public string Estado {get; set;}
        public decimal MontoTotal {get; set;}
    }
}