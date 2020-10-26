<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CIS484Solution1.WebForm1" %>

<asp:Content ID="HomepageContent" ContentPlaceHolderID="HomePlaceHolder" runat="server">
    <script>
        var slideIndex = 1;
        showSlides(slideIndex);

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            if (n > slides.length) { slideIndex = 1 }
            if (n < 1) { slideIndex = slides.length }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
        }

        var acc = document.getElementsByClassName("accordion");
        var i;

        for (i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", function () {
                /* Toggle between adding and removing the "active" class,
                to highlight the button that controls the panel */
                this.classList.toggle("active");

                /* Toggle between hiding and showing the active panel */
                var panel = this.nextElementSibling;
                if (panel.style.display === "block") {
                    panel.style.display = "none";
                } else {
                    panel.style.display = "block";
                }
            });
        }
    </script>
    <div class="container" style="width: 100%; margin-left: 20px; margin-top: 20px; margin-right: 20px;">
        <div class="form-group">
            <h2 style="text-align: center">Welcome to Cyber Day 2021</h2>
            <div class="slideshow-container">
                <div class="mySlides fade">
                    <div class="numbertext">1 / 4</div>
                    <img src="./images/Picture1.jpg" style="width: 100%">
                    <div class="text">Share your excitement in the field of computer information systems and cultivate the interests of young people in future business/technology related careers</div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext">2 / 4</div>
                    <img src="./images/Picture2.jpg" style="width: 100%">
                    <div class="text">You will learn to develop advanced competencies and diagnostic skills to correct software problems</div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext">3 / 4</div>
                    <img src="./images/Picture3.jpg" style="width: 100%">
                    <div class="text">Learning, fun and interative</div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext">4 / 4</div>
                    <img src="./images/Picture4.jpg" style="width: 100%">
                    <div class="text">Get hands on experience</div>
                </div>

                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>
            </div>
            <br>
            <div style="text-align: center">
                <span class="dot" onclick="currentSlide(1)"></span>
                <span class="dot" onclick="currentSlide(2)"></span>
                <span class="dot" onclick="currentSlide(3)"></span>
                <span class="dot" onclick="currentSlide(4)"></span>
            </div>
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
        <br />
        <br />
        <iframe width="560" height="315" src="https://www.youtube.com/embed/Ics5sqhAVm8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        <br />
        <br />
        <div id="accordion-div">
            <h3>FAQ</h3>
            <button type="button" class="accordion">Who signs up the students?</button>
            <div class="panel">
                <p class="answer">Teachers/Admins will send information out to the parents, Parents can then sign  their kid's up for Cyber Day</p>
            </div>

            <button type="button" class="accordion">What does Cyberday consist of?</button>
            <div class="panel">
                <p class="answer">Computer programming activities, Team building exercises, and Lunch</p>
            </div>

            <button type="button" class="accordion">What age is this event catered for?</button>
            <div class="panel">
                <p class="answer">This event typically caters to Middle Schoolers aged 10-12</p>
            </div>
            <button type="button" class="accordion">Want your organization to join? Sign up here</button>
            <div class="panel">
                <div class="answer">
                    <div class="form-group">
                        <%--            <h2 style="text-align: center">Want your organization to join a cyber day? Submit a request here</h2>--%>
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
            </div>
        </div>
    </div>
    <style>
        * {
            box-sizing: border-box
        }

        body {
            font-family: Verdana, sans-serif;
            margin: 0
        }

        .mySlides {
            display: none
        }

        img {
            vertical-align: middle;
        }

        /* Slideshow container */
        .slideshow-container {
            max-width: 1000px;
            position: relative;
            margin-top: 50px !important;
            margin: auto;
        }

        /* Next & previous buttons */
        .prev, .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            padding: 16px;
            margin-top: -22px;
            color: white;
            font-weight: bold;
            font-size: 18px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
            user-select: none;
        }

        /* Position the "next button" to the right */
        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

            /* On hover, add a black background color with a little bit see-through */
            .prev:hover, .next:hover {
                background-color: rgba(0,0,0,0.8);
            }

        /* Caption text */
        .text {
            color: #f2f2f2;
            background-color: black;
            font-size: 15px;
            padding: 8px 12px;
            position: absolute;
            bottom: 8px;
            width: 100%;
            text-align: center;
        }

        /* Number text (1/3 etc) */
        .numbertext {
            color: #f2f2f2;
            font-size: 12px;
            padding: 8px 12px;
            position: absolute;
            top: 0;
        }

        /* The dots/bullets/indicators */
        .dot {
            cursor: pointer;
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
        }

            .active, .dot:hover {
                background-color: #717171;
            }

        /* Fading animation */
        .fade {
            -webkit-animation-name: fade;
            -webkit-animation-duration: 1.5s;
            animation-name: fade;
            animation-duration: 1.5s;
            animation-fill-mode: forwards;
        }

        @-webkit-keyframes fade {
            from {
                opacity: .4
            }

            to {
                opacity: 1
            }
        }

        @keyframes fade {
            from {
                opacity: .4
            }

            to {
                opacity: 1
            }
        }

        /* Style the buttons that are used to open and close the accordion panel */
        .accordion {
            background-color: #eee;
            color: #444;
            cursor: pointer;
            padding: 18px;
            width: 100%;
            text-align: left;
            border: none;
            outline: none;
            transition: 0.4s;
        }

            /* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */
            .active, .accordion:hover {
                background-color: #ccc;
            }

        /* Style the accordion panel. Note: hidden by default */
        .panel {
            padding: 0 18px;
            background-color: white;
            display: none;
            overflow: hidden;
        }

        .answer {
            margin: 20px;
            height: 100%;
        }
    </style>
    <script>
        var slideIndex = 1;
        showSlides(slideIndex);

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            if (n > slides.length) { slideIndex = 1 }
            if (n < 1) { slideIndex = slides.length }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
        }

        var acc = document.getElementsByClassName("accordion");
        var i;

        for (i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", function () {
                /* Toggle between adding and removing the "active" class,
                to highlight the button that controls the panel */
                this.classList.toggle("active");

                /* Toggle between hiding and showing the active panel */
                var panel = this.nextElementSibling;
                if (panel.style.display === "block") {
                    panel.style.display = "none";
                } else {
                    panel.style.display = "block";
                }
            });
        }
    </script>
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
    <div runat="server" id="div1" style="margin-top: 40px; display: none;">
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