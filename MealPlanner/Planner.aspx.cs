using System;
using System.Data.SqlClient;

namespace MealPlanner
{
    public partial class Planner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Email"] == null)
                {
                    Response.Redirect("Login.aspx"); // Redirect to login page if no session exists
                }
                else
                {
                    lblUserName.Text = Session["Name"].ToString();
                    SetCalorieGoalParameter();
                }
            }
        }

        protected void logout_button_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        private void SetCalorieGoalParameter()
        {
            // Get the CalorieIntakeGoal from the session
            if (Session["CalorieIntakeGoal"] != null)
            {
                int calorieGoal = Convert.ToInt32(Session["CalorieIntakeGoal"]);
                SqlDataSource1.SelectParameters["CalorieGoal"].DefaultValue = calorieGoal.ToString();
            }
            else
            {
                // Handle case where CalorieIntakeGoal is not set
                string script = "alert('Calorie intake goal is not set. Please set your preferences.');";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
            }
        }
    }
}
