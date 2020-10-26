<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CIS484Solution1.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TeacherNewPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HomePlaceHolder" runat="server">
    <div class="container" style="width: 100%; margin-left: 20px; margin-top: 20px; margin-right: 20px;">
        <div class="form-group">
            <h2 style="text-align: center">Welcome to Cyber Day 2021</h2>
            <h3>New users please sign up. Log in.</h3>
            <asp:Table runat="server" CellPadding="2" CssClass="m-5 p-5">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblAccessCode" runat="server" Text="Have an Access code?"></asp:Label>
                        <asp:Label ID="lblAccessCodeStatus" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtAccessCodeEntry" BorderStyle="Double" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnAccessCodeEntry" runat="server" Text="Confirm" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnAccessCodeEntry_Click" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
        <div class="form-group">
            <h2 style="text-align: center">Want your organization to join a cyber day? Submit a request here</h2>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div style="margin-top: 40px;">
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Label ID="ContactRequestNameLabel" CssClass="label" runat="server" Text="Name"></asp:Label>
                                    <asp:TextBox CssClass="input--style-4" ValidationGroup="ContactRequestInput" ID="ContactRequestNameText" runat="server" required="true" />
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <asp:Label ID="ContactRequestPhoneLabel" CssClass="label" runat="server" Text="Phone"></asp:Label>
                                    <asp:TextBox CssClass="input--style-4" ValidationGroup="ContactRequestInput" ID="ContactRequestPhoneText" runat="server" required="true" />
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <asp:Label ID="Label2" CssClass="label" runat="server" Text="Email"></asp:Label>
                                    <asp:TextBox CssClass="input--style-4" ValidationGroup="ContactRequestInput" ID="ContactRequestEmailText" runat="server" required="true" />
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col">
                                <div class="form-group">
                                    <asp:Label ID="Label3" CssClass="label" runat="server" Text="Org Name"></asp:Label>
                                    <asp:TextBox CssClass="input--style-4" ValidationGroup="ContactRequestInput" ID="ContactRequestOrganizationNameText" runat="server" required="true" />
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <asp:Label ID="Label5" CssClass="label" runat="server" Text="Organization Type"></asp:Label>
                                    <asp:DropDownList
                                        ID="OrganizationTypeList"
                                        runat="server"
                                        CssClass="js-example-basic-single">
                                        <asp:ListItem Value="School" Selected="True" Text="School" />
                                        <asp:ListItem Value="HomeSchool" Text="Home School Co-Op" />
                                        <asp:ListItem Value="AfterSchoolOrg" Text="After School Program" />
                                        <asp:ListItem Value="Other" Text="Other" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <asp:Label ID="Label4" CssClass="label" runat="server" Text="Event Name"></asp:Label>
                                    <asp:TextBox CssClass="input--style-4" ValidationGroup="ContactRequestInput" ID="EventNameRequest" runat="server" required="true" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="w-100"></div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label1" CssClass="label" runat="server" Text="What Date Do You Want Your Event On?"></asp:Label>
                            <asp:Calendar ID="EventRequestDate" OnSelectionChanged="EventRequestDate_SelectionChanged" runat="server"></asp:Calendar>
                        </div>

                        <!--Button options for Submit, Commit Populate and Reset Distinguishable-->
                        <div class="container">
                            <div class="row">
                                <div class="col-sm text-left">
                                    <asp:Button ID="SubmitButton" runat="server" ValidationGroup="ContactRequestInput" OnClick="AddRequest_Click" Text="Submit" Style="margin-left: 0%;" CssClass="btn btn-primary" />
                                </div>
                                <div class="col-sm text-right">
                                    <asp:Button ID="ResetButton" runat="server" OnClick="ResetButton_Click" ValidationGroup="ContactRequestInput" CausesValidation="False" Text="Reset" UseSubmitBehavior="False" CssClass="btn btn-danger" />
                                </div>
                            </div>
                        </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="CoordinatorSubmissionViewPlaceholder" runat="server">
    <div class="form-group">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:GridView ID="ContactSubmissionGrid"
                    AutoGenerateColumns="true"
                    runat="server">

                    <HeaderStyle BackColor="#989898" ForeColor="white" />
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdatePanel ID="RequestListDDLUpdate" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:SqlDataSource runat="server"
                    ID="RequestListDataSource"
                    DataSourceMode="DataReader"
                    ConnectionString="<%$ ConnectionStrings:CyberDayMaster%>"
                    SelectCommand="SELECT RequestID, ContactName FROM ContactRequest" />
                <asp:DropDownList ID="RequestListDDL"
                    DataSourceID="RequestListDataSource"
                    DataTextField="ContactName"
                    DataValueField="RequestID"
                    AutoPostBack="true"
                    runat="server"
                    Width="50%"
                    CssClass="js-example-basic-single">
                </asp:DropDownList>
                <asp:Button runat="server" ID="AddEvent" OnClick="addEvent_Click" Text="Approve" CausesValidation="False" UseSubmitBehavior="False" />
                <asp:Button runat="server" ID="DeleteEvent" OnClick="DeleteEvent_OnClickEvent_Click" Text="Delete" CausesValidation="False" UseSubmitBehavior="False" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="NewStudentPlaceHolder" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".js-example-basic-single").select2();
        });
    </script>
    <div style="margin-top: 40px;">
        <div class="container-fluid">
            <div class="grid">
                <div class="grid-item grid-item--width2 grid-item--height3">
                    <!-- Info Display -->
                    <table class="table table-bordered table-striped" style="margin-left: 5px">
                        <tr>
                            <td>Name:    </td>
                            <td>
                                <asp:Label ID="StudentNameData" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Age: </td>
                            <td>
                                <asp:DropDownList
                                    ID="StudentAgeEdit"
                                    runat="server"
                                    CssClass="js-example-basic-single"
                                    Width="50%">
                                    <asp:ListItem Value="6" />
                                    <asp:ListItem Value="7" />
                                    <asp:ListItem Value="8" />
                                    <asp:ListItem Value="9" />
                                    <asp:ListItem Value="10" />
                                    <asp:ListItem Value="11" />
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>Notes: </td>
                            <td>
                                <asp:TextBox ID="StudentNotesData" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>School: </td>
                            <td>
                                <asp:Label ID="StudentSchoolData" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Teacher: </td>
                            <td>
                                <asp:Label ID="StudentTeacherData" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Tshirt Color: </td>
                            <td>
                                <asp:DropDownList
                                    ID="StudentColorEdit"
                                    runat="server"
                                    CssClass="js-example-basic-single"
                                    Width="50%">
                                    <asp:ListItem Value="Green" />
                                    <asp:ListItem Value="Blue" />
                                    <asp:ListItem Value="Red" />
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>Tshirt Size: </td>
                            <td>
                                <asp:DropDownList
                                    ID="StudentSizeEdit"
                                    runat="server"
                                    CssClass="js-example-basic-single"
                                    Width="50%">
                                    <asp:ListItem Value="Small" />
                                    <asp:ListItem Value="Medium" />
                                    <asp:ListItem Value="Large" />
                                </asp:DropDownList></td>
                        </tr>
                    </table>
                    <asp:FormView ID="StudentFormView" runat="server">
                        <ItemTemplate>
                            <table class="table table-bordered table-striped" style="margin-left: 5px">
                                <tr>
                                    <td>Student Name:    </td>
                                    <td><%#Eval("StudentName") %></td>
                                </tr>
                                <tr>
                                    <td>Age: </td>
                                    <td><%#Eval("Age") %></td>
                                </tr>
                                <tr>
                                    <td>Notes: </td>
                                    <td><%#Eval("Notes") %></td>
                                </tr>
                                <tr>
                                    <td>School: </td>
                                    <td><%#Eval("SchoolName") %></td>
                                </tr>
                                <tr>
                                    <td>Teacher: </td>
                                    <td><%#Eval("TeacherName") %></td>
                                </tr>
                                <tr>
                                    <td>Tshirt Color: </td>
                                    <td><%#Eval("Color") %></td>
                                </tr>
                                <tr>
                                    <td>Tshirt Size: </td>
                                    <td><%#Eval("Size") %></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:FormView>
                </div>
                <div class="grid-item grid-item--height2">
                </div>
                <div class="grid-item grid-item--width2 grid-item--height2 ">
                </div>

                <div class="grid-item">
                </div>
            </div>

            <%--                <div class="grid-item">
                    <asp:Button ID="StudentUpdateButton" runat="server" OnClick="StudentUpdateButton_Click" Style="padding-top: 0%; padding-bottom: 0%;" CssClass="btn btn-primary btn-sm" Text="Update" />
                </div>--%>
        </div>
    </div>
