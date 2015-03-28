﻿<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="TicketingManagement.Account.Register" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:CreateUserWizard ID="CreateUser" runat="server" EnableViewState="false" >
        <LayoutTemplate>
            <asp:PlaceHolder ID="wizardStepPlaceholder" runat="server"></asp:PlaceHolder>
            <asp:PlaceHolder ID="navigationPlaceholder" runat="server"></asp:PlaceHolder>
        </LayoutTemplate>
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep" runat="server">
                <ContentTemplate>
                    <h2>
                        Create a New Account
                    </h2>
                    <p>
                        Use the form below to create a new account.
                    </p>
                    <p>
                        Passwords are required to be a minimum of <%= Membership.MinRequiredPasswordLength %> characters in length.
                    </p>
                    <span class="failureNotification">
                        <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
                    </span>
                    <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="failureNotification" 
                         ValidationGroup="RegisterUserValidationGroup"/>
                    <div class="accountInfo">
                        <fieldset class="register">
                            <legend>Account Information</legend>
                            <p>
                                <asp:Label ID="Label1" runat="server" AssociatedControlID="FirstName">First Name:</asp:Label>
                                <asp:TextBox ID="FirstName" runat="server" CssClass="textEntry"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FirstName" 
                                     CssClass="failureNotification" ErrorMessage="First Name is required." ToolTip="First Name is required." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="Label2" runat="server" AssociatedControlID="LastName">Last Name:</asp:Label>
                                <asp:TextBox ID="LastName" runat="server" CssClass="textEntry"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="LastName" 
                                     CssClass="failureNotification" ErrorMessage="Last Name is required." ToolTip="Last Name is required." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                                     CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                <asp:TextBox ID="Email" runat="server" CssClass="textEntry"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" 
                                     CssClass="failureNotification" ErrorMessage="E-mail is required." ToolTip="E-mail is required." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                                     CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="failureNotification" Display="Dynamic" 
                                     ErrorMessage="Confirm Password is required." ID="ConfirmPasswordRequired" runat="server" 
                                     ToolTip="Confirm Password is required." ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                     CssClass="failureNotification" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:CompareValidator>
                            </p>
                            <p>
                                <asp:Label ID="Label3" runat="server" AssociatedControlID="UserType">User Type:</asp:Label>
                                <asp:TextBox ID="UserType" runat="server" CssClass="textEntry"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="UserType" 
                                     CssClass="failureNotification" ErrorMessage="User Type is required." ToolTip="User Type is required." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="Label4" runat="server" AssociatedControlID="Active">Active:</asp:Label>
                                <asp:Checkbox ID="Active" runat="server" CssClass="textEntry"></asp:Checkbox>
                            </p>
                        </fieldset>
                        <p class="submitButton">
                            <asp:Button ID="CreateUserButton" runat="server" OnClick="AddUser_Click" Text="Create User" 
                                 ValidationGroup="RegisterUserValidationGroup"/>
                        </p>
                    </div>
                </ContentTemplate>
                <CustomNavigationTemplate>
                </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
</asp:Content>
