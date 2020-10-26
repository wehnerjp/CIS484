﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CIS484Solution1.WebForm1" %>

<asp:Content ID="HomepageContent" ContentPlaceHolderID="HomePlaceHolder" runat="server">
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                                    ControlToValidate="ContactRequestNameText"
                                    ValidationGroup="ContactRequestInput"
                                    ErrorMessage="Enter your Name."
                                    runat="Server" />
                                <div class="form-group">
                                    <asp:Label ID="ContactRequestNameLabel" CssClass="label" runat="server" Text="Name"></asp:Label>
                                    <asp:TextBox CssClass="input--style-4" ValidationGroup="ContactRequestInput" ID="ContactRequestNameText" runat="server" required="false" />
                                </div>
                            </div>
                            <div class="col">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7"
                                    ControlToValidate="ContactRequestPhoneText"
                                    ValidationGroup="ContactRequestInput"
                                    ErrorMessage="Enter your Phone."
                                    runat="Server" />
                                <div class="form-group">
                                    <asp:Label ID="ContactRequestPhoneLabel" CssClass="label" runat="server" Text="Phone"></asp:Label>
                                    <asp:TextBox CssClass="input--style-4" ValidationGroup="ContactRequestInput" ID="ContactRequestPhoneText" runat="server" required="false" />
                                </div>
                            </div>
                            <div class="col">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8"
                                    ControlToValidate="ContactRequestPhoneText"
                                    ValidationGroup="ContactRequestInput"
                                    ErrorMessage="Enter your Phone."
                                    runat="Server" />
                                <div class="form-group">
                                    <asp:Label ID="Label2" CssClass="label" runat="server" Text="Email"></asp:Label>
                                    <asp:TextBox CssClass="input--style-4" ValidationGroup="ContactRequestInput" ID="ContactRequestEmailText" runat="server" required="false" />
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9"
                                    ControlToValidate="ContactRequestOrganizationNameText"
                                    ValidationGroup="ContactRequestInput"
                                    ErrorMessage="Enter your Org Name."
                                    runat="Server" />
                                <div class="form-group">
                                    <asp:Label ID="Label3" CssClass="label" runat="server" Text="Org Name"></asp:Label>
                                    <asp:TextBox CssClass="input--style-4" ValidationGroup="ContactRequestInput" ID="ContactRequestOrganizationNameText" runat="server" required="false" />
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10"
                                    ControlToValidate="EventNameRequest"
                                    ValidationGroup="ContactRequestInput"
                                    ErrorMessage="Enter your Phone."
                                    runat="Server" />
                                <div class="form-group">
                                    <asp:Label ID="Label4" CssClass="label" runat="server" Text="Event Name"></asp:Label>
                                    <asp:TextBox CssClass="input--style-4" ValidationGroup="ContactRequestInput" ID="EventNameRequest" runat="server" required="false" />
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
<asp:Content ID="EventInfo" ContentPlaceHolderID="EventInfoPlaceHolder" runat="server">
    <div style="margin-top: 40px;">
        <div class="container-fluid">
            <div class="grid">

                <div class="grid-item">
                    <div class="form-group">
                        <asp:Label ID="Label6" CssClass="label" runat="server" Text="Event"></asp:Label>
                        <asp:SqlDataSource runat="server"
                            ID="dtasrcEventList"
                            DataSourceMode="DataReader"
                            ConnectionString="<%$ ConnectionStrings:CyberDayMaster%>"
                            SelectCommand="SELECT EventID, Name FROM Event" />
                        <asp:DropDownList
                            ID="EventList"
                            DataSourceID="dtasrcEventList"
                            DataTextField="Name"
                            DataValueField="EventID"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="EventList_SelectedIndexChanged"
                            runat="server"
                            OnClientClick="javascript: needToConfirm = false;"
                            CssClass="js-example-basic-single" />
                    </div>
                </div>
                <div class="grid-item grid-item--width2 grid-item--height3">
                    <!-- Info Display -->
                    <div class="form-group">
                        <asp:Label ID="Label8" CssClass="label" runat="server" Text="Event Details"></asp:Label>
                        <asp:FormView CssClass="container" ID="EventInfoTable" EmptyDataText=" " runat="server">

                            <ItemTemplate>
                                <table class="table table-bordered table-striped" style="margin-bottom: 40px;">
                                    <tr>
                                        <td>Event Name: </td>
                                        <td><%#Eval("EventName") %></td>
                                    </tr>
                                    <tr>
                                        <td>Date: </td>
                                        <td><%#Eval("Date") %></td>
                                    </tr>
                                    <tr>
                                        <td>Contact: </td>
                                        <td><%#Eval("ContactName") %></td>
                                    </tr>
                                    <tr>
                                        <td>Org: </td>
                                        <td><%#Eval("OrgName") %></td>
                                    </tr>
                                    <tr>
                                        <td>Org Type: </td>
                                        <td><%#Eval("OrgType") %></td>
                                    </tr>
                                    <tr>
                                        <td>Access Code: </td>
                                        <td><%#Eval("ContactCode") %></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:FormView>
                    </div>
                </div>
                <div class="grid-item grid-item--height2">
                    <h4>Volunteers: </h4>
                    <asp:Repeater ID="VolunteerRepeater" runat="server">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td><%# Container.DataItem %></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:Repeater>
                    <!-- Repeater Displays all Instructors-->
                    <h4>Instructor: </h4>
                    <asp:Repeater ID="InstructorRepeater" runat="server">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td><%# Container.DataItem %></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="grid-item grid-item--width2 grid-item--height2 ">
                    <div class="form-group">
                        <asp:Label ID="Label9" CssClass="label" runat="server" Text="Students Attending Event"></asp:Label>
                        <asp:ListBox ID="StudentListBox" CssClass="custom-select" runat="server"></asp:ListBox>
                    </div>
                </div>

                <%--                <div class="grid-item">
                    <div class="form-group">
                        <!--Student Dropdown allows for profile data viewing-->
                        <asp:Label ID="StudentNameLabel" CssClass="label" runat="server" Text="Student Name"></asp:Label>
                        <asp:SqlDataSource runat="server"
                            ID="StudentNameDataSource"
                            DataSourceMode="DataReader"
                            ConnectionString="<%$ ConnectionStrings:dbconnection%>"
                            SelectCommand="SELECT StudentID, TRIM(FirstName +' ' + LastName) as StudentName FROM Student" />
                        <asp:DropDownList ID="StudentNameDDL"
                            DataSourceID="StudentNameDataSource"
                            DataTextField="StudentName"
                            DataValueField="StudentID"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="StudentNameDDL_SelectedIndexChanged"
                            runat="server"
                            Width="100%"
                            CssClass="js-example-basic-single" />
                    </div>
                </div>
                <div class="grid-item grid-item--height2 grid-item--width2" style="align-items: flex-end">
                    <div class="form-group">
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
                </div>

                <div class="grid-item">
                    <asp:Button ID="StudentUpdateButton" runat="server" OnClick="StudentUpdateButton_Click" Style="padding-top: 0%; padding-bottom: 0%;" CssClass="btn btn-primary btn-sm" Text="Update" />
                </div>--%>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="VolunteerView" ContentPlaceHolderID="VolunteerView" runat="server">
    <div runat="server" id="div1" style="margin-top: 40px;" visible="true">
        <div class="form-group">
            <asp:Table runat="server" CellPadding="2" CssClass="m-5 p-5">
                <asp:TableRow>
                    <asp:TableCell>
                        <h2 style="text-align: center">Welcome:<asp:Label ID="lblVolunteerName" runat="server" Text=""></asp:Label></h2>
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
                        <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
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
                    <h2 style="text-align: center">Save The Date:
                        <asp:Label ID="lblEventDate2" runat="server" Text=""></asp:Label></h2>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
