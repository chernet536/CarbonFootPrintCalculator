using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using CarbonFootPrintCalculator.Models;
using System.Collections.Generic;
using System.IO;

namespace CarbonFootPrintCalculator.Account
{
    public partial class Register : Page
    {
        protected void createUser(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            // Check if the user already exists
            if (!UserExists(email))
            {
                // Register the user
                RegisterUser(email, password);
                Response.Redirect("Login"); // Redirect to login after registration
            }
            else
            {
                // User already exists, show an error message or handle accordingly
            }
        }

        private bool UserExists(string email)
        {
            // Check if the user already exists in the JSON file
            List<User> users = ReadUsersFromFile();
            return users.Exists(u => u.Email == email);
        }

        private void RegisterUser(string email, string password)
        {
            // Create a new user and add to the list
            List<User> users = ReadUsersFromFile();
            users.Add(new User { Email = email, Password = password });
            WriteUsersToFile(users);
        }

        private List<User> ReadUsersFromFile()
        {
            // Read user data from the JSON file
            string filePath = Server.MapPath("~/User_data/User.json");

            if (!File.Exists(filePath) || new FileInfo(filePath).Length == 0)
            {
                // File is empty or does not exist, return an empty list
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
                Console.WriteLine($"Error during deserialization: {e.Message}");
                return new List<User>();
            }
        }


        private void WriteUsersToFile(List<User> users)
        {
            // Write the combined user data back to the JSON file
            string json = Newtonsoft.Json.JsonConvert.SerializeObject(users);
            File.WriteAllText(Server.MapPath("~/User_data/User.json"), json);
        }

    }

    public class User
    {
        public string Email { get; set; }
        public string Password { get; set; }
    }

}
