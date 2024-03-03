<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CarbonFootPrintCalculator.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
<!-- Display Transport Emissions Data -->
<h1> Transport Emissions </h1>
<asp:GridView runat="server" ID="gvTransportEmissions" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="VehicleType" HeaderText="Vehicle Type" />
        <asp:BoundField DataField="Distance" HeaderText="Distance" />
        <asp:BoundField DataField="FuelType" HeaderText="Fuel Type" />
        <asp:BoundField DataField="FuelEfficiency" HeaderText="Fuel Efficiency" />
        <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" />
    </Columns>
</asp:GridView>

<!-- Display Electricity Consumption Data -->
<h1> Electricity Emissions </h1>
<asp:GridView runat="server" ID="gvElectricityConsumption" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="EnergySource" HeaderText="Energy Source" />
        <asp:BoundField DataField="ElectricityUsage" HeaderText="Electricity Usage (kWh)" />
        <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" />
    </Columns>
</asp:GridView>
        </form>
</body>
</html>
