<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="ManageEvents.aspx.cs" Inherits="EventNow.ManageEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-right: 0px;
        }
    </style>
    <link href="css/Event.css" rel="stylesheet" />
    <script type="text/javascript" src="https://unpkg.com/jquery@3.3.1/dist/jquery.js"></script>
    <script type="text/javascript" src="https://unpkg.com/web3@0.20.5/dist/web3.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <form runat="server">
        <div class="pt-5">
            <div class="container">
                <div class="col-md-12 text-center pt-5 mt-4">
                    <asp:Button ID="all" CssClass="btn btn-dark btn-sg me-4" Text="View All Events" runat="server" OnClick="all_Click" />
                    <asp:Button ID="entrepreneurship" CssClass="btn btn-outline-warning btn-sg me-4" runat="server" Text="Entrepreneurship" OnClick="entrepreneurship_Click" />
                    <asp:Button ID="community" CssClass="btn btn-outline-secondary btn-sg me-4" runat="server" Text="Community Service" OnClick="community_Click" />
                    <asp:Button ID="technology" CssClass="btn btn-outline-primary btn-sg me-4" runat="server" Text="Technology" OnClick="technology_Click" />
                    <asp:Button ID="science" CssClass="btn btn-outline-success btn-sg me-4" runat="server" Text="Science" OnClick="science_Click" />
                    <asp:Button ID="sports" CssClass="btn btn-outline-danger btn-sg me-4" runat="server" Text="Sports" OnClick="sports_Click" />
                    <asp:Button ID="art" CssClass="btn btn-outline-info btn-sg me-4" runat="server" Text="Arts & Culture" OnClick="art_Click" />
                    <%--<button class="btn btn-outline-secondary btn-sg me-5" type="submit" formaction="">Community Service</button>
                    <button class="btn btn-outline-warning btn-sg me-5" type="submit" formaction="">Technology</button>
                    <button class="btn btn-outline-danger btn-sg me-5" type="submit" formaction="">Science</button>
                    <button class="btn btn-outline-success btn-sg me-5" type="submit" formaction="">Arts & Culture</button>
                    <button class="btn btn-outline-info btn-sg" type="submit" formaction="">Performing Arts</button>--%>
                </div>
            </div>
            <div class="container">
                <div class="pt-3 mt-3">
                    <div class="row">
                        <asp:Repeater ID="RepeaterList1" runat="server" DataSourceID="EventList" OnItemCommand="RepeaterList1_ItemCommand">
                            <ItemTemplate>
                                <div class="col-xl-4 col-lg-6 col-md-12">
                                    <div class="card mt-3 shadow" style="min-width: 425px;">
                                        <div class="card-img-top text-center">
                                            <img src="img/<%# Eval("EventImg") %>" style="max-width: 425px; max-height: 200px; min-height: 200px; min-width: 425px; padding: 20px;" alt="image">
                                        </div>
                                        <div class="card-body">
                                            <h3 class="card-title text-center">
                                                <asp:Label Text='<%# Eval("EventName") %>' runat="server" /></h3>
                                            <hr />
                                            <p class="card-text" style="color: rgba(0,0,0,0.6); font-size: 18px;">#<asp:Label Text='<%# Eval("EventType") %>' runat="server" /></p>
                                            <p class="card-text">
                                                <table>
                                                    <tr>
                                                        <td><b>Event Type:</b></td>
                                                        <td>&nbsp&nbsp<asp:Label Text='<%# Eval("EventLink") %>' runat="server" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td><b>Timing:</b></td>
                                                        <td>&nbsp&nbsp<asp:Label Text='<%# Eval("EventDuration1") %>' runat="server" />&nbsp<asp:Label Text='<%# Eval("EventDuration2") %>' runat="server" /></td>

                                                    </tr>
                                                    <tr>
                                                        <td><b>Date:</b></td>
                                                        <td>&nbsp From
                                                           
                                                            <asp:Label Text='<%# Eval("EventStartDate", "{0:MM/dd/yyyy}") %>' runat="server" Style="font-weight: bold;" />
                                                            to
                                                           
                                                            <asp:Label Text='<%# Eval("EventEndDate", "{0:MM/dd/yyyy}") %>' runat="server" Style="font-weight: bold;" /></td>

                                                    </tr>

                                                </table>
                                                <asp:Button runat="server" CommandName="ViewDetails" CommandArgument='<%# Eval("EventID") %>' Text="View Details" />
                                                <asp:Button runat="server" CommandName="DeleteDetails" CommandArgument='<%# Eval("EventID") %>' Text="Delete" />
                                                <asp:Button runat="server" CommandName="UpdateDetails" CommandArgument='<%# Eval("EventID") %>' Text="Update Details" />
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="EventList" runat="server" ConnectionString="<%$ ConnectionStrings:EventNowDB.mdf %>" SelectCommand="SELECT * FROM [Event]"></asp:SqlDataSource>

                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
