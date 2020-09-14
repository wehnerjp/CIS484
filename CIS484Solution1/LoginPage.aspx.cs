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
            String sqlQuery = "Select EventName, Time, FORMAT(Date,'dd/MM/yyyy') as Date, (select EventPersonnel.FirstName + ' ' + EventPersonnel.LastName as CoordinatorName from EventPresenters " +
                "inner join EventPersonnel on EventPersonnel.VolunteerID = EventPresenters.PersonnelID where EventPresenters.Role = 'Coordinator' and EventPresenters.EventID = " + EventList.SelectedItem.Value + ") as CoordinatorName, RoomNbr from Event where EventID = " + EventList.SelectedItem.Value;
            String sqlQuery1 = "SELECT Student.FirstName +' ' + Student.LastName as StudentName, Student.TeacherID from Student " +
                "inner join Teacher on Student.TeacherID = Teacher.TeacherID " +
                "inner join EventAttendanceList on EventAttendanceList.TeacherID = Teacher.TeacherID " +
                "where EventAttendanceList.EventID = " + EventList.SelectedItem.Value;
            String sqlQuery2 = "select EventPersonnel.FirstName +' ' + EventPersonnel.LastName as VolunteerName, EventPersonnel.PersonnelType from EventPresenters " +
                "inner join EventPersonnel on EventPersonnel.VolunteerID = EventPresenters.PersonnelID where EventPresenters.Role = 'Volunteer' and EventPresenters.EventID = " + EventList.SelectedItem.Value;

            //Get connection string from web.config file  
            string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            //create new sqlconnection and connection to database by using connection string from web.config file  
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, con);
            SqlDataAdapter sqlAdapter1 = new SqlDataAdapter(sqlQuery1, con);
            SqlDataAdapter sqlAdapter2 = new SqlDataAdapter(sqlQuery2, con);

            var items = new List<string>();

            using (SqlCommand command = new SqlCommand(sqlQuery2, con))
            {
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        items.Add(reader.GetString(0));
                    }
                }
            }
            rep1.DataSource = items;
            rep1.DataBind();





            DataTable dt = new DataTable();
            sqlAdapter1.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                ListBox1.DataSource = dt;
                ListBox1.DataTextField = "StudentName";
                ListBox1.DataBind();
            }

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
            String sqlQuery = "Select Student.StudentID, Student.FirstName + ' ' + Student.LastName as StudentName, Student.Age, Student.Notes, Teacher.FirstName + ' ' + Teacher.LastName as TeacherName, Tshirt.Size, Tshirt.Color, School.SchoolName from Student " +
                 "inner join Tshirt on Tshirt.TshirtID = Student.TshirtID " +
                "inner join Teacher on Student.TeacherID = Teacher.TeacherID " +
                "inner join School on School.SchoolID = Student.SchoolID " +
                "where Student.StudentID = " + StudentNameDDL.SelectedItem.Value + " and Student.SchoolID = (select SchoolID from student where StudentID= " + StudentNameDDL.SelectedItem.Value + ") " +
                " and Student.TeacherID = (select TeacherID from student where StudentID = " + StudentNameDDL.SelectedItem.Value + ") " +
               " and Tshirt.TshirtID = (select TshirtID from Student where StudentID = " + StudentNameDDL.SelectedItem.Value + ")"; 

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
        protected void AddStudent_Click(object sender, EventArgs e)
        {
            String sqlQuery = "  Insert into Student (FirstName, LastName, Age, Notes, TshirtID, SchoolID, TeacherID) values('" + FirstNameTextBox.Text + "', '" + LastNameTextBox.Text + "', '" + StudentAgeList.SelectedItem.Value + "', '" + NotesTextBox.Text + "', " +
                "(SELECT  TshirtID FROM[Lab1].[dbo].Tshirt where Size = '" + TshirtList.SelectedItem.Value + "' and Color = '" + TshirtColorList.SelectedItem.Value + "'), '" + StudentSchoolDropDownList.SelectedItem.Value + "', '" + StudentTeacherDropDownList.SelectedItem.Value + "'); ";
            //Get connection string from web.config file  
            string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            //create new sqlconnection and connection to database by using connection string from web.config file  
            SqlConnection con = new SqlConnection(strcon);
            using (SqlCommand command = new SqlCommand(sqlQuery, con))
            {
                con.Open();
                try
                {
                    command.ExecuteNonQuery();
                    Console.Write("insert successful");
                }
                catch (SqlException ex)
                {
                    Console.Write(ex.Message);
                }
                con.Close();
            }

        }
        protected void AddTeacher_Click(object sender, EventArgs e)
        {
            String sqlQuery = "  Insert into Teacher (FirstName, LastName, Notes, TshirtID, SchoolID, Email) values('" + TeacherFirstName.Text + "', '" + TeacherLastName.Text + "', '" + StudentAgeList.SelectedItem.Value + "', '" + TeacherNoteTextBox.Text + "', " +
                "(SELECT  TshirtID FROM[Lab1].[dbo].Tshirt where Size = '" + TeacherTshirtSize.SelectedItem.Value + "' and Color = '" + TeacherTshirtColor.SelectedItem.Value + "'), '" + TeacherSchoolList.SelectedItem.Value + "', '" + EmailTextBox.Text + "'); ";
            //Get connection string from web.config file  
            string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            //create new sqlconnection and connection to database by using connection string from web.config file  
            SqlConnection con = new SqlConnection(strcon);
            using (SqlCommand command = new SqlCommand(sqlQuery, con))
            {
                con.Open();
                try
                {
                    command.ExecuteNonQuery();
                    Console.Write("insert successful");
                }
                catch (SqlException ex)
                {
                    Console.Write(ex.Message);
                }
                con.Close();
            }

        }
        protected void TeacherNameDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            String sqlQuery = "Select Teacher.TeacherID, Teacher.FirstName + ' ' + Teacher.LastName as TeacherName, Teacher.Email, Teacher.Notes, School.SchoolName, Tshirt.Size, Tshirt.Color from Teacher " +
                "inner join School on School.SchoolID = Teacher.SchoolID " +
                "inner join Tshirt on Tshirt.TshirtID = Teacher.TshirtID " +
                "where Teacher.TeacherID = " + TeacherNameDDL.SelectedItem.Value + " " +
                "and School.SchoolID = (select SchoolID from Teacher where TeacherID= " + TeacherNameDDL.SelectedItem.Value + ") " +
               " and Tshirt.TshirtID = (select TshirtID from Teacher where TeacherID = " + TeacherNameDDL.SelectedItem.Value + ")";

            //Get connection string from web.config file  
            string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            //create new sqlconnection and connection to database by using connection string from web.config file  
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, con);
            DataSet ds = new DataSet();
            sqlAdapter.Fill(ds);
            TeacherFormView.DataSource = ds;
            TeacherFormView.DataBind();
            CheckBoxListSelect();
            con.Close();

        }
        protected void EventDateDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            Console.WriteLine(EventDateDDL.SelectedValue);
            String sqlQuery = "Select EventID, EventName, EventName + '    ' +  convert(nvarchar, convert(nvarchar, Time, 0)) as EventNameTime, Date from Event where Date  = '" + EventDateDDL.SelectedValue + "'";
            
            //Get connection string from web.config file  
            string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            //create new sqlconnection and connection to database by using connection string from web.config file  
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
           
            DataTable dtx = new DataTable();
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, con);
            sqlAdapter.Fill(dtx);

            if (dtx.Rows.Count > 0)
            {

                CheckBoxList1.DataSource = dtx;
                CheckBoxList1.DataTextField = "EventNameTime";
                CheckBoxList1.DataValueField = "EventID";
                CheckBoxList1.DataBind();
            }
            CheckBoxListSelect();
    con.Close();


        }
        protected void CheckBoxListSelect()
        {
            string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            //create new sqlconnection and connection to database by using connection string from web.config file  
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            if (EventDateDDL.SelectedValue != "select" && TeacherNameDDL.SelectedItem.Value != null)
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("Select EAL.EventID from EventAttendanceList EAL where EAL.TeacherID = '" + TeacherNameDDL.SelectedValue + "'", con);
                    SqlDataReader reader = cmd.ExecuteReader();
                    for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                        CheckBoxList1.Items[i].Selected = false;

                    while (reader.Read())
                    {
                        ListItem li = CheckBoxList1.Items.FindByValue(reader["EventID"].ToString());
                        if (li != null)
                        {
                            li.Selected = true;
                        }
                        else
                        {
                            li.Selected = false;
                        }
                    }
                }
                catch (Exception)
                {
                    Response.Redirect("user.aspx", false);
                }
            }

        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            SqlConnection connection = new SqlConnection(strcon);
            SqlCommand cmd;
            string sqlStatement = string.Empty;
            try
            {
                // open the Sql connection
                connection.Open();
                foreach (ListItem item in CheckBoxList1.Items)
                {
                    if (item.Selected)
                    {
                        sqlStatement = "Insert into EventAttendanceList (TeacherID, EventID) values('" + TeacherNameDDL.SelectedValue + "','" + item.Value + "') ";
                        cmd = new SqlCommand(sqlStatement, connection);
                        cmd.CommandType = CommandType.Text;
                        cmd.ExecuteNonQuery();
                    }
                    else
                    {
                        sqlStatement = "DELETE FROM EventAttendanceList WHERE TeacherID ='" + TeacherNameDDL.SelectedValue + "' and EventID ='" + item.Value + "' ";
                        cmd = new SqlCommand(sqlStatement, connection);
                        cmd.CommandType = CommandType.Text;
                        cmd.ExecuteNonQuery();
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
                // close the Sql Connection
                connection.Close();
            }
        }

    }
}