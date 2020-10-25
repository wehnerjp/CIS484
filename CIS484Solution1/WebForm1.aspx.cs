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
            // Generate codes
            string code = "";
            code = MasterAccessCode.GenerateCode(lowercase: true, uppercase: true, numbers: true, otherChar: true, codeSize: 8);
            MessageBox.Show(code.ToString(), "Code 1 for instructor: ");

            string code2 = "";
            code2 = MasterAccessCode.GenerateCode(lowercase: true, uppercase: true, numbers: true, otherChar: true, codeSize: 8);
            MessageBox.Show(code2.ToString(), "Code 2 for instructor: ");

            // Grid View Display
            string sqlQuery1 = "Select InstructorCode, Name, Email, Phone from INSTRUCTOR";
            SqlConnection sqlconnect = new SqlConnection(ConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString);

            //create new sqlconnection and connection to database by using connection string from web.config file
            sqlconnect.Open();

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery1, sqlconnect);

            DataTable In_GridView = new DataTable();
            sqlAdapter.Fill(In_GridView);
            Instructor_GridView.DataSource = In_GridView;
            Instructor_GridView.DataBind();

            // INSERT SQL STATEMENTS

            string eventID = ""; 
            string contactCode = "";
            string orgID = "";

            
            string sqlQuery2 = "SELECT EventID, ContactCode, OrganizationID FROM EVENTCONTACT";

            SqlCommand cmd100 = new SqlCommand(sqlQuery2, sqlconnect); 

            try
            {
                SqlDataReader reader = cmd100.ExecuteReader();
                
                while (reader.Read())
                {
                    eventID = reader[0].ToString();
                    contactCode = reader[1].ToString();
                    orgID = reader[2].ToString(); 
                }
                reader.Close();
            }
            catch (System.Data.SqlClient.SqlException ex )
            {
                string msg = "Select Error in EventContact";
                msg += ex.Message;
                throw new Exception(msg); 
            }
            

            String sqlQuery3 = "INSERT INTO INSTRUCTOR(InstructorCOde, Name, OrganizationID, Email, Phone, ContactCode)" +
                "VALUES (@InstructorCode, @Name, @OrganizationID, @Email, @Phone, @ContactCode)";
            String sqlQuery4 = "INSERT INTO ACCESSCODE (Code, UserType)" +
                "VALUES (@Code, @UserType)";
            String sqlQuery5 = "INSERT INTO CLUSTER(ClusterCode, InstructorCode, OrganizationID)" +
                "VALUES(@ClusterCode, @InstructorCode, @OrganizationID)";

            SqlCommand cmd101 = new SqlCommand(sqlQuery3, sqlconnect);
            SqlCommand cmd102 = new SqlCommand(sqlQuery4, sqlconnect);
            SqlCommand cmd103 = new SqlCommand(sqlQuery5, sqlconnect);

            cmd101.Parameters.Add(new SqlParameter("@InstructorCode", code2));
            cmd101.Parameters.Add(new SqlParameter("@Name", Instructor_tbFirstName.Text + Instructor_tbLastName.Text));
            cmd101.Parameters.Add(new SqlParameter("@OrganizationID", orgID));
            cmd101.Parameters.Add(new SqlParameter("@Email", Instructor_tbEmail.Text));
            cmd101.Parameters.Add(new SqlParameter("@Phone", Instructor_tbPhone.Text));
            cmd101.Parameters.Add(new SqlParameter("@ContactCode", contactCode));
            
            cmd102.Parameters.Add(new SqlParameter("@Code", code2));
            cmd102.Parameters.Add(new SqlParameter("@UserType", "Teacher"));

            cmd103.Parameters.Add(new SqlParameter("@ClusterCode", code));
            cmd103.Parameters.Add(new SqlParameter("@InstructorCode", code2));
            cmd103.Parameters.Add(new SqlParameter("@OrganizationID", orgID));

            try
            {
                cmd101.CommandType = CommandType.Text;
                cmd101.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert Error into "
            }
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