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
                CalculateAndDisplayCarbonFootprint();
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

        private double GetFuelFactor(string fuelType)
        {
            // Define carbon factors for different fuel types (adjust as needed)
            Dictionary<string, double> fuelFactors = new Dictionary<string, double>
            {
                { "Gasoline", 2.4 },
                { "Diesel", 2.7 },
                { "Petrol", 1.7 },
                { "Electric", 0.0 }
            };

            return fuelFactors.TryGetValue(fuelType, out double factor) ? factor : fuelFactors["Gasoline"];
        }


        private double CalculateTransportCarbonFootprint(List<TransportEntry> transportData)
        {
            double carbonFactorCar = 0.5;  
            double carbonFactorTruck = 0.7;  
            double carbonFactorBus = 0.6;  

            double totalFootprint = transportData.Sum(entry =>
            {
                double fuelFactor = GetFuelFactor(entry.FuelType);

                double distanceFactor = entry.FuelType == "Electric" ? entry.Distance * 2.35 : entry.Distance;
                double fuelEfficiencyFactor = entry.FuelEfficiency; 

                switch (entry.VehicleType)
                {
                    case "Car":
                        return fuelFactor * distanceFactor * fuelEfficiencyFactor * carbonFactorCar;

                    case "Truck":
                        return fuelFactor * distanceFactor * fuelEfficiencyFactor * carbonFactorTruck;

                    case "Bus":
                        return fuelFactor * distanceFactor * fuelEfficiencyFactor * carbonFactorBus;

                    default:
                        return 0.0; 
                }
            });

            return totalFootprint;
        }


        private double CalculateElectricityCarbonFootprint(List<ElectricEntry> electricData)
        {
            double carbonFactorGrid = 0.3;  
            double carbonFactorSolar = 0.1; 
            double carbonFactorWind = 0.2; 

            double totalFootprint = electricData.Sum(entry =>
            {
                double electricityFactor = entry.ElectricityUsage;

                switch (entry.EnergySource)
                {
                    case "Grid":
                        return electricityFactor * carbonFactorGrid;

                    case "Solar":
                        return electricityFactor * carbonFactorSolar;

                    case "Wind":
                        return electricityFactor * carbonFactorWind;

                    default:
                        return 0.0;  
                }
            });

            return totalFootprint;
        }
        

        private void CalculateAndDisplayCarbonFootprint()
        {
            // Calculate carbon footprint
            double totalTransportFootprint = CalculateTransportCarbonFootprint(ReadTransportData());
            double totalElectricityFootprint = CalculateElectricityCarbonFootprint(ReadElectricData());

            // Display the result
            lblTotalTransportFootprint.Text = $"Total Transport Footprint = {totalTransportFootprint:F2} metric tons of CO2";
            lblTotalElectricityFootprint.Text = $"Total Electricity Footprint = {totalElectricityFootprint:F2} metric tons of CO2";
        }

    }
}
