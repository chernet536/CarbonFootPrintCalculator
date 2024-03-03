<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CarbonFootPrintCalculator.Account.Login" Async="true" Debug="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <main aria-labelledby="title">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <section id="loginForm">
                        <div class="card">
                            <h4 class="card-header text-center"> Authentication </h4>
                            <div class="card-body text-center">
                                <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                    <p class="text-danger">
                                        <asp:Literal runat="server" ID="FailureText" />
                                    </p>
                                </asp:PlaceHolder>
                                <div class="form-group row">
                                    <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-md-3 col-form-label">Email</asp:Label>
                                    <div class="col-md-9">
                                        <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" TextMode="Email" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" CssClass="text-danger" ErrorMessage="The email field is required." />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <asp:Label runat="server" AssociatedControlID="txtPassword" CssClass="col-md-3 col-form-label">Password</asp:Label>
                                    <div class="col-md-9">
                                        <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" CssClass="text-danger" ErrorMessage="The password field is required." />
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="offset-md-3 col-md-8">
                                        <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-primary" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                             <div class="offset-md-3 col-md-10 mt-3">
                                  <p>
                                     <span class="btn btn-link">
                                           New user? <asp:HyperLink runat="server" ID="RegisterHyperLink" NavigateUrl="~/Account/Register" Text="Register here" CssClass="register-link"/>
                                      </span>
                                  </p>
                             </div>
                       </div>
                    </section>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
