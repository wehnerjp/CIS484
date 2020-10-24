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
using System.Globalization;
using System.Windows.Forms;
using System.Web.Services;
using Button = System.Web.UI.WebControls.Button;

namespace CIS484Solution1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public static DateTime EventDateRequest;
        private System.Data.DataTable submissionDataTable = new System.Data.DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            //ScriptManager.RegisterStartupScript(
            //    UpdatePanel1,
            //    this.GetType(),
            //    "MyAction",
            //    "$(document).ready(function() { $('.js-example-basic-single').select2(); });",
            //    true);
            ScriptManager.RegisterStartupScript(
                UpdatePanel2,
                this.GetType(),
                "MyAction",
                "$(document).ready(function() { $('.js-example-basic-single').select2();  $('.grid').masonry({ itemSelector: '.grid-item', columnWidth: 160,  gutter: 20   }); $(document).ready(function () {$('#manBt').click(function() {$('#manPan1').slideToggle('slow');});});});",
                true);
            CreateGrid();
            AddRowsToGrid();

            // NOW BIND THE GRIDVIEW WITH THE DATATABLE.
            ContactSubmissionGrid.DataSource = submissionDataTable;
            ContactSubmissionGrid.DataBind();
        }

        private void CreateGrid()
        {
            // CREATE A GRID FOR DISPLAYING A LIST OF BOOKS.

            System.Data.DataColumn tColumn = null;
            // TABLE COLUMNS.

            tColumn = new System.Data.DataColumn("Name", Type.GetType("System.String"));
            submissionDataTable.Columns.Add(tColumn);
            tColumn = new System.Data.DataColumn("Phone", System.Type.GetType("System.String"));
            submissionDataTable.Columns.Add(tColumn);
            tColumn = new System.Data.DataColumn("Email", System.Type.GetType("System.String"));
            submissionDataTable.Columns.Add(tColumn);
            tColumn = new System.Data.DataColumn("Org Name", System.Type.GetType("System.String"));
            submissionDataTable.Columns.Add(tColumn);
            tColumn = new System.Data.DataColumn("Org Type", System.Type.GetType("System.String"));
            submissionDataTable.Columns.Add(tColumn);
            tColumn = new System.Data.DataColumn("Date Request", System.Type.GetType("System.String"));
            submissionDataTable.Columns.Add(tColumn);
            tColumn = new System.Data.DataColumn("Event Name", System.Type.GetType("System.String"));
            submissionDataTable.Columns.Add(tColumn);
            tColumn = new System.Data.DataColumn("Add", System.Type.GetType("System.String"));
            submissionDataTable.Columns.Add(tColumn);
            tColumn = new System.Data.DataColumn("Delete", System.Type.GetType("System.String"));
            submissionDataTable.Columns.Add(tColumn);
            tColumn = new System.Data.DataColumn("Contact Code", System.Type.GetType("System.String"));

            submissionDataTable.Columns.Add(tColumn);
        }

        private void AddRowsToGrid()
        {
            //Queries Relevant to home page, fetching event info student info and more
            String sqlQuery = "Select * from Event";

            //Get connection string from web.config file
            string strcon = ConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString;
            //create new sqlconnection and connection to database by using connection string from web.config file
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, con);

            using (SqlCommand command = new SqlCommand(sqlQuery, con))
            {
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        //Read info into List
                        submissionDataTable.Rows.Add(reader.GetString(0));
                    }
                }
            }
        }

        protected void GridView_RowDataBound(object sender,
            System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            int count = 1;
            foreach (GridViewRow row in submissionDataTable.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    // ADD LINK BUTTON IF PRICE >= $80

                    Button addEvent = new Button();
                    addEvent.ID = "AddEvent" + count;
                    addEvent.Text = "Add";
                    //addEvent.OnClientClick();
                    row.Cells[7].Controls.Add(addEvent);
                    Button deleteEvent = new Button();
                    deleteEvent.ID = "AddEvent" + count;
                    deleteEvent.Text = "Add";
                    //deleteEvent.OnClientClick();
                    row.Cells[8].Controls.Add(deleteEvent);
                }
            }
        }

        protected void studentAccesCode()
        {
            try
            {
                System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
                sc.ConnectionString = @"Server=LOCALHOST;Database=AUTH;Trusted_Connection=Yes;";

                sc.Open();
                System.Data.SqlClient.SqlCommand findPass = new System.Data.SqlClient.SqlCommand();
                findPass.Connection = sc;
                findPass.CommandText = "select ACCESSCODE from ACCESS where code = @Code";
                findPass.Parameters.Add(new SqlParameter("@Code", txtAccessCodeEntry.Text));

                SqlDataReader reader = findPass.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        string tempAccessCode = reader["accessCode"].ToString();
                        Session["ACCESSCODE"] = txtAccessCodeEntry.Text;
                        string accessCode = txtAccessCodeEntry.Text;

                        if (Session["ACCESSCODE"].ToString() == tempAccessCode)
                        {
                            Session.Add("ACCESSCODE", accessCode);
                            lblAccessCodeStatus.Text = "Session variable saved";
                        }
                        // else
                        //StudentExistingPlaceholder.Visible = true;
                    }
                }
                else // if the accesscode doesn't exist, it will show failure
                    sc.Close();
            }
            catch
            {
                lblAccessCode.Text = "Accesscode doesn't exist!.";
            }
        }

        protected void accessCodeLink_Click(object sender, EventArgs e)
        {
            studentAccesCode();
        }

        protected void btnAccessCodeEntry_Click(object sender, EventArgs e)
        {
            studentAccesCode();
        }

        protected void AddRequest_Click(object sender, EventArgs e)
        {
            Boolean dup = false;

            if (dup == false && ContactRequestNameText.Text != "" && ContactRequestPhoneText.Text != "" && OrganizationTypeList.SelectedIndex > -1 && ContactRequestEmailText.Text != "")
            {
                //If filled out and non duplicate it inserts into object
                string strcon = ConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString;
                SqlConnection connection = new SqlConnection(strcon);
                SqlCommand cmd;
                int sub;
                try
                {
                    // open the Sql connection
                    connection.Open();
                    //Check for size in Note field and insert temporarily or permanently into DB if it does not exist
                    string sqlStatement =
                        "If Not Exists (select 1 from ContactRequest where ContactName= @ContactName and OrganizationName= @OrganizationName) " +
                        "Insert into ContactRequest (ContactName, Phone, Email, OrganizationName, OrganizationType, EventNameRequest, DateRequest) " +
                        "values(@ContactName, @Phone, @Email, @OrganizationName, @OrganizationType, @EventNameRequest, @DateRequest)";
                    String strDateFormat = "yyyy-MM-dd";
                    string x = EventDateRequest.ToString("yyyy-MM-dd");
                    cmd = new SqlCommand(sqlStatement, connection);
                    cmd.Parameters.AddWithValue("@ContactName", ContactRequestNameText.Text);
                    cmd.Parameters.AddWithValue("@OrganizationName", ContactRequestOrganizationNameText.Text);
                    cmd.Parameters.AddWithValue("@OrganizationType", OrganizationTypeList.SelectedValue.ToString());
                    DateTime to = DateTime.ParseExact(x, strDateFormat, CultureInfo.InvariantCulture);
                    cmd.Parameters.AddWithValue("@DateRequest", to);

                    cmd.Parameters.AddWithValue("@Phone", ContactRequestPhoneText.Text);
                    cmd.Parameters.AddWithValue("@Email", ContactRequestEmailText.Text);
                    cmd.Parameters.AddWithValue("@EventNameRequest", EventNameRequest.Text);

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

        protected void ResetButton_Click(object sender, EventArgs eventArgs)
        {
            ContactRequestNameText.Text = string.Empty;
            ContactRequestOrganizationNameText.Text = string.Empty;
            OrganizationTypeList.SelectedIndex = 0;
            ContactRequestPhoneText.Text = string.Empty;
            ContactRequestEmailText.Text = string.Empty;
            EventNameRequest.Text = string.Empty;
        }

        protected void EventRequestDate_SelectionChanged(object sender, EventArgs e)
        {
            EventDateRequest = EventRequestDate.SelectedDate;
            MessageBox.Show(EventDateRequest.Date.ToShortDateString());
        }
    }
}