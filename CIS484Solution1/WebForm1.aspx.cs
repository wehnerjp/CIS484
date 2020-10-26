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

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection sqlconnect = new SqlConnection(ConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString);
            sqlconnect.Open();

            // Grid View Display - Initial
            string sqlQuery1 = "Select InstructorCode, Name, Email, Phone from INSTRUCTOR";
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery1, sqlconnect);
            DataTable In_GridView = new DataTable();
            sqlAdapter.Fill(In_GridView);
            Instructor_GridView.DataSource = In_GridView;
            Instructor_GridView.DataBind();
        }
        protected void ContactMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            System.Web.UI.WebControls.Menu ContactMenu = sender as System.Web.UI.WebControls.Menu;
            MultiView multiTabs = this.FindControl("multiviewStudent") as MultiView;
            multiTabs.ActiveViewIndex = Int32.Parse(ContactMenu.SelectedValue);
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            // Generate Cluster and Instructor Codes
            string clusterCode = "";
            clusterCode = MasterAccessCode.GenerateCode(lowercase: true, uppercase: true, numbers: true, otherChar: true, codeSize: 8);
            MessageBox.Show(clusterCode.ToString(), "Code 1 for instructor: ");

            string  instructorCode= "";
            instructorCode = MasterAccessCode.GenerateCode(lowercase: true, uppercase: true, numbers: true, otherChar: true, codeSize: 8);
            MessageBox.Show(instructorCode.ToString(), "Code 2 for instructor: ");

            SqlConnection sqlconnect = new SqlConnection(ConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString);
            sqlconnect.Open();

            // Necessary information for insert statements
            string eventID = ""; 
            string contactCode = "";
            string orgID = "";

            // Find necessary information
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

            // INSERT SQL Statements

            // Insert - Access Part 1
            String sqlQuery_p1 = "INSERT INTO ACCESSCODE(Code, UserType) VALUES (@Code, @UserType)";
            SqlCommand cmd_p1 = new SqlCommand(sqlQuery_p1, sqlconnect);
            cmd_p1.Parameters.Add(new SqlParameter("@Code", clusterCode));
            cmd_p1.Parameters.Add(new SqlParameter("@UserType", "Instructor"));
            try
            {
                cmd_p1.CommandType = CommandType.Text;
                cmd_p1.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert Error into AccessCode";
                msg += ex.Message;
                throw new Exception(msg);
            }

            // Insert - Cluster Part 1
            String sqlQuery_p2 = "INSERT INTO CLUSTER(ClusterCode) VALUES (@ClusterCode)";
            SqlCommand cmd_p2 = new SqlCommand(sqlQuery_p2, sqlconnect);
            cmd_p2.Parameters.Add(new SqlParameter("@ClusterCode", clusterCode));
            try
            {
                cmd_p2.CommandType = CommandType.Text;
                cmd_p2.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert Error into Cluster Part 1";
                msg += ex.Message;
                throw new Exception(msg);
            }

            // Insert - Instructor
            String sqlQuery4 = "INSERT INTO INSTRUCTOR(InstructorCode, Name, OrganizationID, Email, Phone, ContactCode)" +
                "VALUES (@InstructorCode, @Name, @OrganizationID, @Email, @Phone, @ContactCode)";
            SqlCommand cmd101 = new SqlCommand(sqlQuery4, sqlconnect);
            cmd101.Parameters.Add(new SqlParameter("@InstructorCode", instructorCode));
            cmd101.Parameters.Add(new SqlParameter("@Name", Instructor_tbFirstName.Text + ' ' + Instructor_tbLastName.Text));
            cmd101.Parameters.Add(new SqlParameter("@OrganizationID", orgID));
            cmd101.Parameters.Add(new SqlParameter("@Email", Instructor_tbEmail.Text));
            cmd101.Parameters.Add(new SqlParameter("@Phone", Instructor_tbPhone.Text));
            cmd101.Parameters.Add(new SqlParameter("@ContactCode", contactCode));
            try
            {
                cmd101.CommandType = CommandType.Text;
                cmd101.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert Error into Instructor";
                msg += ex.Message;
                throw new Exception(msg);

            }

            // Update - Cluster Part 2
            String sqlQuery3 = "UPDATE Cluster SET InstructorCode = @InstructorCode, OrganizationID = @OrganizationID WHERE ClusterCode = @ClusterCode";
            SqlCommand cmd103 = new SqlCommand(sqlQuery3, sqlconnect); 
            cmd103.Parameters.Add(new SqlParameter("@InstructorCode", instructorCode));
            cmd103.Parameters.Add(new SqlParameter("@OrganizationID", orgID));
            cmd103.Parameters.Add(new SqlParameter("@ClusterCode", clusterCode));
            try
            {
                cmd103.CommandType = CommandType.Text;
                cmd103.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {

                string msg = "Insert Error into Cluster Part 2";
                msg += ex.Message;
                throw new Exception(msg);
            }
            
            // Grid View Display - Update
            string sqlQuery1 = "Select InstructorCode, Name, Email, Phone from INSTRUCTOR";
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery1, sqlconnect);
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