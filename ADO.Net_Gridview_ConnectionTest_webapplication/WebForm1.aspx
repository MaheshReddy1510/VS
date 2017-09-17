<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ADO.Net_Gridview_ConnectionTest_webapplication.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EmployeeId" DataSourceID="SqlDataSource1" Font-Overline="False" ShowFooter="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="EmployeeId" InsertVisible="False" SortExpression="EmployeeId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("EmployeeId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("EmployeeId") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ValidationGroup="Insert" OnClick="lbInsert_Click" ID="lbInsert" runat="server">Insert</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditName" runat="server" ErrorMessage="Name is Required Field" ControlToValidate="TextBox1" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertName" ValidationGroup="Insert" runat="server" ErrorMessage="Name is Required Field" ControlToValidate="txtName" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("Gender") %>'>
                            <asp:ListItem>Select Gender</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvEditGender" runat="server" ErrorMessage="Gender should be either Male or Female" ControlToValidate="DropDownList1" Text="*" ForeColor="Red" InitialValue="Select Gender">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlGender" runat="server">
                            <asp:ListItem>Select Gender</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>FeMale</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvInsertGender" ValidationGroup="Insert" runat="server" ErrorMessage="Select the Gender" ControlToValidate="ddlGender" Text="*" ForeColor="Red" InitialValue="Select Gender">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>

                </asp:TemplateField>
                <asp:TemplateField HeaderText="City" SortExpression="City">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEditCity" runat="server" ErrorMessage="City is Required" ControlToValidate="TextBox3" Text="*" ForeColor="Red" >
                    </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                    </ItemTemplate>
                    
                    <FooterTemplate>
                        <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertCity" ValidationGroup="Insert" runat="server" ErrorMessage="City is required" ControlToValidate="txtCity" Text="*" ForeColor="Red" >

                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                    
                </asp:TemplateField>
            </Columns>
            
        </asp:GridView>
            <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="Insert" runat="server" ForeColor="Red"></asp:ValidationSummary>
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red"></asp:ValidationSummary>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SampleConnectionString %>" DeleteCommand="DELETE FROM [tblEmployee] WHERE [EmployeeId] = @EmployeeId" InsertCommand="INSERT INTO [tblEmployee] ([Name], [Gender], [City]) VALUES (@Name, @Gender, @City)" SelectCommand="SELECT * FROM [tblEmployee]" UpdateCommand="UPDATE [tblEmployee] SET [Name] = @Name, [Gender] = @Gender, [City] = @City WHERE [EmployeeId] = @EmployeeId">
            <DeleteParameters>
                <asp:Parameter Name="EmployeeId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="City" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="EmployeeId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
