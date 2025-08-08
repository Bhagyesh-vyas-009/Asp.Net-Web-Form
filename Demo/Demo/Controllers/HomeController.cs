using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using Demo.Models;
using Microsoft.AspNetCore.Mvc;

namespace Demo.Controllers
{
    public class HomeController : Controller
    {
        private IConfiguration _configuration;

        public HomeController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult InternList()
        {
            String connstr = this._configuration.GetConnectionString("ConnectionString");
            SqlConnection conn=new SqlConnection(connstr);
            conn.Open();
            SqlCommand cmd=conn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "PR_INTERN_SELECTALL";
            SqlDataReader sdr=cmd.ExecuteReader();
            DataTable dt=new DataTable();
            dt.Load(sdr);           
            return View(dt);
        }
    }
}
