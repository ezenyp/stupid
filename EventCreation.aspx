<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="EventCreation.aspx.cs" Inherits="EventNow.EventCreation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Event.css" rel="stylesheet" />
    <script type="text/javascript" src="https://unpkg.com/jquery@3.3.1/dist/jquery.js"></script>
    <script type="text/javascript" src="https://unpkg.com/web3@0.20.5/dist/web3.min.js"></script>
     <script type="text/javascript">
         function validateEventType_ClientValidate(sender, args) {
             var checkBoxList = document.getElementById('<%= td_EventType.ClientID %>');
             var checkBoxes = checkBoxList.getElementsByTagName('input');
             var isChecked = false;

             for (var i = 0; i < checkBoxes.length; i++) {
                 if (checkBoxes[i].checked) {
                     isChecked = true;
                     break;
                 }
             }

             args.IsValid = isChecked;
         }
     </script>
    <style type="text/css">
        .auto-style1 {
            height: 35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
 
 
    
      <form runat="server">
           <div class="pt-5">
            <div class="container">
                <div class="col-md-12 text-center pt-5 mt-4">
     <table class="auto-style2" style=" margin: auto;">
        <tr>
            <td class="auto-style4" colspan="2">
                <h1>Event creation page</h1>
            </td>
            <td class="auto-style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label1" runat="server" Text="Event Title"></asp:Label>
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="td_EventName" runat="server"></asp:TextBox>
                <br />
                  <asp:RequiredFieldValidator ID="rfv_EventName" runat="server" ControlToValidate="td_EventName" ErrorMessage="*Event Title is Required*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style1">
              
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="Label2" runat="server" Text="Event Description"></asp:Label>
            </td>
            <td class="auto-style16">
                <asp:TextBox ID="td_EventDesc" runat="server" Height="78px" Width="339px"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfv_EventDesc" runat="server" ControlToValidate="td_EventDesc" ErrorMessage="Event Description is Required*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style3">
                
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="Label3" runat="server" Text="Event Category"></asp:Label>
            </td>
            <td class="auto-style16">
                <div style="padding-left:150px;">
                <asp:CheckBoxList ID="td_EventType" runat="server">
                    <asp:ListItem>Entrepreneurship</asp:ListItem>
                    <asp:ListItem>Community Service</asp:ListItem>
                    <asp:ListItem>Technology</asp:ListItem>
                    <asp:ListItem>Science</asp:ListItem>
                    <asp:ListItem>Sports</asp:ListItem>
                    <asp:ListItem>Arts &amp; Culture</asp:ListItem>
                </asp:CheckBoxList>
                    </div>
                <br />
                 <asp:CustomValidator ID="cv_EventType" runat="server" ErrorMessage="Please select at least one event type."
    ClientValidationFunction="validateEventType_ClientValidate" OnServerValidate="validateEventType_ServerValidate" ForeColor="Red"></asp:CustomValidator>
            </td>
            <td class="auto-style3">
            
 </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="Label4" runat="server" Text="Event Location"></asp:Label>
            </td>
            <td class="auto-style16">
                <asp:TextBox ID="td_EventLocation" runat="server"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfv_EventLocation" runat="server" ControlToValidate="td_EventLocation" ErrorMessage="*Event Location is Required*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style3">
                
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="Label5" runat="server" Text="Event Duration"></asp:Label>
            </td>
            <td class="auto-style16">
                <asp:TextBox ID="td_EventDuration1" runat="server"></asp:TextBox>
                <asp:DropDownList ID="td_EventDuration2" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Minutes</asp:ListItem>
                    <asp:ListItem>Hours</asp:ListItem>
                    <asp:ListItem>Days</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:RequiredFieldValidator ID="rfv_EventDuration1" runat="server" ControlToValidate="td_EventDuration1" ErrorMessage="*Event Duration is Required*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cv_EventDuration1" runat="server" ErrorMessage=" Please enter a numeric value*" ForeColor="Red" ControlToValidate="td_EventDuration1" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="rfv_EventDuration2" runat="server" ControlToValidate="td_EventDuration2" ErrorMessage="Select Time Type*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            </td>
            <td class="auto-style3">
                
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="Label6" runat="server" Text="Organization"></asp:Label>
            </td>
            <td class="auto-style16">
                <asp:TextBox ID="td_EventOrg" runat="server"></asp:TextBox>
                <br />
                 <asp:RequiredFieldValidator ID="rfv_EventOrg" runat="server" ControlToValidate="td_EventOrg" ErrorMessage="*Event Organisation is Required*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style3">
               
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="Label7" runat="server" Text="Date"></asp:Label>
            </td>
            <td class="auto-style16">
                <asp:Label ID="Label10" runat="server" Text="From"></asp:Label>
                <asp:TextBox ID="td_EventStartDate" runat="server" TextMode="Date"></asp:TextBox>
                <asp:Label ID="Label11" runat="server" Text="To"></asp:Label>
                <asp:TextBox ID="td_EventEndDate" runat="server" TextMode="Date"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfv_EventStartDate" runat="server" ControlToValidate="td_EventStartDate" ErrorMessage="*Start Date is Required*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="rfv_EventEndDate" runat="server" ControlToValidate="td_EventEndDate" ErrorMessage="*End Date is Required*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style3">
                
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                Event Mode</td>
            <td class="auto-style16">
                  <div style="padding-left:150px;">
                <asp:RadioButtonList ID="Eventmode_radiobutton" runat="server">
                    <asp:ListItem>Internal</asp:ListItem>
                    <asp:ListItem>External</asp:ListItem>
                </asp:RadioButtonList>
                    </div>
                <br />
                 <div  style="padding-right:150px;">
                     <asp:RequiredFieldValidator ID="rfv_EventMode" runat="server" ControlToValidate="Eventmode_radiobutton"
            ErrorMessage="*Please select an event mode*" ForeColor="Red"></asp:RequiredFieldValidator>
                   </div>
            </td>
            <td class="auto-style3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style14">
                <asp:Label ID="Label9" runat="server" Text="Upload Cover Image"></asp:Label>
            </td>
            <td class="auto-style17">
                <asp:FileUpload ID="td_EventImg" runat="server" />
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="td_EventImg" ErrorMessage="*Please select a Product Image*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style15">
                
            </td>
        </tr>
        <tr>
            <td class="auto-style14"></td>
            <td class="auto-style17">
                <asp:Button ID="btn_Create" runat="server" Text="Create" OnClick="btn_Create_Click" />
            </td>
            <td class="auto-style15">
                &nbsp;</td>
        </tr>
    </table>
                    
                    </div>
                </div>
               </div>
            </form>
</asp:Content>