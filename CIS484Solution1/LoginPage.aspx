<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="CIS484Solution1.WebForm1" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"lang="en">

<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="Wehner"/>
    <meta name="author" content="Wehner"/>
    <meta name="keywords" content="Wehner"/>

    <title >Event Registration Page</title>

    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"/>



    <!-- Main CSS-->
    <link href="main.css" rel="stylesheet" media="all"/>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
        <!-- Main JS-->
    <script src="jquery.js"></script>
    <script src="global.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"  ></script>


    <style>  
        .navb {
            display: flex !important;
            width: 100% !important;
            text-align: center !important;
            align-content: center !important;
            align-items: center !important;
            align-self:center;
            float: none !important;
        }
        .menuItems {
            display: flex !important;
            float: none !important;
            padding-right: 30px !important;
            grid-auto-columns:max-content;
            color: #57b846;

        }
        .menuItemsg {
            display: flex !important;
            float: none !important;
            padding-right: 30px !important;
            grid-auto-columns:max-content;
            color: #57b846;
            font-style: oblique;

        }
        .navc {
            display: flex !important;
            width: 100% !important;
            font-size: larger;
            text-align: center !important;
            align-content: center !important;
            align-items: center !important;
            align-self:center;
            float: none !important;
        }
    </style>  
</head>

