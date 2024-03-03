using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace CarbonFootPrintCalculator
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load existing data when the page is first loaded
                LoadTransportData();
                LoadElectricityData();
            }
        }

        public void LoadTransportData()
        {
            gvTransportEmissions.DataSource = ReadTransportData();
            gvTransportEmissions.DataBind();
        }

        public void LoadElectricityData()
        {
            gvElectricityConsumption.DataSource = ReadElectricData();
            gvElectricityConsumption.DataBind();
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
    }
}
