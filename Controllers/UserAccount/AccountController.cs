using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Fodun.App.Services;
using Fodun.App.Interfaces;
using System.Security.Claims;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using System.Threading.Tasks;
using Fodun.Data;
using Fodun.Models;

namespace Fodun.Controllers{
    public class AccountController : Controller{
        private readonly IUserRepository  _userRepository;
       
       public AccountController(IUserRepository  userRepository){
         _userRepository = userRepository;
       }

        [HttpGet]
        public IActionResult Login()
        {
            if(User.Identity!.IsAuthenticated){
                return RedirectToAction("InicioLogin", "Sedes");
            }
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Login(Usuario userLogIn){
            /* Encontrar al usuario con los datos ingresados con la funcion de Services */
            var foundUser = await _userRepository.GetUser(userLogIn);
            if(foundUser == null){
                ViewData["ErrorMessage"] = "¡Los datos no coinciden con los de algún usuario!";
                return View();
            }

            List<Claim>claims = new List<Claim>(){
                /* Identificador estándar que indica que claim contiene el nombre del usuario */
                new Claim(ClaimTypes.Name, foundUser.Nombre)
            };

            /* ClaimsIdentity: Es una colección de Claims que describen la identidad del usuario */
            /* Crear un nuevo ClaimsIdentity en el que a traves de "claims" le pasaremos los datos que guardamos anteriormente(Name) */
            ClaimsIdentity claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            AuthenticationProperties properties = new AuthenticationProperties(){
                /* Refercar la sesion del usuario */
                AllowRefresh = true,
            };

            await HttpContext.SignInAsync(
                /* Utilizar el esquema de autenticaion por Cookie */
                CookieAuthenticationDefaults.AuthenticationScheme,
                /* Pasarle el ClaimsIdentity que creamos anteriormente */
                new ClaimsPrincipal(claimsIdentity),
                properties
            );

            return RedirectToAction("InicioLogin", "Sedes");
        }

        [HttpGet]
        public IActionResult Register()
        {
            if(User.Identity!.IsAuthenticated){
                return RedirectToAction("InicioLogin", "Sedes");
            }
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Register(Usuario userRegister)
        {
            // Formar un nuevo usuario con los datos entrantes
            var user = new Usuario()
            {
                Documento = userRegister.Documento,
                Nombre = userRegister.Nombre,
                FechaNacimiento = userRegister.FechaNacimiento,
                Celular = userRegister.Celular,
                Email = userRegister.Email,
                Departamento = userRegister.Departamento,
                Municipio = userRegister.Municipio,
                Barrio = userRegister.Barrio,
                Direccion = userRegister.Direccion,
                Telefono = userRegister.Telefono,
                PreguntaSecreta = userRegister.PreguntaSecreta,
                RespuestaSecreta = userRegister.RespuestaSecreta,
                Clave = userRegister.Clave,
            };

            // Llamar a la función del servicio para crear el usuario
            var userCreated = await _userRepository.CreateUser(user);

            if (userCreated > 0)
            {
                return RedirectToAction("Login", "Account");
            }

            // Si no se creó, enviar un mensaje de error
            ViewData["Mensaje"] = "¡Error!, No se creó el usuario";
            return View();
        }


     public async Task<IActionResult> Logout()
    {
        await HttpContext.SignOutAsync();
        return RedirectToAction("Login", "Account");
    }

    }

    


   
}
