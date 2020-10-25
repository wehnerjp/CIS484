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
using System.Windows.Forms;
using System.Web.Services;
using System.CodeDom.Compiler;

namespace CIS484Solution1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public static AccessCode MasterAccessCode = new AccessCode();

        protected void ContactMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            System.Web.UI.WebControls.Menu ContactMenu = sender as System.Web.UI.WebControls.Menu;
            MultiView multiTabs = this.FindControl("multiviewStudent") as MultiView;
            multiTabs.ActiveViewIndex = Int32.Parse(ContactMenu.SelectedValue);
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string code = "";
            code = MasterAccessCode.GenerateCode(lowercase: true, uppercase: true, numbers: true, otherChar: true, codeSize: 8);
            MessageBox.Show(code.ToString(), "Code 1 for instructor: ");

            string code2 = "";
            code2 = MasterAccessCode.GenerateCode(lowercase: true, uppercase: true, numbers: true, otherChar: true, codeSize: 8);
            MessageBox.Show(code2.ToString(), "Code 2 for instructor: ");

            string sqlQuery = "Select InstructorCode, Name, Email, Phone from INSTRUCTOR";
            SqlConnection sqlconnect = new SqlConnection(ConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString);

            //create new sqlconnection and connection to database by using connection string from web.config file
            sqlconnect.Open();

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlconnect);

            DataTable In_GridView = new DataTable();
            sqlAdapter.Fill(In_GridView);
            Instructor_GridView.DataSource = In_GridView;
            Instructor_GridView.DataBind();
        }

        protected void Instructor_ResetButton_Click(object sender, EventArgs e)
        {
            Instructor_tbEmail.Text = string.Empty;
            Instructor_tbFirstName.Text = string.Empty;
            Instructor_tbLastName.Text = string.Empty;
            Instructor_tbPhone.Text = string.Empty;
        }
    }


}