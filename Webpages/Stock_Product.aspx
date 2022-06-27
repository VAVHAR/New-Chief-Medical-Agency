<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Stock_Product.aspx.cs" Inherits="New_Chief_Medical_Agency.Webpages.Stock_Product" %>

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
                            <h2>STOCK MANAGER</h2>
                        </div>
                        <div class="p-2" style="width: 20%">
                            <asp:Button ID="buttonlogout" runat="server" Text="Logout" BackColor="#dc3545" BorderStyle="None" ForeColor="White" OnClick="buttonlogout_Click" />
                        </div>
                    </div>
                </div>
                <div class="p-2" style="height: 220px; background-color: #485972; padding-left: -50px;">
                    <img src="../Media/logo-removebg-preview.png" alt="logo" style="width: 390px; height: 200px; margin-left: 20px;" />
                </div>

                <div class="p-2" style="background-color: #e3f2fd;">
                    <div class="d-flex flex-row justify-content-center" style="font-size:15px;">
                        <div class="p-2">
                            <asp:Button ID="btnproduct" runat="server" CssClass="btn btn-light"  Width="80px" Height="30px" Text="Products" BackColor="#E3F2FD" BorderColor="#E3F2FD" BorderStyle="None" OnClick="btnproduct_Click" />
                        </div>
                        <div class="p-2">
                            <asp:Button ID="btnstocks" runat="server" CssClass="btn btn-light"  Width="80px" Height="30px" Text="Stocks" BackColor="#E3F2FD" BorderColor="#E3F2FD" BorderStyle="None" OnClick="btnstocks_Click" />
                        </div>
                        <div class="p-2">
                            <asp:Button ID="btnorders" runat="server" CssClass="btn btn-light"  Width="80px" Height="30px" Text="Orders" BackColor="#E3F2FD" BorderColor="#E3F2FD" BorderStyle="None" OnClick="btnorders_Click" />
                        </div>
                    </div>
                </div>
                <div class="p-2">
                    <p>
                        List of Products
                    </p>
                    <div>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="Product" ForeColor="#333333" GridLines="None" Width="800px" Font-Size="15px" DataKeyNames="ProductId" AllowPaging="True" PageSize="7">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:BoundField DataField="ProductId" HeaderText="ProductId" SortExpression="ProductId" ReadOnly="True" />
                                <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                                <asp:BoundField DataField="ProductPrice" HeaderText="ProductPrice" SortExpression="ProductPrice" />
                                <asp:BoundField DataField="ProductType" HeaderText="ProductType" SortExpression="ProductType" />
                                <asp:BoundField DataField="SupplierName" HeaderText="SupplierName" SortExpression="SupplierName" />
                                <asp:BoundField DataField="ProductQuantity" HeaderText="ProductQuantity" SortExpression="ProductQuantity" />
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
                        <asp:SqlDataSource ID="Product" runat="server" ConnectionString="<%$ ConnectionStrings:NCMAConnectionString %>" SelectCommand="SELECT * FROM [Product_tbl]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Product_tbl] WHERE [ProductId] = @original_ProductId AND [ProductName] = @original_ProductName AND [ProductPrice] = @original_ProductPrice AND [ProductType] = @original_ProductType AND [SupplierName] = @original_SupplierName AND [ProductQuantity] = @original_ProductQuantity" InsertCommand="INSERT INTO [Product_tbl] ([ProductId], [ProductName], [ProductPrice], [ProductType], [SupplierName], [ProductQuantity]) VALUES (@ProductId, @ProductName, @ProductPrice, @ProductType, @SupplierName, @ProductQuantity)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Product_tbl] SET [ProductName] = @ProductName, [ProductPrice] = @ProductPrice, [ProductType] = @ProductType, [SupplierName] = @SupplierName, [ProductQuantity] = @ProductQuantity WHERE [ProductId] = @original_ProductId AND [ProductName] = @original_ProductName AND [ProductPrice] = @original_ProductPrice AND [ProductType] = @original_ProductType AND [SupplierName] = @original_SupplierName AND [ProductQuantity] = @original_ProductQuantity">
                            <DeleteParameters>
                                <asp:Parameter Name="original_ProductId" Type="String" />
                                <asp:Parameter Name="original_ProductName" Type="String" />
                                <asp:Parameter Name="original_ProductPrice" Type="Double" />
                                <asp:Parameter Name="original_ProductType" Type="String" />
                                <asp:Parameter Name="original_SupplierName" Type="String" />
                                <asp:Parameter Name="original_ProductQuantity" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="ProductId" Type="String" />
                                <asp:Parameter Name="ProductName" Type="String" />
                                <asp:Parameter Name="ProductPrice" Type="Double" />
                                <asp:Parameter Name="ProductType" Type="String" />
                                <asp:Parameter Name="SupplierName" Type="String" />
                                <asp:Parameter Name="ProductQuantity" Type="Int32" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="ProductName" Type="String" />
                                <asp:Parameter Name="ProductPrice" Type="Double" />
                                <asp:Parameter Name="ProductType" Type="String" />
                                <asp:Parameter Name="SupplierName" Type="String" />
                                <asp:Parameter Name="ProductQuantity" Type="Int32" />
                                <asp:Parameter Name="original_ProductId" Type="String" />
                                <asp:Parameter Name="original_ProductName" Type="String" />
                                <asp:Parameter Name="original_ProductPrice" Type="Double" />
                                <asp:Parameter Name="original_ProductType" Type="String" />
                                <asp:Parameter Name="original_SupplierName" Type="String" />
                                <asp:Parameter Name="original_ProductQuantity" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                    <hr style="background-color: #a5b3c1" />
                    <div style="font-size: 16px; margin-top: -15px;">
                        <div class="d-flex flex-row">
                            <div class="p-1">
                                <asp:Label runat="server">Product ID:</asp:Label>
                            </div>
                            <div class="p-2">
                                <asp:TextBox ID="Txtproid" runat="server" Style="width: 120px; height: 22px;"></asp:TextBox>
                            </div>
                            <div class="p-1">
                                <asp:Label runat="server">Product Type</asp:Label>
                            </div>
                            <div class="p-2">
                                <asp:TextBox ID="Txtprotype" runat="server" Style="width: 120px; height: 22px;"></asp:TextBox>
                            </div>
                            <div class="p-2">
                                <asp:Label runat="server">Name Of Product:</asp:Label>
                            </div>
                            <div class="p-2" style="margin-left: 20px;">
                                <asp:TextBox ID="Txtproname" runat="server" Style="width: 120px; height: 22px;"></asp:TextBox>
                            </div>
                        </div>
                        <div class="d-flex flex-row" style="margin-top: -8px;">
                             <div class="p-2">
                                <asp:Label runat="server">Name Of Supplier:</asp:Label>
                            </div>
                            <div class="p-2" >
                                <asp:TextBox ID="Txtprosup" runat="server" Style="width: 120px; height: 22px;"></asp:TextBox>
                            </div>
                            <div class="p-1">
                                <asp:Label runat="server">Quantity:</asp:Label>
                            </div>
                            <div class="p-2">
                                <asp:TextBox ID="Txtproquan" runat="server" Style="width: 120px; height: 22px;"></asp:TextBox>
                            </div>
                            <div class="p-2">
                                <asp:Label runat="server">Price Of Product:</asp:Label>
                            </div>
                            <div class="p-2">
                                <asp:TextBox ID="Txtproprice" runat="server" Style="width: 120px; height: 22px;"></asp:TextBox>
                            </div>
                           
                        </div>
                       
                        
                        <div style="text-align:center;">
                           <asp:button ID="btnsaveproduct" runat="server" class="btn btn-primary" Text="Save Product" Width="100px" Height="30px" Font-Size="Small" OnClick="btnsaveproduct_Click1" />
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
