<%@ Page Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="SignUpDetail.aspx.cs" Inherits="EventNow.SignUpDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Event.css" rel="stylesheet" />
    <script type="text/javascript" src="https://unpkg.com/jquery@3.3.1/dist/jquery.js"></script>
    <script type="text/javascript" src="https://unpkg.com/web3@0.20.5/dist/web3.min.js"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #007bff;
            font-size: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-size: 15px;
        }

        td {
            padding: 10px;
        }

        .auto-style3 {
            font-weight: bold;
        }

        #btn_Return,
        #btn_update {
            padding: 10px;
            font-size: 16px;
            background-color: #28a745;
            color: #e9eef5;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

            #btn_Return:hover,
            #btn_update:hover {
                background-color: #218838;
            }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <form runat="server">
        <div class="pt-5">
            <div class="container">
                <div class="col-md-12 text-center pt-5 mt-4">

                    <div>
                        <h2>EVENT DETAILS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </h2>
                        <table class="auto-style2" style="max-width: 1000px; margin: 20px auto; background-color: #deecfa; padding: 20px; border-radius: 5px; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);">
                            <tr>
                                <td class="auto-style3">SignUpID:&nbsp;&nbsp;&nbsp;</td>
                                <td>
                                    <asp:Label ID="lbl_SignUpID" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Student ID:&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td>
                                    <asp:Label ID="lbl_StudentID" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Student Name:</td>
                                <td>
                                    <asp:Label ID="lbl_StudentFName" runat="server"></asp:Label>
                                    &nbsp;<asp:Label ID="lbl_StudentLName" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Event ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td>
                                    <asp:Label ID="lbl_EventID" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Event Name:&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td>
                                    <asp:Label ID="lbl_EventName" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Attending:&nbsp;&nbsp;</td>
                                <td>
                                    <asp:Label ID="lbl_Attending" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">
                                    <asp:Button ID="btn_Return" runat="server" OnClick="btn_Return_Click" Text="Return" Style="background-color: #002752; color: #e9eef5; padding: 10px 15px; border-radius: 5px; cursor: pointer; border: solid #e9eef5;" />
                                    &nbsp;&nbsp;
                    </td>
                                <td>
                                    <asp:Button ID="btn_update" runat="server" OnClick="btn_update_Click" Text="Proceed to Update" Style="background-color: #002752; color: #e9eef5; padding: 10px 15px; border-radius: 5px; cursor: pointer; border: solid #e9eef5;" />
                                    &nbsp;
                       
                                    <asp:Label ID="lbl_DeletedMessage" runat="server" Text="" CssClass="your-css-class"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </form>

</asp:Content>
