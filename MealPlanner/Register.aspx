<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MealPlanner.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register now!</title>
    <link rel="stylesheet" href="Register.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="header">Plan your meal nutritious!</h1>
            <div class="register_container">
                <div class="register_wrapper">
                    <div>
                        <h3 class="register_header">SIGN UP</h3>
                    </div>
                    <div class="label_wrapper">
                        <div class="label_name">
                            <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_name" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="label_name">
                            <asp:TextBox ID="txt_name" runat="server" CssClass="input-size"></asp:TextBox>
                        </div>
                        <p>&nbsp;</p>
                    </div>
                    <div class="label_wrapper">
                        <div class="label_name">
                            <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_email" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="label_name">
                            <asp:TextBox ID="txt_email" runat="server" CssClass="input-size"></asp:TextBox>
                        </div>
                        <p>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email" ErrorMessage="Enter a valid email address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </p>
                    </div>
                    <div class="label_wrapper">
                        <div class="label_name">
                            <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_password" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="label_name">
                            <asp:TextBox ID="txt_password" runat="server" CssClass="input-size"></asp:TextBox>
                        </div>
                        <p>&nbsp;</p>
                    </div>
                    <div class="label_wrapper">
                        <div class="label_name">
                            <asp:Label ID="Label4" runat="server" Text="Confirm Password"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_cmpassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="label_name">
                            <asp:TextBox ID="txt_cmpassword" runat="server" CssClass="input-size"></asp:TextBox>
                        </div>
                        <p><asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_password" ControlToValidate="txt_cmpassword" ErrorMessage="Password do not Match!" ForeColor="#CC0000"></asp:CompareValidator>
                        </p>
                    </div>
                    <div class="register_button">
                        <asp:Button ID="reg_button" CssClass="reg_button" runat="server" Text="Submit" OnClick="Button1_Click" />
                    </div>
                    <div class="check_user">
                        <p class="user-already">Already a user? </p>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx" CssClass="center-hyperlink">Click here to Login</asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
