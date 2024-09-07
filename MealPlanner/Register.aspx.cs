using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace MealPlanner
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|\\MealPlanner.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string ins = "Insert into [Table](Name, Email, Password, Confirm_Password) values(@Name, @Email, @Password, @Confirm_Password)";
            using (SqlCommand com = new SqlCommand(ins, con))
            {
                com.Parameters.AddWithValue("@Name", txt_name.Text);
                com.Parameters.AddWithValue("@Email", txt_email.Text);
                com.Parameters.AddWithValue("@Password", txt_password.Text);
                com.Parameters.AddWithValue("@Confirm_Password", txt_cmpassword.Text);

                try
                {
                    con.Open();
                    com.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Register successful!'); window.location.href = 'Login.aspx';</script>");
                }
                catch (Exception ex)
                {
                    string errorMessage = ex.Message.Replace("'", "\\'");
                    Response.Write("<script>alert('An error occurred: " + errorMessage + "');</script>");
                }
            }
        }

    }
}