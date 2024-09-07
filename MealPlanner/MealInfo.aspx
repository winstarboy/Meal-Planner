<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MealInfo.aspx.cs" Inherits="MealPlanner.MealInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>MealInfo</h1>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MealId" DataSourceID="SqlDataSource1">
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Meals]"></asp:SqlDataSource>
        </p>
    </div>
    </form>
</body>
</html>