</asp:Content>
<asp:Content ID="VolunteerView" ContentPlaceHolderID="VolunteerView" runat="server">
    <div runat="server" id="VolDiv" style="margin-top: 40px; display: none">
         <div class="form-group">
            <asp:Table runat="server" CellPadding="2" CssClass="m-5 p-5">
                <asp:TableRow>
                    <asp:TableCell>
                            <h2 style="text-align: center">Welcome:<asp:Label ID="lblVolunteerName" runat="server" Text="VOLUNTEER NAME HERE"></asp:Label></h2>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            </div>
             <div class="form-group">
            <asp:Table runat="server" CellPadding="2" CssClass="m-5 p-5" Border="1">
                <asp:TableRow>
                    <asp:TableCell>
                        <h6 style="text-align:left">The Event selected to participate:</h6>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblName" runat="server" Text="EVENT NAME HERE"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblEventDate" runat="server" Text="Date:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblCoordinator" runat="server" Text="Coordinator:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblCoordinatorName" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
            <div class="form-group">
            <asp:Table runat="server" CellPadding="2" CssClass="m-5 p-5">
                    <asp:TableRow>
                        <asp:TableCell RowSpan="2">
                            <h4>Volunteer Information</h4>
                        </asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow>

                </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblVolunteerName2" runat="server" Text="Name: "></asp:Label>
                            <asp:Label ID="lblName2" runat="server" Text=""></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>

                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblVolunteerRole" runat="server" Text="Role:"></asp:Label>
                            <asp:Label ID="lblRole" runat="server" Text=""></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>

                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lblOrganizationID" runat="server" Text="Organization ID:"></asp:Label>
                                                        <asp:Label ID="lblID" runat="server" Text=""></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>

                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblVolunteerPhone" runat="server" Text="Phone:"></asp:Label>
                                                        <asp:Label ID="lblVolunteerP" runat="server" Text=""></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>

                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lblVolunteerEmail" runat="server" Text="Email:"></asp:Label>
                            <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell RowSpan="2">
                         <h2 style="text-align: center">Save The Date: <asp:Label ID="lblEventDate2" runat="server" Text=""></asp:Label></h2>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
    </div>
