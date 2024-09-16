using Microsoft.AspNetCore.Identity;
using System.Threading.Tasks;
using Fodun.App.Interfaces;
using Fodun.Models;
using Fodun.Data;


namespace Fodun.App.Interfaces{
    public interface IUserRepository
    {
       Task<int>  CreateUser(Usuario userRegister);
       Task<Usuario> GetUser(Usuario user);
    }
}