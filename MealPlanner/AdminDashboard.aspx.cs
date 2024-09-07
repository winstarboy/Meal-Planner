using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace MealPlanner
{
    public partial class AdminDashboard : System.Web.UI.Page
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

        protected void meal_submit_button_Click1(object sender, EventArgs e)
        {
             string ins = "INSERT INTO [Meals] (MealName, MealType, Calories, Protein, Carbs, Fats) VALUES (@MealName, @MealType, @Calories, @Protein, @Carbs, @Fats)";

            using (SqlCommand com = new SqlCommand(ins, con))
            {
                com.Parameters.AddWithValue("@MealName", txt_mealname.Text);
                com.Parameters.AddWithValue("@MealType", txt_mealtype.Text);
                com.Parameters.AddWithValue("@Calories", Convert.ToInt64(txt_calories.Text)); // Ensure this is a numeric type
                com.Parameters.AddWithValue("@Protein", Convert.ToInt32(txt_protein.Text));
                com.Parameters.AddWithValue("@Carbs", Convert.ToInt32(txt_carbs.Text)); // Ensure this is an int type
                com.Parameters.AddWithValue("@Fats", Convert.ToInt32(txt_fats.Text)); // Ensure this is an int type

                try
                {
                    con.Open();
                    com.ExecuteNonQuery();
                    con.Close();
                    string script = "alert('Submitted successful!'); window.location.href = 'MealInfo.aspx';";
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
