x<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="New_Chief_Medical_Agency.Webpages.Login" %>

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
                    <div class="d-flex flex-row justify-content-center">
                        <p style="font-size: 30px; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif">
                            LOGIN
                        </p>
                    </div>
                </div>
                <div class="p-2" style="height: 220px; background-color: #485972; padding-left: -50px;">
                    <img src="../Media/logo-removebg-preview.png" alt="logo" style="width: 390px; height: 200px; margin-left: 20px;" />
                </div>


                <div class="p-2">
                    <div class="d-flex flex-row">
                        <div class="p-2">User Role:</div>

                        <asp:RadioButtonList ID="radiouserrole" runat="server">
                            <asp:ListItem>Admin</asp:ListItem>
                            <asp:ListItem>Stock Manager</asp:ListItem>
                            <asp:ListItem>Order Clerk</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please select UserRole" ControlToValidate="radiouserrole" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <div>
                    </div>
                    <hr style="background-color: #a5b3c1" />
                    <div style="font-size: 16px; margin-top: -15px;">

                        <div class="form-group d-flex flex-row justify-content-center">
                            <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
                            <div class="p-2">
                                <asp:TextBox ID="TxtuserId" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>   
                        </div>
                        
                        <div class="form-group d-flex flex-row justify-content-center">
                            <label for="inputPassword" class="p-1 col-form-label">
                            Password</label>
                            <div class="p-2">
                                <asp:TextBox ID="TxtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div style="text-align: center;">
                        <asp:Button ID="btnsubmit" runat="server" class="btn btn-Secondary" Text="Login" Width="80px" Height="30px" Font-Size="Small" OnClick="btnsubmit_Click" />
                    </div>
                    <div class="d-flex flex-row justify-content-center">
                            <div class="p-2">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter Username!" ControlToValidate="TxtuserId" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter Password!" ControlToValidate="TxtPassword" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </div>
                        </div>
                </div>

            </div>

        </section>
    </form>
</body>
</html>
