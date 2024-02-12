<%@ Page Language="C#"  MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="SignUpUpdate.aspx.cs" Inherits="EventNow.SignUpUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Event.css" rel="stylesheet" />
    <script type="text/javascript" src="https://unpkg.com/jquery@3.3.1/dist/jquery.js"></script>
    <script type="text/javascript" src="https://unpkg.com/web3@0.20.5/dist/web3.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }

        h2 {
            color: #002752;
            font-size: 20px;
        }

        table {
            width: 100%;
            margin-top: 20px;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
            font-size: 15px;
            color: black;
            
        }



        th, td {
            padding: 15px;
            text-align: left;

        }

    

        #btn_Update, #btn_Return {
            background-color: #002752;
            color: #e9eef5;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            border: solid #e9eef5;
        }

        #btn_Update:hover, #btn_Return:hover {
            background-color: #f8f9fa;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
 
 
    
      <form runat="server">
           <div class="pt-5">
            <div class="container">
                <div class="col-md-12 text-center pt-5 mt-4">
        <div>
            <h2>SIGN UP UPDATE</h2>
            <table class="auto-style2" style="background-color:#deecfa;">
                <tr>

                    <td style="font-weight: bold">Sign Up ID:&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                <asp:Label ID="lbl_SignUpID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Student ID:&nbsp;&nbsp;</td>
                    <td>
                <asp:Label ID="lbl_StudentID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="font-weight: bold">Student Name:&nbsp;&nbsp;</td>
                    <td class="auto-style3">
                <asp:Label ID="lbl_StudentFName" runat="server"></asp:Label>
&nbsp;
                <asp:Label ID="lbl_StudentLName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Event ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                <asp:Label ID="lbl_EventID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold">EventName:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                <asp:Label ID="lbl_EventName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="font-weight: bold">Are you attending?<br />
                <asp:RadioButtonList ID="Radio_SignUp" runat="server" RepeatDirection="Horizontal" Width="183px">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="rfv_Update" runat="server" ControlToValidate="Radio_SignUp" ErrorMessage="Please select a choice" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                <asp:Button ID="btn_Update" runat="server" OnClick="btn_Update_Click" Text="Update"  style="background-color: #002752;
            color: #e9eef5;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            border: solid #e9eef5;"/>
                    </td>
                    <td>
                <asp:Button ID="btn_Return" runat="server" OnClick="btn_Return_Click" Text="Return" CausesValidation="false" style="background-color: #002752;
            color: #e9eef5;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            border: solid #e9eef5;" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>

                    
                    </div>
                </div>
               </div>
            </form>
   
</asp:Content>