<%@ Page Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="SignUpEventView.aspx.cs" Inherits="EventNow.SignUpEventView" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Event.css" rel="stylesheet" />
    <script type="text/javascript" src="https://unpkg.com/jquery@3.3.1/dist/jquery.js"></script>
    <script type="text/javascript" src="https://unpkg.com/web3@0.20.5/dist/web3.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-right: 4px;
            margin-top: 2px;
        }

        body {
            background-color: #fff0db;
        }
    </style>

    <form runat="server">
        <div class="pt-5">
            <div class="container">
                <div class="col-md-12 text-center pt-5 mt-4">

                    <div>
                        <h2>SIGN UP</h2>
                    </div>
                    <asp:GridView ID="gv_Signupview" runat="server" AutoGenerateColumns="False" CssClass="auto-style1" OnRowDeleting="gv_Signupview_RowDeleting" OnSelectedIndexChanged="gv_Signupview_SelectedIndexChanged" DataKeyNames="SignUpID" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Style="margin: auto;">
                        <Columns>
                            <asp:BoundField DataField="SignUpID" HeaderText="SignUp ID" />
                            <asp:BoundField DataField="StudentID" HeaderText="Student ID" />
                            <asp:BoundField DataField="SignUpEvents" HeaderText="Event ID" />
                            <asp:BoundField DataField="EventStatus" HeaderText="Status" />
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:CommandField ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>

                </div>
            </div>
        </div>
    </form>
</asp:Content>
