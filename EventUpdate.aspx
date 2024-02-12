<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="EventUpdate.aspx.cs" Inherits="EventNow.EventUpdate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Event.css" rel="stylesheet" />
    <script type="text/javascript" src="https://unpkg.com/jquery@3.3.1/dist/jquery.js"></script>
    <script type="text/javascript" src="https://unpkg.com/web3@0.20.5/dist/web3.min.js"></script>
    <style type="text/css">
        .auto-style3 {
            height: 29px;
        }
        .auto-style4 {
            height: 39px;
        }
    </style>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
 
 
    
      <form runat="server">
           <div class="pt-5">
            <div class="container">
                <div class="col-md-12 text-center pt-5 mt-4">
    <h3>Event Update</h3>
    <table class="auto-style2" style=" margin: auto;">
        <tr>
            <td>Event ID:</td>
            <td>
                <asp:Label ID="EventID_Label" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>Event Title:&nbsp;&nbsp; </td>
            <td>
                <asp:TextBox ID="tb_EventName" runat="server"></asp:TextBox> <br />
                <asp:RequiredFieldValidator ID="rfv_EventName" runat="server" ControlToValidate="tb_EventName" ErrorMessage="*Event Title is Required*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                
            </td>
        </tr>
        <tr>
            <td>Event Description: </td>
            <td>
                <asp:TextBox ID="tb_EventDesc" runat="server"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfv_EventDesc" runat="server" ControlToValidate="tb_EventDesc" ErrorMessage="*Event Description is Required*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                
            </td>
        </tr>
        <tr>
            <td>Event Catergory: </td>
            <td>
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
                                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="*Please select at least one event type*"
    ClientValidationFunction="validateEventType_ClientValidate" OnServerValidate="validateEventType_ServerValidate" ForeColor="Red"></asp:CustomValidator>
            </td>
            <td>

            </td>
        </tr>
        <tr>
            <td>Event Location:</td>
            <td>
                <asp:TextBox ID="tb_EventLocation" runat="server"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfv_EventLocation" runat="server" ControlToValidate="tb_EventLocation" ErrorMessage="*Event Location is Required*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                
            </td>
        </tr>
        <tr>
            <td>Event Duration: </td>
            <td>
                <div style="margin=auto;">
                <asp:TextBox ID="tb_EventDuration" runat="server"></asp:TextBox>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Minutes</asp:ListItem>
                    <asp:ListItem>Hours</asp:ListItem>
                    <asp:ListItem>days</asp:ListItem>
                </asp:DropDownList>
                    </div>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tb_EventDuration" ErrorMessage="*Event Duration is Required*" ForeColor="Red"></asp:RequiredFieldValidator>  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList1" ErrorMessage="*Select Time Type*" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage=" *Please enter a numeric value*" ForeColor="Red" ControlToValidate="tb_EventDuration" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
               
                &nbsp;</td>
            <td>
                
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Event Orgranization: </td>
            <td class="auto-style3">
                <asp:TextBox ID="tb_EventOrganization" runat="server"></asp:TextBox>
                <br />
                 <asp:RequiredFieldValidator ID="rfv_EventOrg" runat="server" ControlToValidate="tb_EventOrganization" ErrorMessage="*Event Organisation is Required*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style3">

            </td>
        </tr>
        <tr>
            <td>Event Date: </td>
            <td>
                <asp:TextBox ID="tb_StartDate" runat="server" TextMode="Date"></asp:TextBox>
            &nbsp; to&nbsp;&nbsp;
                <asp:TextBox ID="tb_Enddate" runat="server" TextMode="Date"></asp:TextBox>
                <br />
                  <asp:RequiredFieldValidator ID="rfv_EventStartDate" runat="server" ControlToValidate="tb_StartDate" ErrorMessage="*Start Date is Required*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="rfv_EventEndDate" runat="server" ControlToValidate="tb_Enddate" ErrorMessage="*End Date is Required*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
              
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                Event Image:</td>
            <td class="auto-style4">
                <br />
                <asp:FileUpload ID="Event_FileUpload" runat="server" />
                <br />
                <asp:Label ID="lbl_Result" runat="server"></asp:Label>
                <br />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Event_FileUpload" ErrorMessage="*Please select a Product Image*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style4">
              
            </td>
        </tr>
        <tr>
            <td>
                Event Mode</td>
            <td>
                 <div style="padding-left:150px;">
                <asp:RadioButtonList ID="Eventmode_radiobutton" runat="server">
                    <asp:ListItem>Internal</asp:ListItem>
                    <asp:ListItem>External</asp:ListItem>
                </asp:RadioButtonList>
                     <br />
                     <div  style="padding-right:150px;">
                    <asp:RequiredFieldValidator ID="rfv_EventMode" runat="server" ControlToValidate="Eventmode_radiobutton"
            ErrorMessage="*Please select an event mode*" ForeColor="Red"></asp:RequiredFieldValidator>
                         </div>
                 </div>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Update_btb" runat="server" Text="Update" OnClick="Update_btb_Click" />
            </td>
            <td>
                <asp:Button ID="Return_btb" runat="server" OnClick="Return_btb_Click" Text="Return" CausesValidation="false" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
                 </div>
                </div>
               </div>
            </form>
   
       
</asp:Content>
