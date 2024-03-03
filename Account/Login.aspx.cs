using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using CarbonFootPrintCalculator.Models;
using CarbonFootPrintCalculator.Account;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Diagnostics;

namespace CarbonFootPrintCalculator.Account
{
    public partial class Login : Page
    {

        protected void LogIn(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string email = txtEmail.Text;
                string password = txtPassword.Text;

                // Check if the provided credentials are valid
                if (ValidateLogin(email, password))
                {
                    // Redirect to another page upon successful login
                    Response.Redirect("~/DataEntry");
                }
                else
                {
                    // Show an error message or handle unsuccessful login
                    Debug.WriteLine("Login failed");
                }
            }
            else {
                Console.WriteLine("Not Valid");
            }
        }


        private bool ValidateLogin(string email, string password)
        {
            // Check if the provided credentials match any user in the JSON file
            Debug.WriteLine($"Provided Email: {email}");
            Debug.WriteLine($"Provided Password: {password}");

            List<User> users = ReadUsersFromFile();

            foreach (var user in users)
            {
                Debug.WriteLine($"Stored User Email: {user.Email}");
                Debug.WriteLine($"Stored User Password: {user.Password}");
            }

            return users.Any(u => u.Email.Equals(email, StringComparison.OrdinalIgnoreCase) && u.Password.Equals(password));
        }


        private List<User> ReadUsersFromFile()
        {
            // Read user data from the JSON file
            string filePath = Server.MapPath("~/User_data/User.json");

            if (!File.Exists(filePath) || new FileInfo(filePath).Length == 0)
            {
                // File is empty or does not exist, return an empty list
                Debug.WriteLine("No data");
                return new List<User>();
            }

            string json = File.ReadAllText(filePath);

            try
            {
                // Attempt to deserialize the JSON
                return Newtonsoft.Json.JsonConvert.DeserializeObject<List<User>>(json) ?? new List<User>();
            }
            catch (Exception e)
            {
                // Handle deserialization error (e.g., invalid JSON format)
                Debug.WriteLine($"Error: {e.Message}");
                return new List<User>();
            }
        }

    }
}
