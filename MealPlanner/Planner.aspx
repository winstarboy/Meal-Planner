<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Planner.aspx.cs" Inherits="MealPlanner.Planner" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Planner</title>
     <link rel="stylesheet" href="Planner.css" />
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
            <h2>Planner</h2>
            <p>
                <asp:GridView ID="gvMeals" runat="server" AutoGenerateColumns="True" DataKeyNames="MealId" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="MealId" HeaderText="MealId" InsertVisible="False" ReadOnly="True" SortExpression="MealId" />
                        <asp:BoundField DataField="MealName" HeaderText="MealName" SortExpression="MealName" />
                        <asp:BoundField DataField="MealType" HeaderText="MealType" SortExpression="MealType" />
                        <asp:BoundField DataField="Calories" HeaderText="Calories" SortExpression="Calories" />
                        <asp:BoundField DataField="Protein" HeaderText="Protein" SortExpression="Protein" />
                        <asp:BoundField DataField="Carbs" HeaderText="Carbs" SortExpression="Carbs" />
                        <asp:BoundField DataField="Fats" HeaderText="Fats" SortExpression="Fats" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT MealId, MealName, MealType, Calories, Protein, Carbs, Fats FROM Meals WHERE Calories <= @CalorieGoal">
                        <SelectParameters>
                            <asp:Parameter Name="CalorieGoal" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
            </p>
            
        </div>
        </div>
    </form>
</body>
</html>
