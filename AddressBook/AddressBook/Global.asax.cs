using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace AddressBook
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }

    public static void RegisterRoutes(RouteCollection routes)
        {
            routes.Ignore("{resource}.axd/{*pathInfo}");

            routes.MapPageRoute(
                "AdminPanelCountryList",
                "AdminPanel/Country/List",
                "~/AdminPanel/Country/CountryList.aspx"
                );

            routes.MapPageRoute(
               "AdminPanelCountryAdd",
               "AdminPanel/Country/{OperationName}",
               "~/AdminPanel/Country/CountryAddEdit.aspx"
               );

            routes.MapPageRoute(
              "AdminPanelCountryEdit",
              "AdminPanel/Country/{OperationName}/{CountryID}",
              "~/AdminPanel/Country/CountryAddEdit.aspx"
              );

            routes.MapPageRoute(
                "AdminPanelStateList",
                "AdminPanel/State/List",
                "~/AdminPanel/State/StateList.aspx"
                );

            routes.MapPageRoute(
               "AdminPanelStateAdd",
               "AdminPanel/State/{OperationName}",
               "~/AdminPanel/State/StateAddEdit.aspx"
               );

            routes.MapPageRoute(
                 "AdminPanelStateEdit",
                 "AdminPanel/State/{OperationName}/{StateID}",
                 "~/AdminPanel/State/StateAddEdit.aspx"
             );

            routes.MapPageRoute(
                "AdminPanelCityList",
                "AdminPanel/City/List",
                "~/AdminPanel/City/CityList.aspx"
                );

            routes.MapPageRoute(
                 "AdminPanelCityAdd",
                 "AdminPanel/City/{OperationName}",
                 "~/AdminPanel/City/CityAddEdit.aspx"
             );

            routes.MapPageRoute(
                 "AdminPanelCityEdit",
                 "AdminPanel/City/{OperationName}/{CityID}",
                 "~/AdminPanel/City/CityAddEdit.aspx"
             );

            routes.MapPageRoute(
                    "LoginPage",
                    "AdminPanel/Login",
                    "~/AdminPanel/Login.aspx"
                );

            routes.MapPageRoute(
                    "RegisterPage",
                    "AdminPanel/Register",
                    "~/AdminPanel/Register.aspx"
                );
        }
    }
}