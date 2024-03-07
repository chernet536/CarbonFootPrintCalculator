<%@ Page Title="Data Entry" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DataEntry.aspx.cs" Inherits="CarbonFootPrintCalculator.DataEntry" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <main aria-labelledby="title" class="d-flex justify-content-center align-items-center min-vh-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <section class="section">
                        <div class="card">
                            <h1 class="card-header text-center">Transport Emissions</h1>
                            <div class="card-body text-center">

                                <!-- Transport Emissions Form Controls -->
                                <label for="ddlVehicleType"> Vehicle Type: </label>
                                <asp:DropDownList runat="server" ID="ddlVehicleType" OnSelectedIndexChanged="ddlVehicleType_SelectedIndexChanged">
                                    <asp:ListItem Text="Car" Value="Car" />
                                    <asp:ListItem Text="Truck" Value="Truck" />
                                    <asp:ListItem Text="Bus" Value="Bus" />
                                </asp:DropDownList>

                                <label for="txtDistance"> Distance Travelled (in km): </label>
                                <asp:TextBox runat="server" ID="txtDistance"></asp:TextBox>

                                <label for="ddlFuelType"> Fuel type the vehicle consumes: </label>
                                <asp:DropDownList runat="server" ID="ddlFuelType">
                                    <asp:ListItem Text="Gasoline" Value="Gasoline" />
                                    <asp:ListItem Text="Diesel" Value="Diesel" />
                                    <asp:ListItem Text="Petrol" Value="Petrol" />
                                    <asp:ListItem Text="Electric" Value="Electric" />
                                </asp:DropDownList>

                                <label for="txtFuelEfficiency">Fuel Efficiency (Litres per Kilometer):</label>
                                <asp:TextBox runat="server" ID="txtFuelEfficiency"></asp:TextBox>
                                <asp:Button runat="server" OnClick="SubmitTransportData" class="btn btn-primary btn-md" Text="Submit" />
                            </div>
                        </div>
                    </section>
                </div>

                <div class="col-md-6">
                    <section class="section">
                        <div class="card">
                            <h1 class="card-header text-center">Electricity Emissions</h1>
                            <div class="card-body text-center">

                                <!-- Electricity Emissions Form Controls -->
                                <label for="ddlEnergySource"> Energy Source: </label>
                                <asp:DropDownList runat="server" ID="ddlEnergySource">
                                    <asp:ListItem Text="Grid" Value="Grid" />
                                    <asp:ListItem Text="Solar" Value="Solar" />
                                    <asp:ListItem Text="Wind" Value="Wind" />
                                </asp:DropDownList>
                                <label for="txtElectricityUsage"> Electricity Usage (Kilowatt-Hours): </label>
                                <asp:TextBox runat="server" ID="txtElectricityUsage"></asp:TextBox>
                                <asp:Button runat="server" OnClick="SubmitElectricData" class="btn btn-primary btn-md" Text="Submit" />
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </main>
</asp:Content>