<body>
    <script type="text/javascript">
    $(document).ready(function() {
    $(".js-example-basic-single").select2();
    });
    </script>
  <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
   <div class="wrapper wrapper--w680">
    <div class="card card-4">
      <div class="card-body">
       <h2 class="title" >Registration Form</h2>
         <form id="form2" runat="server">
             <asp:Menu  
                ID="MasterMenu"  
                CssClass="navc"
                Orientation="Horizontal"  
                Width="100%"  
                Text-Align="center"
                runat="server"  
                OnMenuItemClick="MasterMenu_MenuItemClick" StaticMenuItemStyle-CssClass="menuItems" StaticMenuStyle-CssClass="navb" StaticSelectedStyle-CssClass="menuItems" ClientIDMode="Static">
                <Items >  
                    <asp:MenuItem Text="Home" Value="0" Selected="true"/>  
                    <asp:MenuItem  Text="Student" Value="1" />  
                    <asp:MenuItem Text="Teacher" Value="2" />  
                    <asp:MenuItem Text="Volunteer" Value="3" /> 
                    <asp:MenuItem Text="Coordinator" Value="4" />  

                </Items>  
            </asp:Menu>
            <asp:MultiView ID="MasterMultiView" runat="server" ActiveViewIndex="0">  
               <asp:View runat="server">  
                   <div style="width: 100%; margin-left: 20px; margin-top: 20px; margin-right: 20px;"> 
                       <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group">
                                            <asp:Label ID="Label20" CssClass="label" runat="server" Text="Event"></asp:Label>
                                            <asp:SqlDataSource runat="server" 
                                               ID="dtasrcEventList"
                                               DataSourceMode="DataReader"
                                               ConnectionString="<%$ ConnectionStrings:dbconnection%>"
                                               SelectCommand="SELECT EventID, EventName FROM Event" />
                                            <asp:DropDownList 
                                                ID="EventList"
                                                DataSourceID="dtasrcEventList" 
                                                DataTextField="EventName" 
                                                DataValueField="EventID" 
                                                AutoPostBack="true" 
                                                OnSelectedIndexChanged="EventList_SelectedIndexChanged"
                                                runat="server"
                                                CssClass="js-example-basic-single"
                                                Width="50%" />
                                            </div>
                                        </div>
                                    <div class="col-2">
                                        <div class="input-group">
                                            <asp:Label ID="Label22" CssClass="label" runat="server" Text="Event Details"></asp:Label>
                                            <asp:FormView CssClass="container" ID="FormView1" EmptyDataText=" " runat="server">  
                <ItemTemplate>  
                    <table class="table table-bordered table-striped">  
                        <tr>  
                            <td>Event Name: </td>  
                            <td><%#Eval("EventName") %></td>  
                        </tr>
                        <tr>  
                            <td>Date: </td>  
                            <td><%#Eval("Date") %></td>  
                        </tr>  
                        <tr>  
                            <td>Time: </td>  
                            <td><%#Eval("Time") %></td>  
                        </tr>  
                        <tr>  
                            <td>Room Number: </td>  
                            <td><%#Eval("RoomNbr") %></td>  
                        </tr>  
                    </table>  
                </ItemTemplate>  
                <emptydatatemplate>
                  <table>
                    <tr>
                      <td>
                        No records available.
                      </td>
                    </tr>
                  </table>
                </emptydatatemplate>
            </asp:FormView>  
                                            </div>
                                        </div>
                           </div>
                        <div class="row row-space">
                             <div class="col-2">
                                <div class="input-group">
                                    <asp:Label ID="Label23" CssClass="label" runat="server" Text="Event"></asp:Label>
                                    <asp:ListBox ID="ListBox1" runat="server">
                                        <asp:ListItem Text="Jeremy Thacker" />
                                        <asp:ListItem Text="John Wehner" />

                                    </asp:ListBox>
                                    </div>
                                </div>
                        </div>
                       </div>
                   </asp:View>
               <asp:View runat="server">  
                   <div style="width: 100%; margin-left: 20px; margin-top: 20px; margin-right: 20px;"> 
                    <asp:Menu  
                        ID="menuTabsCurrent"  
                        CssClass="navb"
                        Orientation="Horizontal"  
                        Width="100%"  
                        Text-Align="center"
                        runat="server"  
                        OnMenuItemClick="menuTabsCurrent_MenuItemClick" StaticMenuItemStyle-CssClass="menuItems" StaticMenuStyle-CssClass="navb" StaticSelectedStyle-CssClass="menuItemsg" ClientIDMode="Static">
                        <Items >  
                            <asp:MenuItem  Text="New" Value="0"  Selected="true" />  
                            <asp:MenuItem Text="Existing" Value="1" />  
                        </Items>  
                    </asp:Menu>  
                    <asp:MultiView ID="multiviewEmployee" runat="server" ActiveViewIndex="0">  
                        <asp:View runat="server">  
                            <div style="margin-top: 40px;">  
                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group">
                                            <asp:Label ID="FirstName" CssClass="label" runat="server" Text="First Name"></asp:Label>
                                            <asp:TextBox CssClass="input--style-4" ID="FirstNameTextBox" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <div class="input-group">
                                            <asp:Label ID="LastName" CssClass="label" runat="server" Text="Last Name"></asp:Label>
                                            <asp:TextBox CssClass="input--style-4" ID="LastNameTextBox" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group">
                                            <asp:Label ID="Age" CssClass="label" runat="server" Text="Age"></asp:Label>
                                            <asp:DropDownList 
                                                ID="subject" 
                                                runat="server"
                                                CssClass="js-example-basic-single"
                                                Width="50%">
                                                <asp:ListItem Value="6" />
                                                <asp:ListItem Value="7" />
                                                <asp:ListItem Value="8" />
                                                <asp:ListItem Value="9" />
                                                <asp:ListItem Value="10" />
                                                <asp:ListItem Value="11" />
                                            </asp:DropDownList>
                                            </div>
                                        </div>
                                    <div class="col-2">
                                        <div class="input-group">
                                         <asp:Label ID="SchoolLabel" CssClass="label" runat="server" Text="School"></asp:Label>
                                            <asp:SqlDataSource runat="server" 
                                               ID="StudentSchoolDataSource"
                                               DataSourceMode="DataReader"
                                               ConnectionString="<%$ ConnectionStrings:dbconnection%>"
                                               SelectCommand="SELECT SchoolID, SchoolName FROM School" />
                                            <asp:DropDownList 
                                                ID="StudentSchoolDropDownList" 
                                                DataSourceID="StudentSchoolDataSource" 
                                                DataTextField="SchoolName" 
                                                DataValueField="SchoolID" 
                                                AutoPostBack="true" 
                                                OnSelectedIndexChanged="StudentSchool_SelectedIndexChanged"
                                                CssClass="js-example-basic-single"
                                                Width="50%"
                                                runat="server"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group">
                                         <asp:Label ID="TeacherLabel" CssClass="label" runat="server" Text="Teacher"></asp:Label>

                                            <asp:DropDownList 
                                                ID="StudentTeacherDropDownList" 
                                                AutoPostBack="true" 
                                                CssClass="js-example-basic-single"
                                                Width="50%"
                                                runat="server"/>
                                    </div>
                                    </div>
                                    
                                    <div class="col-2">
                                        <div class="input-group">
                                             <asp:Label ID="TshirtLabel" CssClass="label" runat="server" Text="T-shirt Size"></asp:Label>
                                        <asp:DropDownList 
                                            ID="TshirtList" 
                                            runat="server"
                                            CssClass="js-example-basic-single"
                                            Width="50%">
                                            <asp:ListItem Value="Small" />
                                            <asp:ListItem Value="Medium" />
                                            <asp:ListItem Value="Large" />
                                        </asp:DropDownList>
                                    </div>
                                    </div>
                                </div>

                                <div class="input-group">
                                    <asp:Label ID="TshirtColor" CssClass="label" runat="server" Text="T-shirt Color"></asp:Label>
                                        <asp:DropDownList 
                                            ID="TshirtColorList" 
                                            runat="server"
                                            CssClass="js-example-basic-single"
                                            Width="25%">
                                            <asp:ListItem Value="Green" />
                                            <asp:ListItem Value="Blue" />
                                            <asp:ListItem Value="Red" />
                                        </asp:DropDownList>
                                </div>
                            </div>
                                <div class="p-t-15">
                                    <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn--radius-2 btn--blue"/>
                                </div> 
                        </asp:View>  
                        <asp:View runat="server"> 
                            <script type="text/javascript">
                                            $(document).ready(function() {
                                              $(".js-example-basic-single").select2();
                                            });
                            </script>
                            <div style="margin-top: 40px;">  
                                <div class="input-group">
                                    <asp:Label ID="StudentNameLabel" CssClass="label" runat="server" Text="Student Name"></asp:Label>
                                    <asp:SqlDataSource runat="server" 
                                               ID="StudentNameDataSource"
                                               DataSourceMode="DataReader"
                                               ConnectionString="<%$ ConnectionStrings:dbconnection%>"
                                               SelectCommand="SELECT StudentID, FirstName +' ' + LastName as StudentName FROM Student" />
                                        <asp:DropDownList ID="StudentNameDDL"
                                            DataSourceID="StudentNameDataSource" 
                                            DataTextField="StudentName" 
                                            DataValueField="StudentID" 
                                            AutoPostBack="true" 
                                            OnSelectedIndexChanged="StudentNameDDL_SelectedIndexChanged"
                                            runat="server"
                                            Width="50%" 
                                            CssClass="js-example-basic-single" />
                                </div>
                                <div class="input-group">
                                    <asp:FormView ID="StudentFormView" runat="server">
                                         <ItemTemplate>  
                                            <table class="table table-bordered table-striped">  
                                                <tr>  
                                                    <td>Student Name:    </td>  
                                                    <td><%#Eval("StudentName") %></td>  
                                                </tr>
                                                <tr>  
                                                    <td>Age: </td>  
                                                    <td><%#Eval("Age") %></td>  
                                                </tr>  
                                                <tr>  
                                                    <td>School: </td>  
                                                </tr>  
                                                <tr>  
                                                    <td>Teacher: </td>  
                                                </tr>  
                                            </table>  
                                        </ItemTemplate>  
                                    </asp:FormView>
                                </div>
                            </div>  
                        </asp:View>  
                    </asp:MultiView>  
                    </div>  
               </asp:View>
               <asp:View runat="server">
                   <div style="width: 100%; margin-left: 20px; margin-top: 50px; margin-right: 20px;"> 
                    <asp:Menu  
                        ID="TeacherMenu"  
                        CssClass="navb"
                        Orientation="Horizontal"  
                        Width="100%"  
                        Text-Align="center"
                        runat="server"  
                        OnMenuItemClick="TeacherMenu_MenuItemClick" StaticMenuItemStyle-CssClass="menuItems" StaticMenuStyle-CssClass="navb" StaticSelectedStyle-CssClass="menuItems" ClientIDMode="Static">
                        <Items >  
                            <asp:MenuItem  Text="New" Value="0"  Selected="true" />  
                            <asp:MenuItem Text="Existing" Value="1" />  
                        </Items>  
                    </asp:Menu> 
                    <asp:MultiView ID="TeacherView" runat="server" ActiveViewIndex="0">  
                        <asp:View runat="server">  
                            <div style="margin-top: 40px;">  
                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group">
                                            <asp:Label ID="TeacherFirstName" CssClass="label" runat="server" Text="First Name"></asp:Label>
                                            <asp:TextBox CssClass="input--style-4" ID="TeacherFirstNameText" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <div class="input-group">
                                            <asp:Label ID="TeacherLastName" CssClass="label" runat="server" Text="Last Name"></asp:Label>
                                            <asp:TextBox CssClass="input--style-4" ID="TeacherLastNameInput" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row row-space">
                                    
                                    <div class="col-2">
                                        <div class="input-group">
                                         <asp:Label ID="TeacherSchoolLabel" CssClass="label" runat="server" Text="School"></asp:Label>
                                            <asp:DropDownList 
                                                ID="TeacherSchoolList" 
                                                runat="server"
                                                CssClass="js-example-basic-single"
                                                Width="50%">
                                                <asp:ListItem Value="School1" />
                                                <asp:ListItem Value="School2" />
                                                <asp:ListItem Value="School3" />
                                            </asp:DropDownList>
                                          </div>
                                    </div>
                                    <div class="col-2">
                                        <div class="input-group">
                                             <asp:Label ID="Label6" CssClass="label" runat="server" Text="T-shirt Size"></asp:Label>
                                        <asp:DropDownList 
                                            ID="DropDownList6" 
                                            runat="server"
                                            CssClass="js-example-basic-single"
                                            Width="50%">
                                            <asp:ListItem Value="Small" />
                                            <asp:ListItem Value="Medium" />
                                            <asp:ListItem Value="Large" />
                                        </asp:DropDownList>
                                    </div>
                                    </div>
                                </div>
                                <div class="input-group">
                                    <asp:Label ID="Label7" CssClass="label" runat="server" Text="T-shirt Color"></asp:Label>
                                        <asp:DropDownList 
                                            ID="DropDownList7" 
                                            runat="server"
                                            CssClass="js-example-basic-single"
                                            Width="50%">
                                            <asp:ListItem Value="Green" />
                                            <asp:ListItem Value="Blue" />
                                            <asp:ListItem Value="Red" />
                                        </asp:DropDownList>
                                         </div>
                            </div>
                                <div class="p-t-15">
                                    <asp:Button ID="Button2" runat="server" Text="Submit" CssClass="btn btn--radius-2 btn--blue"/>
                                </div> 
                        </asp:View>  
                        <asp:View runat="server">  
                            <div style="margin-top: 40px;"> 
                                <div class="input-group">
                                    <asp:Label ID="Label1" CssClass="label" runat="server" Text="Name"></asp:Label>
                                    <asp:Label ID="Label2" CssClass="label" runat="server" Text="School"></asp:Label>
                                    <asp:Label ID="Label3" CssClass="label" runat="server" Text="Students"></asp:Label>
                                    <asp:Label ID="Label4" CssClass="label" runat="server" Text="Coordinator"></asp:Label>
                                </div>
                                <div class="input-group">

                                    <h2>Event List</h2>
                                        <asp:DropDownList ID="DropDownList8"
                                            runat="server"
                                            Width="50%"
                                            CssClass="js-example-basic-single">
                                            <asp:ListItem Value="September 30th" />
                                            <asp:ListItem Value="October 1st" />
                                            <asp:ListItem Value="October 3rd" />
                                        </asp:DropDownList>
                                </div>
                                <div class="input-group">
                                    <h2>Activities List</h2>
                                      <asp:CheckBoxList ID="CheckBoxList1" runat="server">
                                          <asp:ListItem Value="Movie 8 am" />
                                          <asp:ListItem Value="Athletics 9am" />
                                          <asp:ListItem Value="Lunch noon" />
                                          <asp:ListItem Value="Rock Climbing 2 pm" />
                                      </asp:CheckBoxList>
                                </div>
                            </div>  
                        </asp:View>  
                    </asp:MultiView>  
                  </div>
               </asp:View>
                <asp:View runat="server">
                   <div style="width: 100%; margin-left: 20px; margin-top: 50px; margin-right: 20px;"> 
                    <asp:Menu  
                        ID="VolunteerMenu"  
                        CssClass="navb"
                        Orientation="Horizontal"  
                        Width="100%"  
                        Text-Align="center"
                        runat="server"  
                        OnMenuItemClick="VolunteerMenu_MenuItemClick" StaticMenuItemStyle-CssClass="menuItems" StaticMenuStyle-CssClass="navb" StaticSelectedStyle-CssClass="menuItems" ClientIDMode="Static">
                        <Items >  
                            <asp:MenuItem  Text="New" Value="0"  Selected="true" />  
                            <asp:MenuItem Text="Existing" Value="1" />  
                        </Items>  
                    </asp:Menu> 
                    <asp:MultiView ID="VolunteerMultiview" runat="server" ActiveViewIndex="0">  
                        <asp:View runat="server">  
                            <div style="margin-top: 40px;">  
                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group">
                                            <asp:Label ID="VolunteerFirstName" CssClass="label" runat="server" Text="First Name"></asp:Label>
                                            <asp:TextBox CssClass="input--style-4" ID="TextBox1" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <div class="input-group">
                                            <asp:Label ID="VolunteerLastName" CssClass="label" runat="server" Text="Last Name"></asp:Label>
                                            <asp:TextBox CssClass="input--style-4" ID="TextBox2" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group">
                                         <asp:Label ID="VolunteerEventSignUp" CssClass="label" runat="server" Text="Event Sign Up"></asp:Label>
                                            <asp:DropDownList 
                                                ID="EventSignUp" 
                                                runat="server"
                                                CssClass="js-example-basic-single"
                                                Width="50%">
                                                <asp:ListItem Value="Event1" />
                                                <asp:ListItem Value="Event2" />
                                                <asp:ListItem Value="Event3" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <div class="input-group">
                                             <asp:Label ID="Label10" CssClass="label" runat="server" Text="T-shirt Size"></asp:Label>
                                        <asp:DropDownList 
                                            ID="VolunteerTshirtList" 
                                            runat="server"
                                            CssClass="js-example-basic-single"
                                            Width="50%">
                                            <asp:ListItem Value="Small" />
                                            <asp:ListItem Value="Medium" />
                                            <asp:ListItem Value="Large" />
                                        </asp:DropDownList>
                                    </div>
                                    </div>
                                </div>
                                <div class="row row-space">
                                    <div class="col-2">
                                <div class="input-group">
                                    <asp:Label ID="VolunteerTshirtColorLabel" CssClass="label" runat="server" Text="T-shirt Color"></asp:Label>
                                        <asp:DropDownList 
                                            ID="VolunteerTshirtColor" 
                                            runat="server"
                                            CssClass="js-example-basic-single"
                                            Width="50%">
                                            <asp:ListItem Value="Green" />
                                            <asp:ListItem Value="Blue" />
                                            <asp:ListItem Value="Red" />
                                        </asp:DropDownList>
                                         </div>
                                </div>
                                </div>
                            </div>
                                <div class="p-t-15">
                                    <asp:Button ID="Button3" runat="server" Text="Submit" CssClass="btn btn--radius-2 btn--blue"/>
                                </div> 
                        </asp:View>  
                        <asp:View runat="server">  
                            <div style="margin-top: 40px;"> 
                                <div class="input-group">
                                    <asp:Label ID="Label12" CssClass="label" runat="server" Text="Name: "></asp:Label>
                                    <asp:Label ID="Label13" CssClass="label" runat="server" Text="T-shirt Info:"></asp:Label>
                                    <asp:Label ID="Label14" CssClass="label" runat="server" Text="Assigned Events"></asp:Label>
                                </div>
                                <div class="input-group">
                                    <h2>Event Sign Up List</h2>
                                        <asp:DropDownList ID="VolunteerEventList"
                                            runat="server"
                                            Width="50%"
                                            CssClass="js-example-basic-single">
                                            <asp:ListItem Value="September 30th" />
                                            <asp:ListItem Value="October 1st" />
                                            <asp:ListItem Value="October 3rd" />
                                        </asp:DropDownList>
                                </div>
                            </div>  
                        </asp:View>  
                    </asp:MultiView>  
                  </div>
               </asp:View>
            <asp:View runat="server">
                   <div style="width: 100%; margin-left: 20px; margin-top: 50px; margin-right: 20px;"> 
                    <asp:Menu  
                        ID="CoordinatorMenu"  
                        CssClass="navb"
                        Orientation="Horizontal"  
                        Width="100%"  
                        Text-Align="center"
                        runat="server"  
                        OnMenuItemClick="CoordinatorMenu_MenuItemClick" StaticMenuItemStyle-CssClass="menuItems" StaticMenuStyle-CssClass="navb" StaticSelectedStyle-CssClass="menuItems" ClientIDMode="Static">
                        <Items >  
                            <asp:MenuItem  Text="New" Value="0"  Selected="true" />  
                            <asp:MenuItem Text="Existing" Value="1" />  
                        </Items>  
                    </asp:Menu> 
                    <asp:MultiView ID="CoordinatorMultiView" runat="server" ActiveViewIndex="0">  
                        <asp:View runat="server">  
                            <div style="margin-top: 40px;">  
                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group">
                                            <asp:Label ID="Label5" CssClass="label" runat="server" Text="First Name"></asp:Label>
                                            <asp:TextBox CssClass="input--style-4" ID="TextBox3" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <div class="input-group">
                                            <asp:Label ID="Label8" CssClass="label" runat="server" Text="Last Name"></asp:Label>
                                            <asp:TextBox CssClass="input--style-4" ID="TextBox4" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group">
                                             <asp:Label ID="Label11" CssClass="label" runat="server" Text="T-shirt Size"></asp:Label>
                                        <asp:DropDownList 
                                            ID="DropDownList4" 
                                            runat="server"
                                            CssClass="js-example-basic-single"
                                            Width="50%">
                                            <asp:ListItem Value="Small" />
                                            <asp:ListItem Value="Medium" />
                                            <asp:ListItem Value="Large" />
                                        </asp:DropDownList>
                                        </div>
                                    </div>
                                <div class="col-2">

                                <div class="input-group">
                                    <asp:Label ID="Label15" CssClass="label" runat="server" Text="T-shirt Color"></asp:Label>
                                        <asp:DropDownList 
                                            ID="DropDownList5" 
                                            runat="server"
                                            CssClass="js-example-basic-single"
                                            Width="50%">
                                            <asp:ListItem Value="Green" />
                                            <asp:ListItem Value="Blue" />
                                            <asp:ListItem Value="Red" />
                                        </asp:DropDownList>

                                </div>
                            </div>
                            </div>
                            </div>
                                <div class="p-t-15">
                                    <asp:Button ID="Button4" runat="server" Text="Submit" CssClass="btn btn--radius-2 btn--blue"/>
                                </div> 
                        </asp:View>  
                        <asp:View runat="server">  
                            <div style="margin-top: 40px;"> 
                                <div class="input-group">
                                    <asp:Label ID="Label16" CssClass="label" runat="server" Text="Name"></asp:Label>
                                    <asp:Label ID="Label17" CssClass="label" runat="server" Text="T shirt Info"></asp:Label>
                                    <asp:Label ID="Label19" CssClass="label" runat="server" Text="Contact For"></asp:Label>
                                </div>
                                <div class="input-group">
                                    <h2>Event Creation</h2>
                                        <asp:Label ID="Label9" CssClass="label"  runat="server" Text="Event Name"></asp:Label>
                                        <asp:TextBox ID="EventName"  CssClass="input--style-4" runat="server"></asp:TextBox>
                                        <asp:Label ID="Label18" CssClass="label" runat="server" Text="Event Date"></asp:Label>
                                        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                                </div>
                                <div class="input-group">
                                    <div class="p-t-10">
                                    <asp:Label ID="Label21" runat="server" CssClass="label" Text="Event Time"></asp:Label>
                                    <asp:RadioButtonList ID="EventTime" CssClass="radio-container"  runat="server">
                                        <asp:ListItem Text="9am" />
                                        <asp:ListItem Text="10am" />
                                        <asp:ListItem Text="11am" />
                                        <asp:ListItem Text="12pm" />
                                        <asp:ListItem Text="1pm" />
                                        <asp:ListItem Text="2pm" />
                                        <asp:ListItem Text="3pm" />
                                        <asp:ListItem Text="4pm" />
                                    </asp:RadioButtonList>
                                    </div>
                                </div>
                            </div>  
                        </asp:View>  
                    </asp:MultiView>  
                  </div>
               </asp:View>
            </asp:MultiView>
          </form>
         </div>
     </div>
    </div>
   </div>




</body>

</html>
