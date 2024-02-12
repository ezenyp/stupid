<%@ Page Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EventNow.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Event.css" rel="stylesheet" />
    <script type="text/javascript" src="https://unpkg.com/jquery@3.3.1/dist/jquery.js"></script>
    <script type="text/javascript" src="https://unpkg.com/web3@0.20.5/dist/web3.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <form runat="server">
           <div class="pt-5">
            <div class="container">
                <div class="col-md-12 text-center pt-5 mt-4">

        <div>
            <h2>LOGIN</h2>
            <p>
                &nbsp;</p>
            <p>
                Admin ID:
                <asp:TextBox ID="tb_adminid" runat="server"></asp:TextBox>
            </p>
            <p>
                Password:
                <asp:TextBox ID="tb_password" runat="server"></asp:TextBox>
            </p>
            <asp:Button ID="button_login" runat="server" OnClick="button_login_Click" Text="Login" />
            <br />
            <br />
        </div>

                    </div>
                </div>
               </div>
            </form>
   
       
</asp:Content>

