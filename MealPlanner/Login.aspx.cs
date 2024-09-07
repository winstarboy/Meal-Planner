using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace MealPlanner
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|\\MealPlanner.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

         protected void log_button_Click(object sender, EventArgs e)
        {
            // Get email and password from the input fields
            string email = log_email.Text.Trim();
            string password = log_password.Text.Trim();

            // Log input values for debugging
            System.Diagnostics.Debug.WriteLine("Email: " + email);
            System.Diagnostics.Debug.WriteLine("Password: " + password);

            // Query to check if the user exists and retrieve the Name and isAdmin status
            string check = "SELECT COUNT(*), Name, isAdmin FROM [Table] WHERE Email = @Email AND Password = @Password GROUP BY Name, isAdmin";
            using (SqlCommand com = new SqlCommand(check, con))
            {
                // Add email and password parameters to the SQL command
                com.Parameters.AddWithValue("@Email", email);
                com.Parameters.AddWithValue("@Password", password);

                try
                {
                    // Open the connection to the database
                    con.Open();

                    // Execute the SQL command
                    using (SqlDataReader reader = com.ExecuteReader())
                    {
                        // If a matching record is found
                        if (reader.Read())
                        {
                            int temp = Convert.ToInt32(reader[0]);
                            string name = reader["Name"].ToString();  // Get the user's name from the database
                            int isAdmin = Convert.ToInt32(reader["isAdmin"]);

                            // If user exists (temp == 1), proceed with login
                            if (temp == 1)
                            {
                                // Store user's email and name in session variables
                                Session["Email"] = email;
                                Session["Name"] = name;

                                // If the user is an admin, redirect to the Admin Dashboard
                                if (isAdmin == 1)
                                {
                                    Response.Write("<script>alert('Admin Login successful!'); window.location.href = 'AdminDashboard.aspx';</script>");
                                }
                                // Otherwise, redirect to the Homepage
                                else
                                {
                                    Response.Write("<script>alert('Login successful!'); window.location.href = 'Homepage.aspx';</script>");
                                }
                            }
                            else
                            {
                                // Display an error message if login fails
                                Response.Write("<script>alert('Login unsuccessful. Please check your email and password.');</script>");
                            }
                        }
                        else
                        {
                            // Display an error message if no matching record is found
                            Response.Write("<script>alert('Login unsuccessful. Please check your email and password.');</script>");
                        }
                    }

                    // Close the database connection
                    con.Close();
                }
                catch (Exception ex)
                {
                    // Handle any exceptions that occur during the database operation
                    string errorMessage = ex.Message.Replace("'", "\\'");
                    Response.Write("<script>alert('An error occurred: " + errorMessage + "');</script>");
                }
            }
        }
    }
}