</asp:Content>
<asp:Content ID="InstructorView" ContentPlaceHolderID="InstructorView" runat="server">
    <div runat="server" id="div2" style="margin-top: 40px;" visible="true">
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
        <asp:SqlDataSource ID="InstructorAccessCodeDataSource" runat="server"
            ConnectionString="<%$ ConnectionStrings:CyberDayMaster%>"
            SelectCommand="SELECT [Name], [Email], [Phone] FROM [Instructor]"></asp:SqlDataSource>

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

        <asp:ListView runat="server" ID="InstructorAccessCodeListView"
            DataSourceID="StudentDataSource"
            DataKeyNames="STUDENTCODE">
            <LayoutTemplate>
                <div runat="server" id="lstStudent">
                    <div runat="server" id="itemPlaceholder" />
                </div>
                <asp:DataPager runat="server" PageSize="5">
                </asp:DataPager>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="plainBox" runat="server">
                    <b>StudentID:</b>
                    <asp:Label ID="lblStudentID" runat="server" Text='<%# Eval("STUDENTCODE")%>' />
                    <br />
                </div>
                <div class="plainBox" runat="server">
                    <b>Name:</b>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name")%>' />
                    <br />
                </div>
                <div class="plainBox" runat="server">
                    <b>Organization ID:</b>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("organizationID")%>' />
                    <br />
                </div>
            </ItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="StudentDataSource" runat="server"
            ConnectionString="<%$ ConnectionStrings:CyberDayMaster %>"
            SelectCommand="SELECT TOP (1000) [StudentCode], S.[Name], S.[InstructorCode], S.[Notes],S.[OrganizationID] FROM [Student] as S
                INNER JOIN Instructor as I on S.InstructorCode = I.InstructorCode where S.InstructorCode = 'efgh'">
            <SelectParameters>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

