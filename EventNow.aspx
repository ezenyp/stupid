<%@ Page Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="EventNow.aspx.cs" Inherits="EventNow.EventNow" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Event.css" rel="stylesheet" />
    <script type="text/javascript" src="https://unpkg.com/jquery@3.3.1/dist/jquery.js"></script>
    <script type="text/javascript" src="https://unpkg.com/web3@0.20.5/dist/web3.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
       <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 31px;
        }
    </style>
      <form runat="server">
           <div class="pt-5">
            <div class="container">
                <div class="col-md-12 text-center pt-5 mt-4">
        <div>
            <h2>EVENT NOW<br />
            </h2>
            <p>&nbsp;
            </p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <table class="auto-style1">
                <tr>
                    <td>Event ID&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
            <asp:Label ID="lbl_eventID" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Event Name:</td>
                    <td>
            <asp:Label ID="lbl_eventName" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Student ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
            <asp:Label ID="lbl_Student" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Student Name:</td>
                    <td>
            <asp:Label ID="lbl_StudentFName" runat="server"></asp:Label>
&nbsp;
            <asp:Label ID="lbl_StudentLName" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="2">Are you going to attend?&nbsp;&nbsp;&nbsp;
                        <br />
                        <br />
            <asp:RadioButtonList ID="SignUpStatus" runat="server" RepeatDirection="Horizontal" Width="196px" style="margin: auto;">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="rfv_SignUpStatus" runat="server" ControlToValidate="SignUpStatus" ErrorMessage="Please select a choice" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <asp:Button ID="btn_Submit" runat="server" Text="Submit" OnClick="btn_Submit_Click" />
        &nbsp;
            <asp:Button ID="btn_return" runat="server" OnClick="btn_return_Click" Text="Return" CausesValidation="false"/>
        </div>
                    

                    </div>
                </div>
               </div>
            </form>
 </asp:Content>
