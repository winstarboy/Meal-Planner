<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MealPlanner.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link rel="stylesheet" href="Login.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <h1 class="header">Plan your meal nutritious!</h1>
            <div class="register_container">
                <div class="register_wrapper">
                    <div>
                        <h3 class="register_header">Login</h3>
                    </div>
                    <div class="label_wrapper">
                        <div class="label_name">
                            <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="log_email" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="label_name">
                            <asp:TextBox ID="log_email" runat="server" CssClass="input-size"></asp:TextBox>
                        </div>
                        <p>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="log_email" ErrorMessage="Enter a valid email address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </p>
                    </div>
                    <div class="label_wrapper">
                        <div class="label_name">
                            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="log_password" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="label_name">
                            <asp:TextBox ID="log_password" runat="server" CssClass="input-size"></asp:TextBox>
                        </div>
                        <p>&nbsp;</p>
                    </div>
                    <div class="register_button">
                        <asp:Button ID="log_button" CssClass="reg_button" runat="server" Text="Submit" OnClick="log_button_Click" />
                    </div>
                    <div class="check_user">
                        <p class="user-already">New user? </p>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx" CssClass="center-hyperlink">Click here to Signup</asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
