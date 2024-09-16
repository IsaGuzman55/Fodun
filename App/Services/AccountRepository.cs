using Microsoft.AspNetCore.Identity;
using Fodun.Models;
using Fodun.Data;
using Fodun.App.Interfaces;

namespace Fodun.App.Services{

    public class AccountRepository : IAccountRepository
    {
        private readonly ReservasContext _context;

        public AccountRepository(ReservasContext context)
        {
            _context = context;
        }

        
    }
}

