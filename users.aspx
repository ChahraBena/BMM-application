<%@ Page Language="C#" AutoEventWireup="true" CodeFile="users.aspx.cs" Inherits="users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 677px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style1">
    <div>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" DataSourceID="utilisateur" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Nom" HeaderText="Nom" SortExpression="Nom" />
                <asp:BoundField DataField="Prenom" HeaderText="Prenom" SortExpression="Prenom" />
                <asp:BoundField DataField="column1" HeaderText="column1" SortExpression="column1" />
                <asp:BoundField DataField="Matricule" HeaderText="Matricule" SortExpression="Matricule" />
                <asp:BoundField DataField="MotDePasse" HeaderText="MotDePasse" SortExpression="MotDePasse" />
                <asp:BoundField DataField="DepartementId" HeaderText="DepartementId" SortExpression="DepartementId" />
                <asp:BoundField DataField="TypeUserId" HeaderText="TypeUserId" SortExpression="TypeUserId" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="utilisateur" runat="server" ConnectionString="<%$ ConnectionStrings:BMMConnectionString %>" SelectCommand="SELECT [Nom], [Prenom], [Nom d'utilisateur] AS column1, [Matricule], [MotDePasse], [DepartementId], [TypeUserId], [Email] FROM [Utilisateur]" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BMMConnectionString %>" SelectCommand="SELECT [Nom], [Prenom], [Nom d'utilisateur] AS column1, [Matricule], [MotDePasse], [DepartementId], [TypeUserId], [Email] FROM [Utilisateur]"></asp:SqlDataSource>
    </form>
</body>
</html>
