<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CarbonFootPrintCalculator._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<main>
    <div class="container">
        <div class="row row-body" aria-labelledby="title">
            <div class="col-md-6 content">
                <h1 id="title">Carbon Foot Print Tracker Application</h1>
                <p> <br /> </p>
                <p class="lead">A carbon footprint is the total amount of greenhouse gases, specifically carbon dioxide and other carbon compounds, that are emitted directly or indirectly by an individual, organization, event, or product throughout its lifecycle. It is typically measured in units of carbon dioxide equivalents (CO2e) to account for the different global warming potentials of various greenhouse gases.</p>
                <p><a href="/About" class="btn btn-primary btn-md"> Learn more &raquo;</a></p>
            </div>
            <div class="col-md-6">
                <img src="https://irp-cdn.multiscreensite.com/3751a175/dms3rep/multi/desktop/Carbon+Footprint.jpg" alt="" class="img-fluid img-footprint" />
            </div>
        </div>
    </div>
</main>


</asp:Content>
