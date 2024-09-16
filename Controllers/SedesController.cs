using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;

using Fodun.Data;
using Fodun.Models;

namespace Fodun.Controllers{
   
    public class SedesController : Controller{
        public readonly ReservasContext _context;

        public SedesController(ReservasContext context){
            _context = context;
        }

        public async Task<IActionResult> Index(){
            return View(await _context.Sedes.ToListAsync());
        }

        public async Task<IActionResult> Detalles(int? Id)
        {       
            return View(await _context.Sedes.FirstOrDefaultAsync(s => s.SedeId == Id));  
        }

        public async Task<IActionResult> InicioLogin(){
            return View(await _context.Sedes.ToListAsync());
        }

        public async Task<IActionResult> ListarReservas(){
            return View(await _context.Reservas.ToListAsync());
        }


    }

}