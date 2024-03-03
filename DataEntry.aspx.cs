using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarbonFootPrintCalculator
{

    public partial class DataEntry : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlVehicleType_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the selected value from the DropDownList
            string selectedVehicleType = ddlVehicleType.SelectedValue;
        }

        protected void SubmitTransportData(object sender, EventArgs e)
        {
            // Read existing data
            List<TransportEntry> transportEntries = ReadTransportData();

            // Add new entry
            transportEntries.Add(new TransportEntry
            {
                VehicleType = ddlVehicleType.SelectedValue,
                Distance = Convert.ToDouble(txtDistance.Text),
                FuelType = ddlFuelType.SelectedValue,
                FuelEfficiency = Convert.ToDouble(txtFuelEfficiency.Text),
                EntryDate = DateTime.Now
            });

            // Save updated data
            WriteTransportData(transportEntries);

            // Reload data after submission

            Response.Redirect("~/Dashboard");
        }

        protected void SubmitElectricData(object sender, EventArgs e)
        {
            // Read existing data
            List<ElectricEntry> electricEntries = ReadElectricData();

            // Add new entry
            electricEntries.Add(new ElectricEntry
            {
                EnergySource = ddlEnergySource.SelectedValue,
                ElectricityUsage = Convert.ToDouble(txtElectricityUsage.Text),
                EntryDate = DateTime.Now
            });

            // Save updated data
            WriteElectricData(electricEntries);

            Response.Redirect("~/Dashboard");
        }

        private List<TransportEntry> ReadTransportData()
        {
            string filePath = Server.MapPath("~/User_data/transport_data.json");

            if (!File.Exists(filePath) || new FileInfo(filePath).Length == 0)
            {
                return new List<TransportEntry>();
            }

            string json = File.ReadAllText(filePath);

            try
            {
                return Newtonsoft.Json.JsonConvert.DeserializeObject<List<TransportEntry>>(json) ?? new List<TransportEntry>();
            }
            catch (Exception e)
            {
                Console.WriteLine($"Error during deserialization: {e.Message}");
                return new List<TransportEntry>();
            }
        }

        private void WriteTransportData(List<TransportEntry> entries)
        {
            string json = Newtonsoft.Json.JsonConvert.SerializeObject(entries);
            File.WriteAllText(Server.MapPath("~/User_data/transport_data.json"), json);
        }

        private List<ElectricEntry> ReadElectricData()
        {
            string filePath = Server.MapPath("~/User_data/electric_data.json");

            if (!File.Exists(filePath) || new FileInfo(filePath).Length == 0)
            {
                return new List<ElectricEntry>();
            }

            string json = File.ReadAllText(filePath);

            try
            {
                return Newtonsoft.Json.JsonConvert.DeserializeObject<List<ElectricEntry>>(json) ?? new List<ElectricEntry>();
            }
            catch (Exception e)
            {
                Console.WriteLine($"Error during deserialization: {e.Message}");
                return new List<ElectricEntry>();
            }
        }

        private void WriteElectricData(List<ElectricEntry> entries)
        {
            string json = Newtonsoft.Json.JsonConvert.SerializeObject(entries);
            File.WriteAllText(Server.MapPath("~/User_data/electric_data.json"), json);
        }


    }


    public class TransportEntry
    {
        public string VehicleType { get; set; }
        public double Distance { get; set; }
        public string FuelType { get; set; }
        public double FuelEfficiency { get; set; }
        public DateTime EntryDate { get; set; }
    }

    public class ElectricEntry
    {
        public string EnergySource { get; set; }
        public double ElectricityUsage { get; set; }
        public DateTime EntryDate { get; set; }
    }


}




