using System.Text.Json.Serialization;

using System.ComponentModel.DataAnnotations;

namespace Fodun.Models{
    public class Disponible{
        [Key]
        public int DisponibilidadId {get; set;}
        public int AlojamientoId {get; set;}
        public DateOnly FechaInicio {get; set;}
        public DateOnly FechaFin {get; set;}
    }

}