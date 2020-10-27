using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Windows.Forms;
using System.Drawing;
using System.Web.UI.WebControls;

namespace CIS484Solution1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public static DateTime EventDateRequest;
        private System.Data.DataTable submissionDataTable = new System.Data.DataTable();
        public static int count = 1;
        public static AccessCode MasterAccessCode = new AccessCode();
        public static AccessCode MasterAccessCodeCluster = new AccessCode();
        public static int CoordinatorID = Site1.CoordinatorID;
        public static string contactCode = "";
        public static string instructorCode = "";
        public static string clusterCode = "";
        public static string clusterCode5 = "";
        public static string instructorCode5x = "";

        //public static Button addEvent = new Button();

        protected void Page_Load(object sender, EventArgs e)
        {
            //ScriptManager.RegisterStartupScript(
            //    UpdatePanel1,
            //    this.GetType(),
            //    "MyAction",
            //    "$(document).ready(function() { $('.js-example-basic-single').select2(); });",
            //    true);
            //ScriptManager.RegisterStartupScript(
            //    UpdatePanel2,
            //    this.GetType(),
            //    "MyAction",
            //    "$(document).ready(function() { $('.js-example-basic-single').select2();  $('.grid').masonry({ itemSelector: '.grid-item', columnWidth: 160,  gutter: 20   }); $(document).ready(function () {$('#manBt').click(function() {$('#manPan1').slideToggle('slow');});});});",
            //    true);
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

            tColumn = new System.Data.DataColumn("RequestID", Type.GetType("System.String"));
            submissionDataTable.Columns.Add(tColumn);
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
                        submissionDataTable.Rows.Add(reader[0], reader[1], reader[2], reader[3], reader[4], reader[5], reader[6], reader[7]);
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
            string RequestID = ContactSubmissionGrid.SelectedRow.Cells[0].Text;
            string OrgName = "";
            string OrgType = "";
            string EventName = "";
            string ContactName = "";
            string Phone = "";
            string Email = "";
            DateTime Date1 = new DateTime();
            AccessCode contact = new AccessCode();
            string code = contact.GenerateCode(true, true, true, true, 8);
            //MessageBox.Show(code);
            //Inserting teacher query
            //Get connection string from web.config file
            string strcon = ConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString;
            //Inserting teacher query

            //Get connection string from web.config file
            //create new sqlconnection and connection to database by using connection string from web.config file
            SqlConnection con = new SqlConnection(strcon);
            String sqlQuery4 = "Select * from ContactRequest where RequestID = '" + RequestID + "'";
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
            cmd.Parameters.Add(new SqlParameter("@UserType", "EventContact"));
            cmd.Parameters.Add(new SqlParameter("@CoordinatorID", Site1.CoordinatorID));

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

        protected void btnAccessCodeEntry_Click(object sender, EventArgs e)
        {
            VolDiv.Attributes.Add("style", "margin-top: 40px; display = none");
            VolDiv.Visible = false;
            InstDiv.Attributes.Add("style", "margin-top: 40px; display = none");
            InstDiv.Visible = false;
            StudentSignUpDiv.Attributes.Add("style", "margin-top: 40px; display = none");
            StudentSignUpDiv.Visible = false;
            AddInstDiv.Attributes.Add("style", "margin-top: 40px; display = none");
            AddInstDiv.Visible = false;
            StudentSignUpDiv.Attributes.Add("style", "margin-top: 40px; display = none");
            StudentSignUpDiv.Visible = false;

            string code = txtAccessCodeEntry.Text;
            string type = "";
            contactCode = code;
            instructorCode = code;
            clusterCode = code;
            SqlConnection dbConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString);
            dbConnection.Open();
            try
            {
                SqlCommand loginCommand = new SqlCommand();
                loginCommand.Connection = dbConnection;
                loginCommand.CommandText = "Select * from AccessCode where Code = @Code";
                loginCommand.Parameters.Add(new SqlParameter("@Code", code));
                //loginCommand.Parameters.Add(new SqlParameter("@UserType", type));
                SqlDataReader reader = loginCommand.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        type = reader[1].ToString();
                        if (type.Equals("Instructor"))
                        {
                            InstDiv.Attributes.Add("style", "margin-top: 40px; display = normal");
                            InstDiv.Visible = true;

                            lblAccessCodeStatus.Text = "Logged In As Instructor";
                            InstructorAccessCodeDataSource.SelectCommand = " SELECT [Name], [Email], [Phone] FROM [Instructor] Where Instructor.InstructorCode ='" + code + "'";
                            InstructorAccessCodeDataSource.DataBind();
                            InstructorAccessCodeDetailView.DataBind();
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
                            StudentDataSource.SelectCommand = "SELECT TOP (1000) [StudentCode], S.[Name], S.[InstructorCode], S.[Notes],S.[OrganizationID] FROM [Student] as S where S.InstructorCode ='" + txtAccessCodeEntry.Text + "'";
                            StudentDataSource.DataBind();
                            InstructorAccessCodeListView.DataBind();
                        }
                        else if (type.Equals("Volunteer"))
                        {
                            VolDiv.Attributes.Add("style", "margin-top: 40px; display = normal");
                            VolDiv.Visible = true;
                            lblAccessCodeStatus.Text = "Logged In As Volunteer";
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
                            }
                        }
                        else if (type.Equals("EventContact"))
                        {
                            AddInstDiv.Attributes.Add("style", "margin-top: 40px; display = normal");
                            AddInstDiv.Visible = true;
                            lblAccessCodeStatus.Text = "Logged in as Event Contact";
                            string EventinfoQry = "Select * from Organization inner join EventContact on EventContact.OrganizationID = Organization.OrganizationID where EventContact.ContactCode ='" + code + "'";
                            SqlConnection otherCon = new SqlConnection(ConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString);
                            otherCon.Open();
                            SqlCommand bigCommand = new SqlCommand(EventinfoQry, otherCon);
                            SqlDataReader OrgReader = bigCommand.ExecuteReader();
                            while (OrgReader.Read())
                            {
                                DisplaySchool.Text = (HttpUtility.HtmlEncode(OrgReader[1].ToString()));
                            }

                            sqlsrcInstructor.SelectCommand =
                            "SELECT TOP (1000) INSTRUCTOR.NAME, INSTRUCTOR.EMAIL, INSTRUCTOR.PHONE, INSTRUCTOR.INSTRUCTORCODE, CLUSTER.CLUSTERCODE FROM INSTRUCTOR " +
                            "INNER JOIN CLUSTER ON INSTRUCTOR.INSTRUCTORCODE = CLUSTER.INSTRUCTORCODE " +
                            "WHERE  INSTRUCTOR.CONTACTCODE ='" + code + "'";
                            sqlsrcInstructor.DataBind();
                            Instructor_GridView.DataBind();
                        }
                        else if (type.Equals("Cluster"))
                        {
                            StudentSignUpDiv.Attributes.Add("style", "margin-top: 40px; display = normal");
                            StudentSignUpDiv.Visible = true;
                            lblAccessCodeStatus.Text = "Logged in as Student. Please Create Your Student Profile!";
                            string EventinfoQry = "Select * from Organization inner join Cluster on Cluster.OrganizationID = Organization.OrganizationID where Cluster.ClusterCode ='" + clusterCode + "'";

                            SqlConnection newcon = new SqlConnection(ConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString);
                            newcon.Open();
                            SqlCommand nameCommand = new SqlCommand(EventinfoQry, newcon);
                            SqlDataReader OrgReader = nameCommand.ExecuteReader();
                            while (OrgReader.Read())
                            {
                                Label10.Text = (HttpUtility.HtmlEncode(OrgReader[1].ToString()));
                            }
                        }
                        else if (type.Equals("Student"))
                        {
                            StudentPageDiv.Attributes.Add("style", "margin-top: 40px; display = normal");
                            StudentPageDiv.Visible = true;
                            lblAccessCodeStatus.Text = "Logged into Student";
                            string sqlQuery_StudentInfo = "SELECT * FROM STUDENT WHERE StudentCode = '" + code + "'";
                            SqlConnection sqlconnect = new SqlConnection(ConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString);
                            sqlconnect.Open();
                            SqlCommand StudentStuff = new SqlCommand(sqlQuery_StudentInfo, sqlconnect);
                            SqlDataReader studentReader = StudentStuff.ExecuteReader();
                            while (studentReader.Read())
                            {
                                Student_lblStudentCode.Text = (HttpUtility.HtmlEncode(studentReader[0].ToString()));
                                Student_tbStudentName.Text = (HttpUtility.HtmlEncode(studentReader[1].ToString()));
                                Student_tbStudentNotes.Text = (HttpUtility.HtmlEncode(studentReader[3].ToString()));
                            }

                            string qury2 = "SELECT Instructor.Name FROM Instructor inner join Student on Student.OrganizationID = Instructor.OrganizationID where Student.StudentCode = '" + code + "'";
                            SqlConnection sqlconnect2 = new SqlConnection(ConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString);
                            sqlconnect2.Open();
                            SqlCommand SInstStuff = new SqlCommand(qury2, sqlconnect2);
                            SqlDataReader SInstReader = SInstStuff.ExecuteReader();
                            while (SInstReader.Read())
                            {
                                Student_lblInstructorName.Text = (HttpUtility.HtmlEncode(SInstReader[0].ToString()));
                            }

                            string sqlQueryFindOrganizationName = "SELECT Organization.Name FROM Organization inner join Student on Student.OrganizationID = Organization.OrganizationID where Student.StudentCode = '" + code + "'";
                            SqlConnection sqlconnect3 = new SqlConnection(ConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString);
                            sqlconnect3.Open();
                            SqlCommand OrgName = new SqlCommand(sqlQueryFindOrganizationName, sqlconnect3);
                            SqlDataReader OrgNameReader = OrgName.ExecuteReader();
                            while (OrgNameReader.Read())
                            {
                                Student_lblOrganizationName.Text = (HttpUtility.HtmlEncode(OrgNameReader[0].ToString()));
                            }

                            string studentEventQuery = "Select Event.EventID, Event.Name, Event.Date, Event.Room from Event inner join EventContact on EventContact.EventID = Event.EventID inner join Instructor on Instructor.ContactCode = EventContact.ContactCode inner join Student on Student.InstructorCode = Instructor.InstructorCode where Student.StudentCode ='" + code + "'";
                            sqlsrcStudentEvent.SelectCommand = studentEventQuery;
                            sqlsrcStudentEvent.DataBind();
                            StudentEvent_GridView.DataBind();
                        }
                    }
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert/Update Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                dbConnection.Close();
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
            string RequestID = ContactSubmissionGrid.SelectedRow.Cells[0].Text;

            string strcon = ConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString;
            //Inserting teacher query

            //Get connection string from web.config file
            //create new sqlconnection and connection to database by using connection string from web.config file
            SqlConnection con = new SqlConnection(strcon);

            con.Open();
            String sqlQuery = " Delete from ContactRequest where RequestID = '" + RequestID + "'";
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

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            // Generate Cluster and Instructor Codes
            instructorCode5x = MasterAccessCode.GenerateCode(lowercase: true, uppercase: true, numbers: true, otherChar: true, codeSize: 8);
            AccessCode newAccessxx = new AccessCode();
            instructorCode5x = "349843";
            instructorCode5x += "v";
            //string instructorCode = "";
            //instructorCode = MasterAccessCode.GenerateCode(lowercase: true, uppercase: true, numbers: true, otherChar: true, codeSize: 8);
            //MessageBox.Show(instructorCode.ToString(), "Code 2 for instructor: ");

            SqlConnection sqlconnect = new SqlConnection(ConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString);
            sqlconnect.Open();

            // Necessary information for insert statements
            string eventID = "";
            string orgID = "";

            // Find necessary information
            string sqlQuery2 = "SELECT EventID, ContactCode, OrganizationID FROM EVENTCONTACT WHERE CONTACTCODE = '" + contactCode + "'";
            SqlCommand cmd100 = new SqlCommand(sqlQuery2, sqlconnect);

            try
            {
                SqlDataReader reader = cmd100.ExecuteReader();

                while (reader.Read())
                {
                    eventID = reader[0].ToString();
                    orgID = reader[2].ToString();
                }
                reader.Close();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Select Error in EventContact";
                msg += ex.Message;
                throw new Exception(msg);
            }

            // INSERT SQL Statements
            InsertClusterCode();
            // Insert - Access Part 1
            String sqlQuery_p1 = "INSERT INTO ACCESSCODE(Code, UserType) VALUES (@Code, @UserType)";
            SqlCommand cmd_p1 = new SqlCommand(sqlQuery_p1, sqlconnect);
            cmd_p1.Parameters.Add(new SqlParameter("@Code", instructorCode5x));
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
            cmd_p2.Parameters.Add(new SqlParameter("@ClusterCode", clusterCode5));

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
            cmd101.Parameters.Add(new SqlParameter("@InstructorCode", instructorCode5x));
            cmd101.Parameters.Add(new SqlParameter("@Name", Instructor_tbFirstName.Text + ' ' + Instructor_tbLastName.Text));
            cmd101.Parameters.Add(new SqlParameter("@OrganizationID", orgID));
            cmd101.Parameters.Add(new SqlParameter("@Email", Instructor_tbEmail.Text));
            cmd101.Parameters.Add(new SqlParameter("@Phone", int.Parse(Instructor_tbPhone.Text)));
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
            cmd103.Parameters.Add(new SqlParameter("@InstructorCode", instructorCode5x));
            cmd103.Parameters.Add(new SqlParameter("@OrganizationID", orgID));
            cmd103.Parameters.Add(new SqlParameter("@ClusterCode", clusterCode5));
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
            sqlsrcInstructor.SelectCommand =
               "SELECT TOP (1000) INSTRUCTOR.NAME, INSTRUCTOR.EMAIL, INSTRUCTOR.PHONE, INSTRUCTOR.INSTRUCTORCODE, CLUSTER.CLUSTERCODE FROM INSTRUCTOR " +
               "INNER JOIN CLUSTER ON INSTRUCTOR.INSTRUCTORCODE = CLUSTER.INSTRUCTORCODE " +
               "WHERE  INSTRUCTOR.CONTACTCODE ='" + contactCode + "'";

            sqlsrcInstructor.DataBind();
            Instructor_GridView.DataBind();
            sqlconnect.Close();
        }

        protected void InsertClusterCode()
        {
            SqlConnection sqlconnect = new SqlConnection(ConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString);
            sqlconnect.Open();
            clusterCode5 = MasterAccessCode.GenerateCode(lowercase: true, uppercase: true, numbers: true, otherChar: true, codeSize: 8);
            String sqlqryyy = "INSERT INTO ACCESSCODE(Code, UserType) VALUES (@Code, @UserType)";
            SqlCommand cmd_p11 = new SqlCommand(sqlqryyy, sqlconnect);
            cmd_p11.Parameters.Add(new SqlParameter("@Code", clusterCode5));
            cmd_p11.Parameters.Add(new SqlParameter("@UserType", "Cluster"));
            try
            {
                cmd_p11.CommandType = CommandType.Text;
                cmd_p11.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert Error into AccessCode";
                msg += ex.Message;
                throw new Exception(msg);
            }
            sqlconnect.Close();
        }

        protected void Instructor_ResetButton_Click(object sender, EventArgs e)
        {
            Instructor_tbEmail.Text = string.Empty;
            Instructor_tbFirstName.Text = string.Empty;
            Instructor_tbLastName.Text = string.Empty;
            Instructor_tbPhone.Text = string.Empty;
        }

        protected void btnStudentSignUp_Click(object sender, EventArgs e)
        {
            // Generate Cluster and Instructor Codes
            string studentCode = "";
            studentCode = MasterAccessCode.GenerateCode(lowercase: true, uppercase: true, numbers: true, otherChar: true, codeSize: 8);
            lblStudentAccessCodeinput.Text = studentCode;

            SqlConnection sqlconnect = new SqlConnection(ConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString);
            sqlconnect.Open();

            // Find necessary information
            string sqlQuery101 = "SELECT InstructorCode, OrganizationID FROM Cluster WHERE ClusterCode = '" + clusterCode + "'";
            SqlCommand cmd101 = new SqlCommand(sqlQuery101, sqlconnect);
            string Int_Code = "";
            string orgID = "";

            try
            {
                SqlDataReader reader = cmd101.ExecuteReader();

                while (reader.Read())
                {
                    Int_Code = reader[0].ToString();
                    orgID = reader[1].ToString();
                }
                reader.Close();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Select Error in EventContact";
                msg += ex.Message;
                throw new Exception(msg);
            }

            // Insert Student Access Code into AccessCode Table
            String sqlQuery = "INSERT INTO ACCESSCODE(Code, UserType) VALUES (@Code, @UserType)";
            SqlCommand cmd = new SqlCommand(sqlQuery, sqlconnect);
            cmd.Parameters.Add(new SqlParameter("@Code", studentCode));
            cmd.Parameters.Add(new SqlParameter("@UserType", "Student"));
            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert Error into AccessCode";
                msg += ex.Message;
                throw new Exception(msg);
            }

            //// Insert - Student
            //String sqlQuery2 = "INSERT INTO STUDENT(StudentCode, Name, InstructorCode, Notes)" +
            //    "VALUES (@StudentCode, @Name, @InstructorCode, @Notes)";
            //SqlCommand cmd2 = new SqlCommand(sqlQuery2, sqlconnect);
            //cmd2.Parameters.Add(new SqlParameter("@StudentCode", studentCode));
            //cmd2.Parameters.Add(new SqlParameter("@Name", Student_tbFirstName.Text + ' ' + Student_tbLastName.Text));
            //cmd2.Parameters.Add(new SqlParameter("@InstructorCode", instructorCode));
            //cmd2.Parameters.Add(new SqlParameter("@Notes", Student_tbNotes.Text));
            //try
            //{
            //    cmd2.CommandType = CommandType.Text;
            //    cmd2.ExecuteNonQuery();
            //}
            //catch (System.Data.SqlClient.SqlException ex)
            //{
            //    string msg = "Insert Error into Student";
            //    msg += ex.Message;
            //    throw new Exception(msg);

            //}

            // Insert - Student Part 3
            String sqlQuery2_p3 = "INSERT INTO STUDENT(StudentCode, InstructorCode)" +
                "VALUES (@StudentCode, @InstructorCode)";
            SqlCommand cmd2_p3 = new SqlCommand(sqlQuery2_p3, sqlconnect);
            cmd2_p3.Parameters.Add(new SqlParameter("@StudentCode", studentCode));
            cmd2_p3.Parameters.Add(new SqlParameter("@InstructorCode", Int_Code));
            try
            {
                cmd2_p3.CommandType = CommandType.Text;
                cmd2_p3.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert Error into Student Part 3";
                msg += ex.Message;
                throw new Exception(msg);
            }

            //// Insert - Student Part 1
            //String sqlQuery2_p1 = "UPDATE Student SET StudentCode = @StudentCode WHERE StudentCode = @StudentCode AND InstructorCode = @InstructorCode";
            //SqlCommand cmd2_p1 = new SqlCommand(sqlQuery2_p1, sqlconnect);
            //cmd2_p1.Parameters.Add(new SqlParameter("@InstructorCode", Int_Code));
            //cmd2_p1.Parameters.Add(new SqlParameter("@StudentCode", studentCode));

            //try
            //{
            //    cmd2_p1.CommandType = CommandType.Text;
            //    cmd2_p1.ExecuteNonQuery();
            //}
            //catch (System.Data.SqlClient.SqlException ex)
            //{
            //    string msg = "Insert Error into Student Part 1";
            //    msg += ex.Message;
            //    throw new Exception(msg);

            //}

            // Insert - Student Part 2

            String sqlQuery2_p2 = "UPDATE Student SET Name = @Name, Notes = @Notes, OrganizationID = @OrganizationID WHERE InstructorCode = @InstructorCode AND StudentCode = @StudentCode";

            SqlCommand cmd2_p2 = new SqlCommand(sqlQuery2_p2, sqlconnect);
            cmd2_p2.Parameters.Add(new SqlParameter("@Name", Student_tbFirstName.Text + ' ' + Student_tbLastName.Text));
            cmd2_p2.Parameters.Add(new SqlParameter("@Notes", Student_tbNotes.Text));
            cmd2_p2.Parameters.Add(new SqlParameter("@InstructorCode", Int_Code));
            cmd2_p2.Parameters.Add(new SqlParameter("@StudentCode", studentCode));
            cmd2_p2.Parameters.Add(new SqlParameter("@OrganizationID", orgID));

            try
            {
                cmd2_p2.CommandType = CommandType.Text;
                cmd2_p2.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert Error into Student";
                msg += ex.Message;
                throw new Exception(msg);
            }
        }

        protected void btnStudentSignUpReset_Click(object sender, EventArgs e)
        {
            Student_tbFirstName.Text = "";
            Student_tbLastName.Text = "";
            Student_tbNotes.Text = "";
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

        protected void EventList_SelectedIndexChanged(object sender, EventArgs e)
        {
            ////Queries Relevant to home page, fetching event info student info and more

            //string OrgName = "";
            //string OrgType = "";
            //string EventName = "";
            //string ContactName = "";
            //string Phone = "";
            //string Email = "";
            //string ContactCode = "";
            //string EventID = "";
            //DateTime Date1 = new DateTime();
            ////Inserting teacher query
            ////Get connection string from web.config file
            //string strcon = ConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString;
            ////Inserting teacher query

            ////Get connection string from web.config file
            ////create new sqlconnection and connection to database by using connection string from web.config file
            //SqlConnection con = new SqlConnection(strcon);
            //String sqlQuery4 = "select C.ContactCode as ContactCode, C.Name as ContactName, format(E.Date, 'MM/dd/yyyy') as Date, O.Name as OrgName, O.Type as OrgType, E.Name as EventName" +
            //" from EventContact C" +
            //" inner join Organization O on O.OrganizationID = C.OrganizationID" +
            //" inner join Event E on C.EventID = E.EventID" +
            //" where C.EventID = '" + EventList.SelectedValue + "'";
            //SqlCommand cmd4 = new SqlCommand(sqlQuery4, con);

            //con.Open();
            //try
            //{
            //    SqlDataReader reader = cmd4.ExecuteReader();

            //    while (reader.Read())
            //    {
            //        ContactCode = reader[0].ToString();
            //        ContactName = reader[1].ToString();
            //        Date1 = Convert.ToDateTime(reader[2]);
            //        OrgName = reader[3].ToString();
            //        OrgType = reader[4].ToString();
            //        EventName = reader[5].ToString();
            //    }
            //    reader.Close();
            //}
            //catch (System.Data.SqlClient.SqlException ex)
            //{
            //    string msg = "Select Error in EventContact:";
            //    msg += ex.Message;
            //    throw new Exception(msg);
            //}
            //SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery4, con);
            //DataSet ds = new DataSet();

            //sqlAdapter.Fill(ds);

            //EventInfoTable.DataSource = ds;
            //EventInfoTable.DataBind();

            //String sqlQuery1 = "select S.Name from Student S inner join Instructor I on S.InstructorCode = I.InstructorCode" +
            //" where I.ContactCode = '" + ContactCode + "';";
            //SqlDataAdapter sqlAdapter1 = new SqlDataAdapter(sqlQuery1, con);

            ////Fill table with data
            //DataTable dt = new DataTable();
            //sqlAdapter1.Fill(dt);
            //if (dt.Rows.Count > 0)
            //{
            //    StudentListBox.DataSource = dt;
            //    StudentListBox.DataTextField = "Name";
            //    StudentListBox.DataBind();
            //}

            //string sqlQuery2 = "select Name from Instructor where ContactCode = '" + ContactCode + "'";
            //SqlDataAdapter sqlAdapter2 = new SqlDataAdapter(sqlQuery2, con);

            //var items = new List<string>();

            //using (SqlCommand command = new SqlCommand(sqlQuery2, con))
            //{
            //    using (SqlDataReader reader = command.ExecuteReader())
            //    {
            //        while (reader.Read())
            //        {
            //            //Read info into List
            //            items.Add(reader.GetString(0));
            //        }
            //    }
            //}
            //InstructorRepeater.DataSource = items;
            //InstructorRepeater.DataBind();

            //string sqlQuery3 = "select V.VolunteerCode, V.Name from Volunteer V inner join EventVolunteers E on V.VolunteerCode = E.VolunteerCode where E.EventID = '" + EventList.SelectedValue + "'";
            //var items1 = new List<string>();

            //using (SqlCommand command = new SqlCommand(sqlQuery3, con))
            //{
            //    using (SqlDataReader reader = command.ExecuteReader())
            //    {
            //        while (reader.Read())
            //        {
            //            //Read info into List
            //            items1.Add(reader.GetString(1));
            //        }
            //    }
            //}
            //VolunteerRepeater.DataSource = items1;
            //VolunteerRepeater.DataBind();

            //con.Close();
        }

        protected void GvEventdisplay_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GvEventdisplay, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }

        protected void GvEventdisplay_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Queries Relevant to home page, fetching event info student info and more

            string EventID = GvEventdisplay.SelectedRow.Cells[0].Text;
            string OrgName = "";
            string OrgType = "";
            string EventName = "";
            string ContactName = "";
            string Phone = "";
            string Email = "";
            string ContactCode = "";
            DateTime Date1 = new DateTime();
            //Inserting teacher query
            //Get connection string from web.config file
            string strcon = ConfigurationManager.ConnectionStrings["CyberDayMaster"].ConnectionString;
            //Inserting teacher query

            //Get connection string from web.config file
            //create new sqlconnection and connection to database by using connection string from web.config file
            SqlConnection con = new SqlConnection(strcon);
            String sqlQuery4 = "select C.ContactCode as ContactCode, C.Name as ContactName, format(E.Date, 'MM/dd/yyyy') as Date, O.Name as OrgName, O.Type as OrgType, E.Name as EventName" +
            " from EventContact C" +
            " inner join Organization O on O.OrganizationID = C.OrganizationID" +
            " inner join Event E on C.EventID = E.EventID" +
            " where C.EventID = '" + EventID + "'";
            SqlCommand cmd4 = new SqlCommand(sqlQuery4, con);

            con.Open();
            try
            {
                SqlDataReader reader = cmd4.ExecuteReader();
                //MessageBox.Show(EventID, "helloo");
                while (reader.Read())
                {
                    ContactCode = reader[0].ToString();
                    ContactName = reader[1].ToString();
                    Date1 = Convert.ToDateTime(reader[2]);
                    OrgName = reader[3].ToString();
                    OrgType = reader[4].ToString();
                    EventName = reader[5].ToString();
                }
                reader.Close();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Select Error in EventContact:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery4, con);
            DataSet ds = new DataSet();

            sqlAdapter.Fill(ds);

            //EventInfoTable.DataSource = ds;
            //EventInfoTable.DataBind();

            String sqlQuery1 = "select S.Name from Student S inner join Instructor I on S.InstructorCode = I.InstructorCode" +
            " where I.ContactCode = '" + ContactCode + "';";
            SqlDataAdapter sqlAdapter1 = new SqlDataAdapter(sqlQuery1, con);

            //Fill table with data
            DataTable dt = new DataTable();
            sqlAdapter1.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                StudentListBox.DataSource = dt;
                StudentListBox.DataTextField = "Name";
                StudentListBox.DataBind();
            }

            string sqlQuery2 = "select Name from Instructor where ContactCode = '" + ContactCode + "'";
            SqlDataAdapter sqlAdapter2 = new SqlDataAdapter(sqlQuery2, con);

            var items = new List<string>();

            using (SqlCommand command = new SqlCommand(sqlQuery2, con))
            {
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        //Read info into List
                        items.Add(reader.GetString(0));
                    }
                }
            }
            InstructorRepeater.DataSource = items;
            InstructorRepeater.DataBind();
            //MessageBox.Show(items[0]);

            string sqlQuery3 = "select V.VolunteerCode, V.Name from Volunteer V inner join EventVolunteers E on V.VolunteerCode = E.VolunteerCode where E.EventID = '" + EventID + "'";
            var items1 = new List<string>();

            using (SqlCommand command = new SqlCommand(sqlQuery3, con))
            {
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        //Read info into List
                        items1.Add(reader.GetString(1));
                    }
                }
            }
            VolunteerRepeater.DataSource = items1;
            VolunteerRepeater.DataBind();

            con.Close();

            string mag = "Row Info: " + EventID + " " + EventName + " " + Date1 + " " + OrgName + " " + OrgName + " " + ContactName + " " + ContactCode;
            foreach (GridViewRow row in GvEventdisplay.Rows)
            {
                if (row.RowIndex == GvEventdisplay.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }

        protected void ContactSubmissionGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            string RequestID = ContactSubmissionGrid.SelectedRow.Cells[0].Text;

            foreach (GridViewRow row in ContactSubmissionGrid.Rows)
            {
                if (row.RowIndex == ContactSubmissionGrid.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }

            MessageBox.Show(RequestID);
        }

        protected void ContactSubmissionGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(ContactSubmissionGrid, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }
    }
}