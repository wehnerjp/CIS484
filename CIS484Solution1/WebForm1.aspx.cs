using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Windows.Forms;

namespace CIS484Solution1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public static DateTime EventDateRequest;
        private System.Data.DataTable submissionDataTable = new System.Data.DataTable();
        public static int count = 1;

        public static int CoordinatorID = 1;
        //public static Button addEvent = new Button();

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
            PopulateSequence();
        }

        protected void PopulateSequence()
        {
            submissionDataTable.Clear();
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
        }

        private void AddRowsToGrid()
        {
            //Queries Relevant to home page, fetching event info student info and more
            String sqlQuery = "Select * from ContactRequest";

            //Get connection string from web.config file
            string strcon = ConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString;
            //create new sqlconnection and connection to database by using connection string from web.config file
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, con);
            int count = 1;
            using (SqlCommand command = new SqlCommand(sqlQuery, con))
            {
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        //TableCell btnCell = new TableCell();
                        //TableCell btnCell2 = new TableCell();

                        //Button addEvent = new Button();
                        //addEvent.ID = "AddEvent" + count;
                        //addEvent.Text = "Add";
                        ////addEvent.OnClientClick();
                        //btnCell.Controls.Add(addEvent);
                        //Button deleteEvent = new Button();
                        //deleteEvent.ID = "DeleteEvent" + count;
                        //deleteEvent.Text = "Delete";
                        ////deleteEvent.OnClientClick();
                        //btnCell2.Controls.Add(deleteEvent);

                        //count++;
                        submissionDataTable.Rows.Add(reader[1], reader[2], reader[3], reader[4], reader[5], reader[6], reader[7]);
                    }
                }
            }
        }

        //protected void GridView_RowDataBound(object sender,
        //    System.Web.UI.WebControls.GridViewRowEventArgs e)
        //{
        //    Button addEvent = new Button();
        //    addEvent.CssClass = "btn btn-primary";
        //    addEvent.ID = "AddEvent" + count;
        //    addEvent.Text = "Add";
        //    addEvent.CausesValidation = false;
        //    addEvent.UseSubmitBehavior = false;
        //    addEvent.Click += new EventHandler(addEvent_Click);
        //    e.Row.Cells[7].Controls.Add(addEvent);
        //    Button deleteEvent = new Button();
        //    deleteEvent.ID = "DeleteEvent" + count;
        //    deleteEvent.Text = "Delete";
        //    //deleteEvent.OnClientClick();
        //    e.Row.Cells[8].Controls.Add(deleteEvent);
        //    count++;
        //}

        protected void addEvent_Click(object sender, EventArgs e)
        {
            string OrgName = "";
            string OrgType = "";
            string EventName = "";
            string ContactName = "";
            string Phone = "";
            string Email = "";
            string RequestID = "";
            string EventID = "";
            DateTime Date1 = new DateTime();
            AccessCode contact = new AccessCode();
            string code = contact.GenerateCode(true, true, true, true, 8);
            MessageBox.Show(code);
            //Inserting teacher query
            //Get connection string from web.config file
            string strcon = ConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString;
            //Inserting teacher query

            //Get connection string from web.config file
            //create new sqlconnection and connection to database by using connection string from web.config file
            SqlConnection con = new SqlConnection(strcon);
            String sqlQuery4 = "Select * from ContactRequest where RequestID = '" + RequestListDDL.SelectedValue + "'";
            SqlCommand cmd4 = new SqlCommand(sqlQuery4, con);

            con.Open();
            try
            {
                SqlDataReader reader = cmd4.ExecuteReader();

                while (reader.Read())
                {
                    RequestID = reader[0].ToString();
                    ContactName = reader[1].ToString();
                    Phone = reader[2].ToString();
                    Email = reader[3].ToString();
                    OrgName = reader[4].ToString();
                    OrgType = reader[5].ToString();
                    Date1 = Convert.ToDateTime(reader[6]);

                    EventName = reader[7].ToString();
                }
                reader.Close();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Select Error in ContactRequest:";
                msg += ex.Message;
                throw new Exception(msg);
            }

            String sqlQuery = "Insert into AccessCode (Code, UserType, CoordinatorID) values (@Code, @UserType, @CoordinatorID)";
            String sqlQuery6 = "Insert into EventContact (ContactCode) values (@Code)";

            SqlCommand cmd = new SqlCommand(sqlQuery, con);
            cmd.Parameters.Add(new SqlParameter("@Code", code));
            cmd.Parameters.Add(new SqlParameter("@UserType", "Contact"));
            cmd.Parameters.Add(new SqlParameter("@CoordinatorID", CoordinatorID));

            SqlCommand cmd6 = new SqlCommand(sqlQuery6, con);
            cmd6.Parameters.Add(new SqlParameter("@Code", code));

            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert/Update Error Insert into AccessCode:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            try
            {
                cmd6.CommandType = CommandType.Text;
                cmd6.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert/Update Error Insert into EventContact 1:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            String sqlQuery2 = "  Insert into Organization (Name, Type, ContactCode) values " +
                               "(@OrgName, @OrgType, @ContactCode);";
            SqlCommand cmd2 = new SqlCommand(sqlQuery2, con);
            cmd2.Parameters.Add(new SqlParameter("@OrgName", OrgName));
            cmd2.Parameters.Add(new SqlParameter("@ContactCode", code));
            cmd2.Parameters.Add(new SqlParameter("@OrgType", OrgType));

            try
            {
                cmd2.CommandType = CommandType.Text;
                cmd2.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert/Update Error Insert into Org:";
                msg += ex.Message;
                throw new Exception(msg);
            }

            String sqlQuery3 = "  Insert into Event (Date, Name) values " +
                               "('" + Date1.ToString("yyyy-MM-dd") + "', @EventName);";
            SqlCommand cmd3 = new SqlCommand(sqlQuery3, con);
            cmd3.Parameters.Add(new SqlParameter("@EventName", EventName));
            cmd3.Parameters.Add(new SqlParameter("@Date", Date1));

            try
            {
                cmd3.CommandType = CommandType.Text;
                cmd3.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert/Update Error Insert into Event:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            //UPDATE table_name
            //SET column1 = value1, column2 = value2, ...
            //WHERE condition;
            String sqlQuery1 = "  Update  EventContact Set Name = @ContactName, OrganizationID =(select OrganizationID from Organization where Name=@OrgName), Phone = @Phone, Email = @Email, EventID=(select EventID from Event where Name=@EventName)" +
                               " where ContactCode = @ContactCode;";
            SqlCommand cmd1 = new SqlCommand(sqlQuery1, con);
            cmd1.Parameters.Add(new SqlParameter("@Email", Email));
            cmd1.Parameters.Add(new SqlParameter("@ContactCode", code));
            cmd1.Parameters.Add(new SqlParameter("@ContactName", ContactName));
            cmd1.Parameters.Add(new SqlParameter("@OrgName", OrgName));
            cmd1.Parameters.Add(new SqlParameter("@Phone", Phone));
            cmd1.Parameters.Add(new SqlParameter("@EventName", EventName));

            try
            {
                cmd1.CommandType = CommandType.Text;
                cmd1.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert/Update Error in EventContact:";
                msg += ex.Message;
                throw new Exception(msg);
            }

            String sqlQuery5 = " Delete from ContactRequest where RequestID = '" + RequestID + "'";
            SqlCommand cmd5 = new SqlCommand(sqlQuery5, con);

            try
            {
                cmd5.CommandType = CommandType.Text;
                cmd5.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Delete Error in ContactRequest:";
                msg += ex.Message;
                throw new Exception(msg);
            }

            con.Close();
            PopulateSequence();
            RequestListDDLUpdate.Update();
        }

        //protected void studentAccesCode()
        //{
        //    try
        //    {
        //        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        //        sc.ConnectionString = @"Server=LOCALHOST;Database=AUTH;Trusted_Connection=Yes;";

        //        sc.Open();
        //        System.Data.SqlClient.SqlCommand findPass = new System.Data.SqlClient.SqlCommand();
        //        findPass.Connection = sc;
        //        findPass.CommandText = "select ACCESSCODE from ACCESS where code = @Code";
        //        findPass.Parameters.Add(new SqlParameter("@Code", txtAccessCodeEntry.Text));

        //        SqlDataReader reader = findPass.ExecuteReader();

        //        if (reader.HasRows)
        //        {
        //            while (reader.Read())
        //            {
        //                string tempAccessCode = reader["accessCode"].ToString();
        //                Session["ACCESSCODE"] = txtAccessCodeEntry.Text;
        //                string accessCode = txtAccessCodeEntry.Text;

        //                if (Session["ACCESSCODE"].ToString() == tempAccessCode)
        //                {
        //                    Session.Add("ACCESSCODE", accessCode);
        //                    lblAccessCodeStatus.Text = "Session variable saved";
        //                }
        //                // else
        //                //StudentExistingPlaceholder.Visible = true;
        //            }
        //        }
        //        else // if the accesscode doesn't exist, it will show failure
        //            sc.Close();
        //    }
        //    catch
        //    {
        //        lblAccessCode.Text = "Accesscode doesn't exist!.";
        //    }
        //}

        //protected void accessCodeLink_Click(object sender, EventArgs e)
        //{
        //    studentAccesCode();
        //}

        protected void btnAccessCodeEntry_Click(object sender, EventArgs e)
        {
            try
            {
                div1.Visible = false;
                div2.Visible = false;
                string code = HttpUtility.HtmlEncode(txtAccessCodeEntry.Text);
                string type = "";
                SqlConnection dbConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString);
                dbConnection.Open();
                SqlCommand loginCommand = new SqlCommand();
                loginCommand.Connection = dbConnection;
                loginCommand.CommandText = "Select * from AccessCode where Code = @Code";
                loginCommand.Parameters.Add(new SqlParameter("@Code", code));
                loginCommand.Parameters.Add(new SqlParameter("@UserType", type));
                SqlDataReader reader = loginCommand.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        type = reader[1].ToString();
                        if (type.Equals("Instructor"))
                        {
                            div2.Visible = true;
                            lblAccessCode.Text = "Yay Instructor";
                            string qry1 = "Select * from Instructor where InstructorCode ='" + code + "'";
                            string qry2 = "Select * from Cluster where InstructorCode ='" + code + "'";
                            string qry3 = "Select * from Event inner join EventContact on EventContact.EventID = Event.EventID inner join Instructor on Instructor.ContactCode = EventContact.ContactCode where InstructorCode ='" + code + "'";
                            SqlConnection aa = new SqlConnection(WebConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString);
                            aa.Open();
                            SqlCommand instCom = new SqlCommand(qry1, aa);
                            SqlDataReader instReader = instCom.ExecuteReader();
                            while (instReader.Read())
                            {
                                lblInstructorName.Text = (HttpUtility.HtmlEncode(instReader[1].ToString()));
                            }
                            SqlConnection bb = new SqlConnection(WebConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString);
                            bb.Open();
                            SqlCommand ClusterCom = new SqlCommand(qry2, bb);
                            SqlDataReader ClusterReader = ClusterCom.ExecuteReader();
                            while (ClusterReader.Read())
                            {
                                lblInstructorClusterAccessCode.Text = (HttpUtility.HtmlEncode(ClusterReader[0].ToString()));
                            }
                            SqlConnection cc = new SqlConnection(WebConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString);
                            cc.Open();
                            SqlCommand EventCom = new SqlCommand(qry3, cc);
                            SqlDataReader EventReader = EventCom.ExecuteReader();
                            while (EventReader.Read())
                            {
                                lblInstructorEvent.Text = (HttpUtility.HtmlEncode(EventReader[2].ToString()));
                                lblInstructorDate.Text = (HttpUtility.HtmlEncode(EventReader[1].ToString()));
                            }
                        }
                        else if (type.Equals("Volunteer"))
                        {
                            div1.Visible = true;
                            lblAccessCode.Text = "Yay Volunteer";
                            string qry1 = "Select * from Event inner join EventVolunteers on EventVolunteers.EventID = Event.EventID where EventVolunteers.VolunteerCode ='" + code + "'";
                            string qry2 = "Select * from Coordinator inner join AccessCode on AccessCode.CoordinatorID = Coordinator.CoordinatorID where AccessCode.Code ='" + code + "'";
                            string qry3 = "Select * from Volunteer where Volunteer.VolunteerCode ='" + code + "'";
                            SqlConnection dd = new SqlConnection(WebConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString);
                            dd.Open();
                            SqlCommand EvCom = new SqlCommand(qry1, dd);
                            SqlDataReader EvReader = EvCom.ExecuteReader();
                            while (EvReader.Read())
                            {
                                lblName.Text = (HttpUtility.HtmlEncode(EvReader[2].ToString()));
                                lblDate.Text = (HttpUtility.HtmlEncode(EvReader[1].ToString()));
                                lblEventDate2.Text = (HttpUtility.HtmlEncode(EvReader[1].ToString()));
                            }
                            SqlConnection ee = new SqlConnection(WebConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString);
                            ee.Open();
                            SqlCommand CoCom = new SqlCommand(qry2, ee);
                            SqlDataReader CoReader = CoCom.ExecuteReader();
                            while (CoReader.Read())
                            {
                                lblCoordinatorName.Text = (HttpUtility.HtmlEncode(CoReader[1].ToString()));
                            }
                            SqlConnection ff = new SqlConnection(WebConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString);
                            ff.Open();
                            SqlCommand VolCom = new SqlCommand(qry3, ff);
                            SqlDataReader VolReader = VolCom.ExecuteReader();
                            while (VolReader.Read())
                            {
                                lblName2.Text = (HttpUtility.HtmlEncode(VolReader[1].ToString()));
                                lblRole.Text = (HttpUtility.HtmlEncode(VolReader[2].ToString()));
                                lblID.Text = (HttpUtility.HtmlEncode(VolReader[3].ToString()));
                                lblVolunteerP.Text = (HttpUtility.HtmlEncode(VolReader[4].ToString()));
                                lblVolunteerEmail.Text = (HttpUtility.HtmlEncode(VolReader[5].ToString()));
                                lblVolunteerName.Text = (HttpUtility.HtmlEncode(VolReader[1].ToString()));
                            }
                        }
                        else if (type.Equals("EventContact"))
                        {
                            lblAccessCodeStatus.Text = "Yay EventContact";
                        }
                        else if (type.Equals("Student"))
                        {
                            lblAccessCodeStatus.Text = "Yay Student";
                        }
                        else
                        {
                            lblAccessCode.Text = "Wrong";
                        }
                    }
                }
            }
            catch
            {
                lblAccessCodeStatus.Text = "Accesscode doesn't exist!.";
            }
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

            PopulateSequence();
            RequestListDDLUpdate.Update();
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
            //MessageBox.Show(EventDateRequest.Date.ToShortDateString());
        }

        protected void DeleteEvent_OnClickEvent_Click(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString;
            //Inserting teacher query

            //Get connection string from web.config file
            //create new sqlconnection and connection to database by using connection string from web.config file
            SqlConnection con = new SqlConnection(strcon);

            con.Open();
            String sqlQuery = " Delete from ContactRequest where RequestID = '" + RequestListDDL.SelectedValue + "'";
            SqlCommand cmd = new SqlCommand(sqlQuery, con);

            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Delete Error in ContactRequest:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            PopulateSequence();
            RequestListDDLUpdate.Update();
        }

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
            UsernameTextBox.Text = HttpUtility.HtmlEncode(CoordinatorNameText.Text);
            EmailTextBox.Text = HttpUtility.HtmlEncode(UsernameTextBox.Text) + "@edu.com";
            modalLRInput13.Text = "";
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