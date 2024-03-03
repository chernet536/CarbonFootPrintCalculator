<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataEntry.aspx.cs" Inherits="CarbonFootPrintCalculator.DataEntry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
<!-- Transport Emissions Section -->
<h1> Transport Emissions </h1>
<label for="ddlVehicleType">Vehicle Type:</label>
<asp:DropDownList runat="server" ID="ddlVehicleType" OnSelectedIndexChanged="ddlVehicleType_SelectedIndexChanged">
    <asp:ListItem Text="Car" Value="Car" />
    <asp:ListItem Text="Truck" Value="Truck" />
    <asp:ListItem Text="Bus" Value="Bus" />
</asp:DropDownList>

<label for="txtDistance"> Distance Travelled (in km):</label>
<asp:TextBox runat="server" ID="txtDistance"></asp:TextBox>

<label for="ddlFuelType">Fuel Type:</label>
<asp:DropDownList runat="server" ID="ddlFuelType">
    <asp:ListItem Text="Gasoline" Value="Gasoline" />
    <asp:ListItem Text="Diesel" Value="Diesel" />
    <asp:ListItem Text="Petrol" Value="Petrol" />
    <asp:ListItem Text="Electric" Value="Electric" />
</asp:DropDownList>

<label for="txtFuelEfficiency"> Fuel Efficiency (Gallons per Mile or Kilometer):</label>
<asp:TextBox runat="server" ID="txtFuelEfficiency"></asp:TextBox>

<asp:Button runat="server" OnClick="SubmitTransportData" Text="Submit" />

<!-- Electricity Consumption Section -->
<h1> Electricity Emissions </h1>
<label for="ddlEnergySource"> Energy Source:</label>
<asp:DropDownList runat="server" ID="ddlEnergySource">
    <asp:ListItem Text="Grid" Value="Grid" />
    <asp:ListItem Text="Solar" Value="Solar" />
    <asp:ListItem Text="Wind" Value="Wind" />
</asp:DropDownList>

<label for="txtElectricityUsage"> Electricity Usage (Kilowatt-Hours):</label>
<asp:TextBox runat="server" ID="txtElectricityUsage"></asp:TextBox>

<asp:Button runat="server" OnClick="SubmitElectricData" Text="Submit" />

        </form>
</body>
</html>

