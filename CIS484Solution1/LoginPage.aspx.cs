using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls; 
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;

namespace CIS484Solution1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Get connection string from web.config file  
            string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            //create new sqlconnection and connection to database by using connection string from web.config file  
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            //string connectionString;
            //SqlConnection cnn;

            //connectionString = "Server=WSAMZN-9F2R1MPD;Database=Lab1;Trusted_Connection=Yes;";

            //cnn = new SqlConnection(connectionString);

            //cnn.Open();

            //            Response.Write("Connection Made");
            //cnn.Close();
        }
        protected void menuTabsCurrent_MenuItemClick(object sender, MenuEventArgs e)
        {
            Menu menuTabsCurrent = sender as Menu;
            MultiView multiTabs = this.FindControl("multiviewEmployee") as MultiView;
            multiTabs.ActiveViewIndex = Int32.Parse(menuTabsCurrent.SelectedValue);

        }
        protected void MasterMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            Menu MasterMenu = sender as Menu;
            MultiView multiTabs = this.FindControl("MasterMultiView") as MultiView;
            multiTabs.ActiveViewIndex = Int32.Parse(MasterMenu.SelectedValue);

        }
        protected void TeacherMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            Menu TeacherMenu = sender as Menu;
            MultiView multiTabs = this.FindControl("TeacherView") as MultiView;
            multiTabs.ActiveViewIndex = Int32.Parse(TeacherMenu.SelectedValue);

        }
        protected void VolunteerMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            Menu VolunteerMenu = sender as Menu;
            MultiView multiTabs = this.FindControl("VolunteerMultiView") as MultiView;
            multiTabs.ActiveViewIndex = Int32.Parse(VolunteerMenu.SelectedValue);

        }
        protected void CoordinatorMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            Menu CoordinatorMenu = sender as Menu;
            MultiView multiTabs = this.FindControl("CoordinatorMultiView") as MultiView;
            multiTabs.ActiveViewIndex = Int32.Parse(CoordinatorMenu.SelectedValue);

        }
    }
}