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
        protected void SubmitCoordinator_Click(object sender, EventArgs e)
        {
            //Inserting teacher query
            //Get connection string from web.config file
            string ct = ConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString;
            SqlConnection con = new SqlConnection(ct);

            //Inserting Coordinator query

            String sqlQuery1 = "Insert into CoordinatorAuth (CoordinatorID, Username, Password) values ((select CoordinatorID from Coordinator where CoordinatorID = (select Max(CoordinatorID) from Coordinator)), @Username, @Password)";
            //Get connection string from web.config file
            //create new sqlconnection and connection to database by using connection string from web.config file
            SqlCommand cmd = new SqlCommand(sqlQuery1, con);
            cmd.Parameters.Add(new SqlParameter("@Username", UsernameTextBox.Text));
            cmd.Parameters.Add(new SqlParameter("@Password", PasswordHash.HashPassword(modalLRInput13.Text)));

            String sqlQuery = "Insert into Coordinator (Name, Email, Phone) values (@Name, @Email, @Phone);";
            SqlCommand command = new SqlCommand(sqlQuery, con);
            command.Parameters.Add(new SqlParameter("@Name", CoordinatorNameText.Text));
            command.Parameters.Add(new SqlParameter("@Email", EmailTextBox.Text));
            command.Parameters.Add(new SqlParameter("@Phone", PhoneTextBox.Text));
            con.Open(); 
            try
            {


                command.ExecuteNonQuery();

                //cmd.Parameters.Add(new SqlParameter("@Username", UsernameTextBox.Text));
                //cmd.Parameters.Add(new SqlParameter("@Password", PasswordHash.HashPassword(modalLRInput13.Text)));


                Console.Write("insert successful");
                    //MessageBox.Show("insert teacher success");

             }
                catch (SqlException ex)
                {
                    Console.Write(ex.Message);
                    lblStatus.Text = "Database Error";
                }
            try
            {


                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
                ResetCoordinator_Click(sender, e);
                //cmd.Parameters.Add(new SqlParameter("@Username", UsernameTextBox.Text));
                //cmd.Parameters.Add(new SqlParameter("@Password", PasswordHash.HashPassword(modalLRInput13.Text)));


                Console.Write("insert 2 successful");
                //MessageBox.Show("insert teacher success");
   
                ResetCoordinator_Click(sender, e);
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Inter CoordinatorAuth";
                msg += ex.Message;
                throw new Exception(msg);
            }
            con.Close();


                //con1.Close();

            }
        

            protected void PopulateCoordinator_Click(object sender, EventArgs e)
            {
                Random rnd = new Random();
                EmailTextBox.Text = HttpUtility.HtmlEncode(UsernameTextBox.Text) + "@edu.com";
                modalLRInput13.Text = "1111";
            }

            protected void ResetCoordinator_Click(object sender, EventArgs e)
            {
                //clear teacher input
                CoordinatorNameText.Text = string.Empty;
                EmailTextBox.Text = string.Empty;
                PhoneTextBox.Text = string.Empty;
                UsernameTextBox.Text = string.Empty;
                modalLRInput13.Text = string.Empty;
            }
        }
    }