using Microsoft.AspNetCore.Identity;
using Fodun.Models;
using Fodun.Data;
using Fodun.App.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace Fodun.App.Services{

    public class UserRepository : IUserRepository
    {
        private readonly ReservasContext _context;

        public UserRepository(ReservasContext context)
        {
            _context = context;
        }

        
       public async Task<int> CreateUser(Usuario userRegister)
        {
            /* Agregar y guardar los datos */
            _context.Usuarios.Add(userRegister);
            await _context.SaveChangesAsync(); // Usa la versión asíncrona de SaveChanges

            /* Combrobar si el usuario fue creado */
            return userRegister.UsuarioId; // Devuelve un string en lugar de int
        }



        public async Task<Usuario> GetUser(Usuario user){
            return await _context.Usuarios.Where(u => u.Documento == user.Documento && u.Clave == user.Clave).FirstOrDefaultAsync();
        }
    }
}


        
        
        
        