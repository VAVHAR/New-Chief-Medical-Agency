<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="~/Webpages/Admin_Home.aspx.cs" Inherits="New_Chief_Medical_Agency.Webpages.Admin_Home" %>
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
        <section class="container box" style="margin-top: 80px; background-color: #7c98b3; width: fit-content; height: fit-content; border-radius: 35px;">
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
                            <asp:Button ID="btnusers" runat="server" CssClass="btn btn-light"  Width="80px" Height="30px" Text="Users" BackColor="#E3F2FD" BorderColor="#E3F2FD" BorderStyle="None" OnClick="Page_Load" />
                        </div>
                        <div class="p-2">
                            <asp:Button ID="btnstocks" runat="server" CssClass="btn btn-light"  Width="80px" Height="30px" Text="Stocks" BackColor="#E3F2FD" BorderColor="#E3F2FD" BorderStyle="None" OnClick="btnstocks_Click"/>
                        </div>
                        <div class="p-2">
                            <asp:Button ID="btnorders" runat="server" CssClass="btn btn-light"  Width="80px" Height="30px" Text="Orders" BackColor="#E3F2FD" BorderColor="#E3F2FD" BorderStyle="None" OnClick="btnorders_Click" />
                        </div>
                    </div>
                </div>
                <div class="p-2">
                    <p>
                        List of Users
                    </p>
                    <div>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="Users" ForeColor="#333333" GridLines="None" Width="404px" Font-Size="15px" DataKeyNames="UserId">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                                <asp:BoundField DataField="EmailId" HeaderText="EmailId" SortExpression="EmailId" />
                                <asp:BoundField DataField="MobileNo" HeaderText="MobileNo" SortExpression="MobileNo" />
                                <asp:BoundField DataField="UserRole" HeaderText="UserRole" SortExpression="UserRole" />
                                <asp:BoundField DataField="UserId" HeaderText="UserId" ReadOnly="True" SortExpression="UserId" />
                                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="Users" runat="server" ConnectionString="<%$ ConnectionStrings:NCMAConnectionString %>" SelectCommand="SELECT * FROM [User_tbl]"></asp:SqlDataSource>
                    </div>
                    <hr style="background-color: #a5b3c1" />
                    <div style="font-size: 16px; margin-top: -15px;">
                        <div class="d-flex flex-row">
                            <div class="p-1">
                                <asp:Label runat="server">FirstName:</asp:Label>
                            </div>
                            <div class="p-2">
                                <asp:TextBox ID="Txtfirstname" runat="server" Style="width: 120px; height: 22px;"></asp:TextBox>
                            </div>
                            <div class="p-1">
                                <asp:Label runat="server">LastName</asp:Label>
                            </div>
                            <div class="p-2">
                                <asp:TextBox ID="TxtLastName" runat="server" Style="width: 120px; height: 22px;"></asp:TextBox>
                            </div>
                            <div class="p-2">
                                <asp:Label runat="server">Email:</asp:Label>
                            </div>
                            <div class="p-2" style="margin-left: 20px;">
                                <asp:TextBox ID="TxtEmail" runat="server" Style="width: 120px; height: 22px;"></asp:TextBox>
                            </div>
                        </div>
                        <div class="d-flex flex-row" style="margin-top: -8px;">
                            
                            <div class="p-1">
                                <asp:Label runat="server">P No:</asp:Label>
                            </div>
                            <div class="p-2" style="margin-left: 35px;">
                                <asp:TextBox ID="TxtPno" runat="server" Style="width: 120px; height: 22px;"></asp:TextBox>
                            </div>
                            <div class="p-2">
                                <asp:Label runat="server">UserName:</asp:Label>
                            </div>
                            <div class="p-2" style="margin-left: -9px;">
                                <asp:TextBox ID="TxtUsername" runat="server" Style="width: 120px; height: 22px;"></asp:TextBox>
                            </div>
                            <div class="p-1">
                                <asp:Label runat="server">Password:</asp:Label>
                            </div>
                            <div class="p-2">
                                <asp:TextBox ID="Txtpswd" runat="server" Style="width: 120px; height: 22px;" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="d-flex flex-row" style="margin-top: -8px;">
                            
                        </div>
                        <div class="d-flex flex-row">
                            <div class="p-2">User Role:</div>
                           <!--<div class="p-2"><asp:RadioButton ID="radioAdmin" runat="server" Text="Admin" GroupName="userrole" /></div>
                            <div class="p-2"><asp:RadioButton ID="radioStock" runat="server" Text="StockManager" GroupName="userrole" /></div>
                            <div class="p-2"><asp:RadioButton ID="radioorder" runat="server" Text="Order Clerk" GroupName="userrole" /></div>
                            -->
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                <asp:ListItem>Admin</asp:ListItem>
                                <asp:ListItem>Stock Manager</asp:ListItem>
                                <asp:ListItem>Order Clerk</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <div style="text-align:center;">
                           <asp:button ID="btnsubmit" runat="server" class="btn btn-primary" Text="Save User" Width="80px" Height="30px" Font-Size="Small" OnClick="btnsubmit_Click"/>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
