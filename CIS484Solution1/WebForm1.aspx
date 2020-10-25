<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CIS484Solution1.WebForm1" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="TeacherNewPlaceholder" runat="server">
</asp:Content>--%>
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
<asp:Content ID="Content4" ContentPlaceHolderID="StudentExistingPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="TeacherExistingPlaceholder" runat="server">
    
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="VolunteerExistingPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="CoordinatorExistingPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="CoordinatorNewPlaceholder" runat="server">
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

