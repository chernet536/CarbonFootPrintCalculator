<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CarbonFootPrintCalculator.Dashboard" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <main aria-labelledby="title" class="d-flex justify-content-center align-items-center min-vh-100">
        <div class="container dashboard">
            <div class="row">

                <!-- Transport Emissions Section -->
                <div class="col-md-7 mb-4">
                    <div class="card">
                        <h1 class="card-header text-center">Transport Emissions</h1>
                        <div class="card-body text-center">

                            <!-- Transport Emissions Form Controls -->
                            <asp:GridView runat="server" ID="gvTransportEmissions" AutoGenerateColumns="False" CssClass="table table-striped">
                                <Columns>
                                    <asp:BoundField DataField="VehicleType" HeaderText="Vehicle Type" />
                                    <asp:BoundField DataField="Distance" HeaderText="Distance" />
                                    <asp:BoundField DataField="FuelType" HeaderText="Fuel Type" />
                                    <asp:BoundField DataField="FuelEfficiency" HeaderText="Fuel Efficiency" />
                                    <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" />
                                </Columns>
                            </asp:GridView>
                            <asp:Label runat="server" ID="lblTotalTransportFootprint" CssClass="mt-3" Text=""></asp:Label>
                        </div>
                    </div>
                </div>

                <!-- Electricity Consumption Section -->
                <div class="col-md-5 mb-4">
                    <div class="card">
                        <h1 class="card-header text-center">Electricity Usage</h1>
                        <div class="card-body text-center">

                            <!-- Electricity consumption Form Controls -->
                            <asp:GridView runat="server" ID="gvElectricityConsumption" AutoGenerateColumns="False" CssClass="table table-striped">
                                <Columns>
                                    <asp:BoundField DataField="EnergySource" HeaderText="Energy Source" />
                                    <asp:BoundField DataField="ElectricityUsage" HeaderText="Electricity Usage (kWh)" />
                                    <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" />
                                </Columns>
                            </asp:GridView>
                            <asp:Label runat="server" ID="lblTotalElectricityFootprint" CssClass="mt-3" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
