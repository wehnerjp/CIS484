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

namespace CIS484Solution1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void AddStudent_Click(object sender, EventArgs e)
        {
            Boolean dup = false;

            if (dup == false && ContactRequestNameText.Text != "" && ContactRequestPhoneText.Text != "" && StudentAgeList.SelectedIndex > -1 && ContactRequestEmailText.Text != "" && TshirtList.SelectedIndex > -1 && TshirtColorList.SelectedIndex > -1)
            {
                //If filled out and non duplicate it inserts into object
                string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
                SqlConnection connection = new SqlConnection(strcon);
                SqlCommand cmd;
                int sub;
                try
                {
                    // open the Sql connection
                    connection.Open();
                    //Check for size in Note field and insert temporarily or permanently into DB if it does not exist

                    if (NotesTextBox.Text.Length > 20)
                    {
                        sub = 20;
                    }
                    else
                    {
                        sub = NotesTextBox.Text.Length;
                    }
                    string sqlStatement = "If Not Exists (select 1 from Student where FirstName= @FirstName and LastName= @LastName) Insert into Student (FirstName, LastName, Age, Notes, TshirtID, SchoolID, TeacherID) values(@FirstName, @LastName, '" + StudentAgeList.SelectedValue + "', @Notes, " +
                           "(SELECT  TshirtID FROM[Lab1].[dbo].Tshirt where Size = '" + TshirtList.SelectedValue + "' and Color = '" + TshirtColorList.SelectedValue + "'), '" + StudentSchoolDropDownList.SelectedValue + "', '" + StudentTeacherDropDownList.SelectedValue + "'); ";
                    cmd = new SqlCommand(sqlStatement, connection);
                    cmd.Parameters.AddWithValue("@FirstName", FirstNameTextBox.Text);
                    cmd.Parameters.AddWithValue("@LastName", LastNameTextBox.Text);
                    cmd.Parameters.AddWithValue("@Notes", NotesTextBox.Text.Substring(0, sub));

                    cmd.CommandType = CommandType.Text;
                    cmd.ExecuteNonQuery();
                    ResetButton_Click(sender, e);
                }
                //If it does not work
                catch (System.Data.SqlClient.SqlException ex)
                {
                    string msg = "Insert/Update Error:";
                    msg += ex.Message;
                    throw new Exception(msg);
                }
                finally
                {
                    // close the Sql Connection
                    connection.Close();
                }
            }
            //Failure alternatives
            else if (dup == true)
            {
                MessageBox.Show("Try Again", "Duplicate");
            }
            else
            {
                MessageBox.Show("Oops", "All fields must be filled");
            }
        }
    }
}