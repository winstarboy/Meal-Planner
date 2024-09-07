using System;
using System.Web.UI;
using System.Data.SqlClient;

namespace MealPlanner
{
    public partial class Homepage : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|\\MealPlanner.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("Login.aspx");  // Redirect to login page if no session exists
            }
            else
            {
                // Display the user's name
                lblUserName.Text = Session["Name"].ToString();
            }
        }

        protected void logout_button_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void prefer_button_Click1(object sender, EventArgs e)
        {
            string ins = "INSERT INTO [Prefer] (DietType, Allergies, Calorie_Intake_Goal, Email, Height, Weight) VALUES (@DietType, @Allergies, @Calorie_Intake_Goal, @Email, @Height, @Weight)";

            using (SqlCommand com = new SqlCommand(ins, con))
            {
                com.Parameters.AddWithValue("@DietType", txt_diettype.Text);
                com.Parameters.AddWithValue("@Allergies", txt_allergies.Text);
                com.Parameters.AddWithValue("@Calorie_Intake_Goal", Convert.ToInt64(txt_calorie.Text)); // Ensure this is a numeric type
                com.Parameters.AddWithValue("@Email", Session["Email"].ToString()); // Ensure this is a string type
                com.Parameters.AddWithValue("@Height", Convert.ToInt32(txt_height.Text)); // Ensure this is an int type
                com.Parameters.AddWithValue("@Weight", Convert.ToInt32(txt_weight.Text)); // Ensure this is an int type

                try
                {
                    con.Open();
                    com.ExecuteNonQuery();
                    con.Close();
                    // Store Calorie Intake Goal in Session
                    Session["CalorieIntakeGoal"] = Convert.ToInt64(txt_calorie.Text);
                    string script = "alert('Submitted successful!'); window.location.href = 'Planner.aspx';";
                    ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
                }
                catch (Exception ex)
                {
                    // Escape single quotes in error message
                    string errorMessage = ex.Message.Replace("'", "\\'");
                    string script = "alert('An error occurred: " + errorMessage + "');";
                    ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
                }
            }
        }

    }
}
