<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Creation.aspx.cs" Inherits="Creation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Inscription</title>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>

</head>

<body>
    <div class="sidebar">
		<div class="titre">
			<img src="Images/logo.png" />
			<p>BMM App</p>
		</div>

		<ul class="nav">
			<li class="nav-item">
				<img src="Images/admin.png"/>
				Administration
			</li>
				<li class="nav-item">
				<img src="Images/validation.png"/>
				Validation
			</li>
				<li class="nav-item">
				<img src="Images/bmm.png"/>
				BMM
			</li>
			<li class="nav-item">
				<img src="Images/stock.png"/>
				Stock
			</li>

		</ul>
			
	</div>
	<div class="header">
		<ul class="header-left">
			<li>
				<a href="index.html"></a>
				<img src="Images/logout.png"/>
			</li>
			<li>
				<img src="Images/profil.png"/>
			</li>
			<li>
				<img src="Images/notification.png"/>
				<span class="alert">2</span>
			</li>
			
		</ul>

		<div class="user">
			<img src="Images/user.png"/>
			<p>Amroun Nassim</p>
		</div>
		<div class="cb"></div>
		<ul class="header-menu">
			<a href="#">
			<li>BMM</li>

			</a>
			<a href="#">
			<li>Ajouter</li>

			</a>
		</ul>
	</div>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <div class="body"></div>
    		<div class="grad"></div>
		<div class="header">
			<div></div>
		</div>

    <form id="form1" runat="server">
    <div>
    
    </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">Nom :</td>
                <td class="auto-style13">
                    <asp:TextBox ID="TextBoxName" runat="server" OnTextChanged="TextBox1_TextChanged" Width="178px"></asp:TextBox>
&nbsp;</td>
                <td class="auto-style14">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxName" CssClass="auto-style9" ErrorMessage="*Ce champ est obligatoire"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">Prénom :</td>
                <td class="auto-style11">
                    <asp:TextBox ID="TextBoxFirstName" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style15">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBoxFirstName" CssClass="auto-style9" ErrorMessage="*Ce champ est obligatoire"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style12">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">Matricule :</td>
                <td class="auto-style11">
                    <asp:TextBox ID="TextBoxMatricule" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style15">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBoxMatricule" ErrorMessage="*Ce champ est obligatoire"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style12">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Nom d&#39;utilisateur :</td>
                <td class="auto-style13">
                    <asp:TextBox ID="TextBoxUserName" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style14">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxUserName" ErrorMessage="*Ce champ est obligatoire"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">Departement :</td>
                <td class="auto-style11">
                    <asp:DropDownList ID="DropDownListStructure" runat="server" Width="185px" OnSelectedIndexChanged="DropDownListStructure_SelectedIndexChanged" DataSourceID="SqlDataSource2" DataTextField="Nom" DataValueField="Nom">
                        <asp:ListItem>Selectionner Le departement</asp:ListItem>
                        <asp:ListItem Value="Informatique"></asp:ListItem>
                        <asp:ListItem Value="Trésorie"></asp:ListItem>
                        <asp:ListItem Value="Finance"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BMM_SHConnectionString %>" SelectCommand="SELECT [Nom] FROM [Departement]"></asp:SqlDataSource>
                </td>
                <td class="auto-style15">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="DropDownListStructure" ErrorMessage="*Veuillez selectionner le nom de la structure" InitialValue="Selectionner la structure"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style12">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Email :</td>
                <td class="auto-style13">
                    <asp:TextBox ID="TextBoxEmail" runat="server" TextMode="Email" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style14">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBoxEmail" CssClass="auto-style9" ErrorMessage="*Veuillez saisir l'adresse Email"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" CssClass="auto-style9" ErrorMessage="*Adresse non valide" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Type Utilisateur:</td>
                <td class="auto-style13">
                    <asp:DropDownList ID="DropDownListUser" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nom" DataValueField="Nom" Width="185px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BMM_SHConnectionString %>" SelectCommand="SELECT [Nom] FROM [TypeUser]"></asp:SqlDataSource>
                </td>
                <td class="auto-style14">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="DropDownListUser" ErrorMessage="*Veuillez selectionner le type d'utilisateur"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Mot de passe :</td>
                <td class="auto-style13">
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style14">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="*Veuillez entrer le mot de passe"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">Confimer Mot de passe :</td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBoxConfirmPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style16">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBoxConfirmPassword" ErrorMessage="*Veuillez confimer le mot de passe"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxConfirmPassword" CssClass="auto-style9" ErrorMessage="*Les deux mots de passe sont différents "></asp:CompareValidator>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="ButtonEnregistrer" runat="server" OnClick="Button1_Click" Text="Enregistrer" CssClass="btn btn-success" Width="102px" />
                    <asp:Label ID="LabelError" runat="server"></asp:Label>
                </td>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
            </tr>
        </table>
    </form>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"> </script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-1.9.1.min.js"></script>

</body>
</html>
