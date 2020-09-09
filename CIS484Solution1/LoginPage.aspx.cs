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

        protected void EventList_SelectedIndexChanged(object sender, EventArgs e)
        {
            String sqlQuery = "Select EventName, Time, FORMAT(Date,'dd/MM/yyyy') as Date, RoomNbr from Event where EventID = " + EventList.SelectedItem.Value;
            //Get connection string from web.config file  
            string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            //create new sqlconnection and connection to database by using connection string from web.config file  
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, con);
            DataSet ds = new DataSet();
            sqlAdapter.Fill(ds);
            FormView1.DataSource = ds;
            FormView1.DataBind();
            con.Close();

        }
        protected void StudentSchool_SelectedIndexChanged(object sender, EventArgs e)
        {
            String sqlQuery = "Select TeacherID, FirstName +' ' + LastName as TeacherName from Teacher where SchoolID = " + StudentSchoolDropDownList.SelectedItem.Value;
            //Get connection string from web.config file  
            string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            //create new sqlconnection and connection to database by using connection string from web.config file  
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, con);
            sqlAdapter.Fill(dt);

            if (dt.Rows.Count > 0)
            {

                StudentTeacherDropDownList.DataSource = dt;
                StudentTeacherDropDownList.DataTextField = "TeacherName";
                StudentTeacherDropDownList.DataValueField = "TeacherID";
                StudentTeacherDropDownList.DataBind();
            }
            con.Close();

        }
        protected void StudentNameDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            String sqlQuery = "Select StudentID, FirstName +' ' + LastName as StudentName, Age from Student where StudentID = " + StudentNameDDL.SelectedItem.Value;
            //Get connection string from web.config file  
            string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            //create new sqlconnection and connection to database by using connection string from web.config file  
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, con);
            DataSet ds = new DataSet();
            sqlAdapter.Fill(ds);
            StudentFormView.DataSource = ds;
            StudentFormView.DataBind();
            con.Close();

        }

    }
}