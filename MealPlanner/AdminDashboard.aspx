<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="MealPlanner.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Page</title>
    <link rel="stylesheet" href="AdminDasboard.css" />
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
                            <li><a href="MealInfo.aspx">MealInfo</a></li>
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
            <h2>Enter Meals Data</h2>
            <div class="prefer">
                <div>

                
                <asp:Label ID="Label1" runat="server" Text="Meal Name"></asp:Label>
                <br />
                <asp:TextBox ID="txt_mealname" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Meal Type"></asp:Label>
                <br />
                <asp:TextBox ID="txt_mealtype" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="Calories"></asp:Label>
                <br />
                <asp:TextBox ID="txt_calories" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label4" runat="server" Text="Protein"></asp:Label>
                <br />
                <asp:TextBox ID="txt_protein" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label5" runat="server" Text="Carbs"></asp:Label>
                <br />
                <asp:TextBox ID="txt_carbs" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label6" runat="server" Text="Fats"></asp:Label>
                    <br />
                    <asp:TextBox ID="txt_fats" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="meal_submit_button" runat="server" OnClick="meal_submit_button_Click1" Text="Submit" Cssclass="prefer_button"/>
                </div>
            </div>
            </div>
        </div>
    </form>
</body>
</html>
