<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="EventDetails.aspx.cs" Inherits="EventNow.EventDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Event.css" rel="stylesheet" />
    <script type="text/javascript" src="https://unpkg.com/jquery@3.3.1/dist/jquery.js"></script>
    <script type="text/javascript" src="https://unpkg.com/web3@0.20.5/dist/web3.min.js"></script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #fff0db;
            color: #1b1e21;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff0db;
            padding: 20px;
            border-radius: 5px;
            /*box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);*/
        }

        h4 {
            color: black;
            margin-bottom: 15px;
            font-weight: bold;
            font-size: 35px;
            margin-left: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }


        th, td {
            /*padding: 15px;*/
            text-align: left;
            font-size: 17px;
        }


        .hyperlink {
            color: #28a745;
            text-decoration: none;
        }

        .button {
            background-color: #002752;
            color: #b9d8fa;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

            .button:hover {
                background-color: #8cc3ff;
            }

        .event-image {
            max-width: 100%;
            height: auto;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">



    <form runat="server">
        <div>
            <div class="container">
                <div class="col-md-12 text-center pt-5 mt-4">

                    <h4>
                        <asp:Label ID="EventName_label" runat="server"></asp:Label>
                    </h4>
                    <div class="auto-style2" style="max-width: 1000px; margin: 20px auto; background-color: #F9FEFF; padding: 20px; border-radius: 5px; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);">
                        <table>
                            <tr>
                                <td><span style="font-weight: bold;">Event Description:</span>&nbsp;&nbsp;<asp:Label ID="EventDesc_Label" runat="server"></asp:Label>
                                    <br />
                                    <br />
                                    <span style="font-weight: bold;">Event Type:</span>
                                    <asp:Label ID="EventType_Label" runat="server"></asp:Label>
                                    <br />
                                    <br />
                                    <span style="font-weight: bold;">Event Location:</span>
                                    &nbsp;<asp:Label ID="EventLocation_Label" runat="server"></asp:Label>
                                    <br />
                                    <br />
                                    <span style="font-weight: bold;">Event Duration:</span>
                                    &nbsp;<asp:Label ID="EventDuration_Label" runat="server"></asp:Label>
                                    &nbsp;
       
                                <asp:Label ID="EventDuration2_label" runat="server"></asp:Label>
                                    <br />
                                    <br />
                                    <span style="font-weight: bold;">Event Organization:</span>

                                    <asp:Label ID="EventOrganization_label" runat="server"></asp:Label>
                                    <br />
                                    <br />
                                    <span style="font-weight: bold;">Event Date:</span>

                                    <asp:Label ID="EventStartDate_Label" runat="server"></asp:Label>
                                    &nbsp;-&nbsp;
       
                                <asp:Label ID="EventEndDate_Label" runat="server"></asp:Label>
                                    <br />
                                    <br />
                                    <span style="font-weight: bold;">Event Origin:</span>

                                    <asp:Label ID="EventMode_lbl" runat="server"></asp:Label>
                                    <br />
                                    <br />
                                </td>
                                <td>
                                    <asp:Image ID="Event_image" runat="server" style="max-width: 400px; max-height: 150px; min-height: 150px; min-width: 400px;" alt="image" />
                                </td>
                            </tr>
                        </table>


                        <div>
                            <asp:Button ID="return_btb" runat="server" CssClass="btn btn-secondary btn-sg" OnClick="return_btb_Click" Text="Return" Style="position: absolute; left: 460px;" />
                        </div>
                        <div>
                            <asp:Button ID="SignUp_btb" runat="server" CssClass="btn btn-outline-success btn-lg" OnClick="SignUp_btb_Click" Text="Sign Up" Style="position: center;" />
                        </div>





                    </div>
                </div>
            </div>
        </div>
    </form>


</asp:Content>
