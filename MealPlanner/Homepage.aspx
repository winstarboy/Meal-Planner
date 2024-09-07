<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="MealPlanner.Homepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Meal Planner</title>
    <link rel="stylesheet" href="Homepage.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="home_container">
            <div class="home_header">
               <div class="logo">
                   <p>Meal Planner</p>
               </div>
                <div class="tabs_middle">
                    <nav>
                        <ul>
                            <li><a href="Homepage.aspx">Home</a></li>
                            <li><a href="Planner.aspx">Planner</a></li>
                            <li><a href="Contact.aspx">Contact</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="logout">
                    <asp:Button ID="logout_button" runat="server" Text="Logout" CssClass ="logout_button" OnClick="logout_button_Click" />
                </div>
            </div>
        </div>
       
        
         <div class="home_main">
        <div class="welcome_user">
            <h1>Welcome, <span class="user_name"><asp:Literal ID="lblUserName" runat="server" ></asp:Literal>!</span></h1>
        </div>
        <div class="intake_goal">
            <h2>Let's fill your preferences</h2>
            <div class="prefer">
                <div>

                
                <asp:Label ID="Label1" runat="server" Text="Diet Type"></asp:Label>
                <br />
                <asp:TextBox ID="txt_diettype" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Allergies"></asp:Label>
                <br />
                <asp:TextBox ID="txt_allergies" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="Calorie Intake Goal"></asp:Label>
                <br />
                <asp:TextBox ID="txt_calorie" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label4" runat="server" Text="Height"></asp:Label>
                <br />
                <asp:TextBox ID="txt_height" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label5" runat="server" Text="Weight"></asp:Label>
                <br />
                <asp:TextBox ID="txt_weight" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="prefer_button" runat="server" OnClick="prefer_button_Click1" Text="Submit" Cssclass="prefer_button"/>
                </div>
            </div>
            </div>
        </div>
    </form>
</body>
</html>