</asp:Content>
<asp:Content ID="InstructorView" ContentPlaceHolderID="InstructorView" runat="server">
    <div runat="server" id="InstDiv"  style="margin-top: 40px; display: none">
        <asp:Table runat="server">
        <asp:TableRow>
            <asp:TableCell RowSpan="2">
                <asp:Label ID="lblWelcomeInstructor" runat="server" Text="Welcome!"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblInstructorName" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
       <asp:DetailsView ID="InstructorAccessCodeDetailView"
            DataSourceID="InstructorAccessCodeDataSource" AutoGenerateRows="true"
            Height="50px" Width="125px"
            EmptyDataText="Invalid Instructor"
            GridLines="Both"
            runat="server">
           
            <HeaderStyle BackColor="Navy" ForeColor="White" />
            <RowStyle BackColor="White" />
            <AlternatingRowStyle BackColor="LightGray" />
            <EditRowStyle BackColor="LightCyan" />
          </asp:DetailsView>

       <%-- <fieldset>
            <legend>View Students:</legend>
            <asp:GridView
                runat="server"
                ID="InstructorAccessCodeDetailView"
                DataSourceID="InstructorAccessCodeDataSource">
            </asp:GridView>
        </fieldset>--%>
          <asp:SqlDataSource ID="InstructorAccessCodeDataSource" runat="server"
                     ConnectionString="<%$ ConnectionStrings:CyberDayMaster%>"
                    SelectCommand="">
        </asp:SqlDataSource>

        <asp:Table runat="server">
                <asp:TableRow>
                <asp:TableCell RowSpan="2">
                    <asp:Label ID="lblIinstructorClusterAccessCode_Label" runat="server" Text="Cluster Access code:"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblInstructorClusterAccessCode" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblInstructorEvent_Label" runat="server" Text="Event:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblInstructorEvent" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblInstructorDate_Label" runat="server" Text="Date:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblInstructorDate" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

     <%-- <asp:ListView runat="server" ID="InstructorAccessCodeListView"
        DataSourceID="StudentDataSource"
        DataKeyNames="STUDENTCODE">
        <LayoutTemplate>
          <div runat="server" id="lstStudent">
            <div runat="server" id="itemPlaceholder" />
          </div>
          <asp:DataPager runat="server" PageSize="5" >
          </asp:DataPager>
        </LayoutTemplate>
        <ItemTemplate>        
          <div class="plainBox" runat="server">
            <b>StudentID:</b>
            <asp:Label ID="lblStudentID" runat="server" Text='<%# Eval("STUDENTCODE")%>' /> <br />
          </div>
          <div class="plainBox" runat="server">
            <b>Name:</b>
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name")%>' /> <br />
          </div>
          <div class="plainBox" runat="server">
            <b>Organization ID:</b>
            <asp:Label ID="Label4" runat="server" Text='<%# Eval("organizationID")%>' /> <br />
          </div>

        </ItemTemplate>
      </asp:ListView>--%>
         <fieldset>
            <legend>View Students:</legend>
            <asp:GridView
                runat="server"
                ID="InstructorAccessCodeListView"
                DataSourceID="StudentDataSource">
            </asp:GridView>
        </fieldset>
         
      <asp:SqlDataSource ID="StudentDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:CyberDayMaster %>"                    
        SelectCommand="">
        <SelectParameters>
        </SelectParameters>
      </asp:SqlDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="VolunteerExistingPlaceholder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="margin-top: 40px;">
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <asp:Label ID="lblInstructor_SchOrg" CssClass="label" runat="server" Text="School/Organization: " Font-Bold="true"></asp:Label>
                            <asp:Label ID="DisplaySchool" CssClass="label" runat="server" Text="PLACE SCHOOL/ORGANIZATION HERE"></asp:Label>
                        </div>
                    </div>
                    <div class="w-100"></div>
                    <div class="col">
                        <div class="form-group">
                            <asp:Label ID="lblInstructor_FirstName" CssClass="label" runat="server" Text="First Name"></asp:Label>
                            <asp:TextBox CssClass="input--style-4" ValidationGroup="StudentInput" ID="Instructor_tbFirstName" runat="server" required="true" />
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <asp:Label ID="lblInstructor_LastName" CssClass="label" runat="server" Text="Last Name"></asp:Label>
                            <asp:TextBox CssClass="input--style-4" ValidationGroup="StudentInput" ID="Instructor_tbLastName" runat="server" required="true" ValidateRequestMode="Inherit" />
                        </div>
                    </div>
                    <div class="w-100"></div>
                    <div class="col">
                        <div class="form-group">
                            <asp:Label ID="lblInstructor_Email" CssClass="label" runat="server" Text="Email Address"></asp:Label>
                            <asp:TextBox CssClass="input--style-4" ValidationGroup="StudentInput" ID="Instructor_tbEmail" runat="server" required="true" />
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <asp:Label ID="lblInstructor_Phone" CssClass="label" runat="server" Text="Phone Number"></asp:Label>
                            <asp:TextBox CssClass="input--style-4" ValidationGroup="StudentInput" ID="Instructor_tbPhone" runat="server" required="true" ValidateRequestMode="Inherit" />
                        </div>
                    </div>
                    <div class="w-100"></div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-sm text-left">
                        <asp:Button ID="Button1" runat="server" OnClick="SubmitButton_Click" Text="Sign Up" Style="margin-left: 0%;" CssClass="btn btn-primary" />
                    </div>
                    <div class="col-sm text-right">
                        <asp:Button ID="Instructor_ResetButton" OnClick="Instructor_ResetButton_Click" runat="server" ValidationGroup="StudentInput" CausesValidation="False" Text="Reset" UseSubmitBehavior="False" CssClass="btn btn-danger" />
                    </div>
                </div>
            </div>

            <div class="col" />
            <fieldset>
                <legend>View Instructors</legend>
                <asp:GridView 
                    runat="server"
                    ID="Instructor_GridView" 
                    DataSourceID="sqlsrcInstructor">
                </asp:GridView>
            </fieldset>
            <asp:SqlDataSource 
                runat="server"
                ID="sqlsrcInstructor"
                DataSourceMode="DataReader"
                ConnectionString="<%$ ConnectionStrings:CyberDayMaster%>"
                SelectCommand="" />

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="StudentExistingPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="TeacherExistingPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="CoordinatorExistingPlaceholder" runat="server">
<asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <div style="margin-top: 40px;">
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <asp:Label ID="Label6" CssClass="label" runat="server" Text="School/Organization: " Font-Bold="true"></asp:Label>
                            <asp:Label ID="Label7" CssClass="label" runat="server" Text="PLACE SCHOOL/ORGANIZATION HERE"></asp:Label>
                        </div>
                    </div>
                    <div class="w-100"></div>


                    <div class="col">
                        <div class="form-group">
                            <asp:Label ID="Label8" CssClass="label" runat="server" Text="First Name"></asp:Label>
                            <asp:TextBox CssClass="input--style-4" ValidationGroup="StudentInput" ID="Student_tbFirstName" runat="server" required="true" />
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <asp:Label ID="Label9" CssClass="label" runat="server" Text="Last Name"></asp:Label>
                            <asp:TextBox CssClass="input--style-4" ValidationGroup="StudentInput" ID="Student_tbLastName" runat="server" required="true" ValidateRequestMode="Inherit" />
                        </div>
                    </div>
                    <div class="w-100"></div>

                    <div class="col">
                        <div class="form-group">
                            <asp:Label ID="Label10" CssClass="label" runat="server" Text="T-Shirt Size"></asp:Label>
                            <asp:DropDownList
                                    ID="ddlStudentSize"
                                    runat="server"
                                    CssClass="js-example-basic-single"
                                    Width="50%">
                                    <asp:ListItem Value="Small" />
                                    <asp:ListItem Value="Medium" />
                                    <asp:ListItem Value="Large" />
                                </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <asp:Label ID="Label11" CssClass="label" runat="server" Text="T-Shirt Color"></asp:Label>
                           <asp:DropDownList
                                    ID="ddlStudentColor"
                                    runat="server"
                                    CssClass="js-example-basic-single"
                                    Width="50%">
                                    <asp:ListItem Value="Red" />
                                    <asp:ListItem Value="Blue" />
                                    <asp:ListItem Value="Green" />
                                </asp:DropDownList>
                        </div>
                    </div>
                    <div class="w-100"></div>
                    <div class="col">
                        <div class="form-group">
                            <asp:Label ID="Label12" CssClass="label" runat="server" Text="Notes"></asp:Label>
                            <asp:TextBox CssClass="input--style-4" ValidationGroup="StudentInput" ID="Student_tbNotes" runat="server" required="true" ValidateRequestMode="Inherit" />
                        </div>
                    </div>
                    <div class="w-100"></div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-sm text-left">
                        <asp:Button ID="btnStudentSignUp" runat="server" OnClick="btnStudentSignUp_Click" Text="Sign Up" Style="margin-left: 0%;" CssClass="btn btn-primary" />
                    </div>
                    <div class="col-sm text-right">
                        <asp:Button ID="btnStudentSignUpReset" runat="server" OnClick="btnStudentSignUpReset_Click" ValidationGroup="StudentInput" CausesValidation="False" Text="Reset" UseSubmitBehavior="False" CssClass="btn btn-danger" />
                    </div>
                </div>
            </div>

            <%--<div class="col" />
            <fieldset>
                <legend>View Instructors</legend>
                <asp:GridView 
                    runat="server"
                    ID="GridView1" 
                    DataSourceID="sqlsrcInstructor">
                </asp:GridView>
            </fieldset>
            <asp:SqlDataSource 
                runat="server"
                ID="SqlDataSource1"
                DataSourceMode="DataReader"
                ConnectionString="<%$ ConnectionStrings:CyberDayMaster%>"
                SelectCommand="" />--%>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>