<asp:Content ID="CoordinatorNewContent" ContentPlaceHolderID="CoordinatorNewPlaceholder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="margin-top: 40px;">
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <asp:Label ID="CoordinatorName" CssClass="label" runat="server" Text="Name"></asp:Label>
                            <asp:TextBox CssClass="input--style-4" ID="CoordinatorNameText" runat="server" CausesValidation="false" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                ControlToValidate="CoordinatorNameText"
                                ValidationGroup="SignUpGroup"
                                ErrorMessage="Enter Name."
                                runat="Server">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <asp:Label ID="Email" CssClass="label" runat="server" Text="Email"></asp:Label>
                                <asp:TextBox CssClass="input--style-4" ID="EmailTextBox" runat="server" CausesValidation="false" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                    ControlToValidate="EmailTextBox"
                                    ValidationGroup="SignUpGroup"
                                    ErrorMessage="Enter Email."
                                    runat="Server">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="col">
                            <div class="form-group">
                                <asp:Label ID="Phone" CssClass="label" runat="server" Text="Phone"></asp:Label>
                                <asp:TextBox CssClass="input--style-4" ID="PhoneTextBox" runat="server" CausesValidation="false" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                    ControlToValidate="PhoneTextBox"
                                    ValidationGroup="SignUpGroup"
                                    ErrorMessage="Enter Phone."
                                    runat="Server">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="form-group">
                            <asp:Label ID="Username" CssClass="label" runat="server" Text="Username"></asp:Label>
                            <asp:TextBox CssClass="input--style-4" ID="UsernameTextBox" runat="server" CausesValidation="false" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                ControlToValidate="UsernameTextBox"
                                ValidationGroup="SignUpGroup"
                                ErrorMessage="Enter Username."
                                runat="Server">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <br />

                    <div class="row">
                        <div class="md-form form-sm mb-5">
                            <i class="fas fa-lock prefix"></i>
                            <asp:Label ID="Password" CssClass="label" runat="server" Text="Password" AssociatedControlID="modalLRInput13" />
                            <asp:TextBox CssClass="form-control form-control-sm validate" type="password" ID="modalLRInput13" CausesValidation="false" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                                ControlToValidate="modalLRInput13"
                                ValidationGroup="SignUpGroup"
                                ErrorMessage="Enter Password."
                                runat="Server">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <!--Same button functions outside of commit in order to streamline process-->
                <div class="container">
                    <asp:Label ID="lblStatus" runat="server"></asp:Label>
                    <div class="row text-center form-sm">
                        <asp:Button ID="SubmitCoordinator" runat="server" OnClick="SubmitCoordinator_Click" ValidationGroup="SignUpGroup" Text="Submit" Style="margin-left: 0%;" CssClass="btn btn-info" />
                    </div>
                    <div class="row text-center form-sm">
                        <asp:Button ID="PopulateCoordinator" runat="server" OnClick="PopulateCoordinator_Click" CausesValidation="False" Text=" Fill " CssClass="btn btn-success" UseSubmitBehavior="False" />
                    </div>
                    <div class="row text-center form-sm">
                        <asp:Button ID="ResetCoordinator" runat="server" OnClick="ResetCoordinator_Click" CausesValidation="False" Text="Reset" UseSubmitBehavior="False" CssClass="btn btn-danger" />
                    </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>