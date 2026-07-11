using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace CRUD_Practice.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TestController : ControllerBase
    {
        [HttpGet("health")]
        [AllowAnonymous]
        public IActionResult Health()
        {
            return Ok(new 
            { 
                message = "API is running!",
                timestamp = DateTime.Now,
                status = "healthy"
            });
        }

        [HttpGet("auth-test")]
        [Authorize]
        public IActionResult AuthTest()
        {
            var userId = User.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier)?.Value;
            var username = User.FindFirst(System.Security.Claims.ClaimTypes.Name)?.Value;
            var email = User.FindFirst(System.Security.Claims.ClaimTypes.Email)?.Value;

            return Ok(new 
            { 
                message = "JWT Authentication is working!",
                userId = userId,
                username = username,
                email = email,
                claims = User.Claims.Select(c => new { c.Type, c.Value })
            });
        }
    }
}
