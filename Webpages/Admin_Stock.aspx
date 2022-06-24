<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Stock.aspx.cs" Inherits="New_Chief_Medical_Agency.Webpages.Admin_Stock" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <link rel="stylesheet" type="text/css" href="../css/StyleSheet1.css" />
</head>
<body background="../Media/Pills_bg.jpg">
    <form id="form1" runat="server">
        <section class="container box" style="margin-top: 80px; background-color: #7c98b3; width: max-content; height: auto; border-radius: 35px;">
            <div class="d-flex flex-column">
                <div class="p-2" style="height: 70px; text-align: center;">
                    <div class="d-flex flex-row ">
                        <div class="p-6" style="width: 80%">
                            <h2>ADMIN</h2>
                        </div>
                        <div class="p-2" style="width: 20%">
                            <asp:Button ID="buttonlogout" runat="server" Text="Logout" BackColor="#dc3545" BorderStyle="None" ForeColor="White" />
                        </div>
                    </div>
                </div>
                <div class="p-2" style="height: 220px; background-color: #485972; padding-left: -50px;">
                    <img src="../Media/logo-removebg-preview.png" alt="logo" style="width: 390px; height: 200px; margin-left: 20px;" />
                </div>

                <div class="p-2" style="background-color: #e3f2fd;">
                    <div class="d-flex flex-row justify-content-center" style="font-size:15px;">
                        <div class="p-2">
                            <asp:Button ID="btnusers" runat="server" CssClass="btn btn-light"  Width="80px" Height="30px" Text="Users" BackColor="#E3F2FD" BorderColor="#E3F2FD" BorderStyle="None" />
                        </div>
                        <div class="p-2">
                            <asp:Button ID="btnstocks" runat="server" CssClass="btn btn-light"  Width="80px" Height="30px" Text="Stocks" BackColor="#E3F2FD" BorderColor="#E3F2FD" BorderStyle="None" />
                        </div>
                        <div class="p-2">
                            <asp:Button ID="btnorders" runat="server" CssClass="btn btn-light"  Width="80px" Height="30px" Text="Orders" BackColor="#E3F2FD" BorderColor="#E3F2FD" BorderStyle="None" />
                        </div>
                    </div>
                </div>
                <div class="p-2">
                    <p>
                        List of Stock On Hand
                    </p>
                   
                    <hr style="background-color: #a5b3c1" />

                    <asp:GridView ID="GridStocks" runat="server" AllowPaging="True" AllowSorting="True"  AutoGenerateColumns="False" CellPadding="4" DataSourceID="Stocks" ForeColor="#333333" GridLines="None" Width="489px" PageSize="7">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="ProductId" HeaderText="ProductId" SortExpression="ProductId" />
                            <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                            <asp:BoundField DataField="AvailableUnits" HeaderText="AvailableUnits" SortExpression="AvailableUnits" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerSettings Mode="NumericFirstLast" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="Stocks" runat="server" ConnectionString="<%$ ConnectionStrings:NCMAConnectionString %>" SelectCommand="SELECT * FROM [Stock_tbl]"></asp:SqlDataSource>

                    <div style="text-align:center; margin-top:10px;">
                           <asp:button ID="btngenstockrepo" runat="server" class="btn btn-primary" Text="Genrate Stocks Report" Width="150px" Height="30px" Font-Size="Small"/>
                        </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
