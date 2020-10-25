<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CIS484Solution1.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TeacherNewPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HomePlaceHolder" runat="server">
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
                                    <asp:TextBox ID="NameTextBox" runat="server"></asp:TextBox>
                            </tr>
                            <tr>
                                <td>Email Address: </td>
                                <td>
                                    <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Phone Number: </td>
                                <td>
                                    <asp:TextBox ID="PhoneTextBox" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>School: </td>
                                <td>
                                    <asp:Label ID="TeacherSchoolData" runat="server" Text="PLACE SCHOOL HERE"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Tshirt Color: </td>
                                <td>
                                    <asp:DropDownList
                                        ID="TeacherColorEdit"
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
                                        ID="TeacherSizeEdit"
                                        runat="server"
                                        CssClass="js-example-basic-single"
                                        Width="50%">
                                        <asp:ListItem Value="Small" />
                                        <asp:ListItem Value="Medium" />
                                        <asp:ListItem Value="Large" />
                                    </asp:DropDownList></td>
                            </tr>
                        </table>
                        <asp:FormView ID="TeacherUpdateFormView" runat="server">
                            <ItemTemplate>
                                <table class="table table-bordered table-striped" style="margin-left: 5px">
                                    <tr>
                                        <td>Teacher Name:    </td>
                                        <td><%#Eval("StudentName") %></td>
                                    </tr>
                                    <tr>
                                        <td>Email Address: </td>
                                        <td><%#Eval("Age") %></td>
                                    </tr>
                                    <tr>
                                        <td>Phone Number: </td>
                                        <td><%#Eval("Notes") %></td>
                                    </tr>
                                    <tr>
                                        <td>School: </td>
                                        <td><%#Eval("SchoolName") %></td>
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

                <div class="grid-item">
                    <asp:Button ID="StudentUpdateButton" runat="server" Style="padding-top: 0%; padding-bottom: 0%;" CssClass="btn btn-primary btn-sm" Text="Update" />
                </div>
            </div>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="StudentExistingPlaceholder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div style="margin-top: 40px;">
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <asp:Label ID="FirstName" CssClass="label" runat="server" Text="Teacher First Name"></asp:Label>
                            <asp:TextBox CssClass="input--style-4" ValidationGroup="StudentInput" ID="FirstNameTextBox" runat="server" required="true" />
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <asp:Label ID="LastName" CssClass="label" runat="server" Text="Teacher Last Name"></asp:Label>
                            <asp:TextBox CssClass="input--style-4" ValidationGroup="StudentInput" ID="LastNameTextBox" runat="server" required="true" ValidateRequestMode="Inherit" />
                        </div>
                    </div>
                    <div class="w-100"></div>
                                        <div class="col">
                        <div class="form-group">
                            <asp:Label ID="Label2" CssClass="label" runat="server" Text="Teacher Email Address"></asp:Label>
                            <asp:TextBox CssClass="input--style-4" ID="TextBox3" runat="server" required="true" ValidationGroup="StudentInput" />
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <asp:Label ID="Label3" CssClass="label" runat="server" Text="Teacher Phone Number"></asp:Label>
                            <asp:TextBox CssClass="input--style-4" ID="TextBox4" runat="server" required="true" ValidationGroup="StudentInput" />
                        </div>
                    </div>
                    <div class="w-100"></div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-sm text-left">
                        <asp:Button ID="RequestButton" runat="server" ValidationGroup="StudentInput" CausesValidation="False" Text="Add Teacher" UseSubmitBehavior="False" CssClass="btn btn-danger" />
                    </div>
                    <div class="col-sm text-right">
                        <asp:Button ID="ResetButton" runat="server" ValidationGroup="StudentInput" CausesValidation="False" Text="Get Access Code" UseSubmitBehavior="False" CssClass="btn btn-danger" />
                    </div>
                </div>
            </div>

            <!--Button options for Submit, Commit Populate and Reset Distinguishable-->
<%--            <div class="container">
                <div class="row">
                    <div class="col-sm text-left">
                        <asp:Button ID="SubmitButton" runat="server" OnClick="AddStudent_Click" Text="Submit" Style="margin-left: 0%;" CssClass="btn btn-primary" />
                    </div>
                    <div class="col-sm text-center">
                        <asp:Button ID="PopulateButton" runat="server" OnClick="PopulateText_Click" ValidationGroup="StudentInput" CausesValidation="False" Text=" Fill " CssClass="btn btn-success" ValidateRequestMode="Inherit" UseSubmitBehavior="False" />
                    </div>
                    <div class="col-sm text-right">
                        <asp:Button ID="ResetButton" runat="server" OnClick="ResetButton_Click" ValidationGroup="StudentInput" CausesValidation="False" Text="Reset" UseSubmitBehavior="False" CssClass="btn btn-danger" />
                    </div>
                </div>
            </div>--%>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="TeacherExistingPlaceholder" runat="server">
    
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="VolunteerExistingPlaceholder" runat="server">
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
                        <asp:Button ID="SubmitButton" runat="server" OnClick="SubmitButton_Click" Text="Sign Up" Style="margin-left: 0%;" CssClass="btn btn-primary" />
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
                    ID="Instructor_GridView">
                </asp:GridView>
            </fieldset>
            <%--<asp:SqlDataSource 
                runat="server"
                ID="TeacherSchoolDataSource"
                DataSourceMode="DataReader"
                ConnectionString="<%$ ConnectionStrings:CyberDayMaster%>"
                SelectCommand="SELECT SchoolID, SchoolName FROM School" />--%>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="CoordinatorExistingPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="Contact_SubmitRequest" runat="server">

</asp:Content>