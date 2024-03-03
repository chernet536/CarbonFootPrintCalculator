<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CarbonFootPrintCalculator.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <main aria-labelledby="title" class="d-flex justify-content-center align-items-center min-vh-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <section id="registrationForm">
                        <div class="card">
                            <h4 class="card-header text-center"> Registration </h4>
                            <div class="card-body regCard text-center">
                                <asp:PlaceHolder runat="server" ID="PlaceHolder1" Visible="false">
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
                                    <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-3 col-form-label">Confirm password</asp:Label>
                                    <div class="col-md-9">
                                        <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                                        <asp:CompareValidator runat="server" ControlToCompare="txtPassword" ControlToValidate="ConfirmPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="offset-md-2 col-md-9 mt-3">
                                        <p>
                                            <span class="btn btn-link">
                                                Already have an account? <asp:HyperLink runat="server" ID="LoginHyperLink" NavigateUrl="~/Account/Login" Text="Login here" CssClass="register-link" />
                                            </span>
                                        </p>
                                    </div>
                                </div>

                                <div class="form-group row reg-form-group">
                                    <div class="offset-md-2 col-md-9">
                                        <asp:Button runat="server" OnClick="createUser" Text="Register" CssClass="btn btn-primary" />
                                    </div>
                                </div>

                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </main>
</asp:Content>

