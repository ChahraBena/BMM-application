﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjouterUser.aspx.cs" Inherits="AjouterUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>BMMApp | Ajouter</title>
     <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>  
  <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>  
  <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.min.css"/>
  <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"> </script>
        <style>
         @import url('https://fonts.googleapis.com/css?family=Source+Serif+Pro');
        body{
	margin: 0;
	padding: 0;
	background: #fff;

	color: #fff;
	font-family: Arial;
	font-size: 12px;
}
        .body{
            opacity:0.8;
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background-image: url(Images/Sonatrach.png);
	background-size: cover;
	-webkit-filter: blur(8px);
	z-index: 0;
}
        .sidebar{
	width:14.5%;
	position:absolute;
	top:0;
	bottom:0;
	left:0;
	background-color:#EFA805;
    margin-top:51px;
}
        
.navbar-header img{
	height:40px;
	width:40px;
	margin-left:0px;
	margin-top:5px;
    margin-bottom:5px;
    margin-right:10px;
}

.navbar-custom {
    background-color:#E97304;
    color:#ffffff;
    border-radius:0;
}

.navbar-custom .navbar-nav > li > a {
    color:#fff;
}

.navbar-custom .navbar-nav > .active > a {
    color: #ffffff;
    background-color:transparent;
}

.navbar-custom .navbar-nav > li > a:hover,
.navbar-custom .navbar-nav > li > a:focus,
.navbar-custom .navbar-nav > .active > a:hover,
.navbar-custom .navbar-nav > .active > a:focus,
.navbar-custom .navbar-nav > .open >a {
    text-decoration: none;
    background-color: #E97304;
}

.navbar-custom .navbar-brand {
    color:#eeeeee;
}
.navbar-custom .navbar-toggle {
    background-color:#eeeeee;
}
.navbar-custom .icon-bar {
    background-color:#33aa33;
}



	nav.sidebar.navbar {
		border-radius: 0px;
	}

	nav.sidebar, .main{
		-webkit-transition: margin 200ms ease-out;
	    -moz-transition: margin 200ms ease-out;
	    -o-transition: margin 200ms ease-out;
	    transition: margin 200ms ease-out;
	}

	/* Add gap to nav and right windows.*/
	.main{
		padding: 10px 10px 0 10px;
	}

	/* .....NavBar: Icon only with coloring/layout.....*/

	/*small/medium side display*/
	@media (min-width: 768px) {

		/*Allow main to be next to Nav*/
		.main{
			position: absolute;
			width: calc(100% - 40px); /*keeps 100% minus nav size*/
			margin-left: 40px;
			float: right;
		}

		/*lets nav bar to be showed on mouseover*/
		nav.sidebar:hover + .main{
			margin-left: 200px;
		}

		/*Center Brand*/
		nav.sidebar.navbar.sidebar>.container .navbar-brand, .navbar>.container-fluid .navbar-brand {
			margin-left: 0px;
		}
		/*Center Brand*/
		nav.sidebar .navbar-brand, nav.sidebar .navbar-header{
			text-align: center;
			width: 100%;
			margin-left: 0px;
		}

		/*Center Icons*/
		nav.sidebar a{
			padding-right: 13px;
		}

		/*adds border top to first nav box */
		nav.sidebar .navbar-nav > li:first-child{
			border-top: 1px #e5e5e5 solid;
		}

		/*adds border to bottom nav boxes*/
		nav.sidebar .navbar-nav > li{
			border-bottom: 1px #e5e5e5 solid;
		}

		/* Colors/style dropdown box*/
		nav.sidebar .navbar-nav .open .dropdown-menu {
			position: static;
			float: none;
			width: auto;
			margin-top: 0;
			background-color: transparent;
			border: 0;
			-webkit-box-shadow: none;
			box-shadow: none;
		}

		/*allows nav box to use 100% width*/
		nav.sidebar .navbar-collapse, nav.sidebar .container-fluid{
			padding: 0 0px 0 0px;
		}

		/*colors dropdown box text */
		.navbar-inverse .navbar-nav .open .dropdown-menu>li>a {
			color: #777;
		}

		/*gives sidebar width/height*/
		nav.sidebar{
			width: 200px;
			height: 100%;
			margin-left: -160px;
			float: left;
			z-index: 8000;
			margin-bottom: 0px;
		}

		/*give sidebar 100% width;*/
		nav.sidebar li {
			width: 100%;
		}

		/* Move nav to full on mouse over*/
		nav.sidebar:hover{
			margin-left: 0px;
		}
		/*for hiden things when navbar hidden*/
		.forAnimate{
			opacity: 0;
		}
	}

	/* .....NavBar: Fully showing nav bar..... */

	@media (min-width: 1330px) {

		/*Allow main to be next to Nav*/
		

		/*Show all nav*/
		nav.sidebar{
            margin-top:0px;
			margin-left: 0px;
			float: left;
		}
		/*Show hidden items on nav*/
		nav.sidebar .forAnimate{
			opacity: 1;
		}
	}

	nav.sidebar .navbar-nav .open .dropdown-menu>li>a:hover, nav.sidebar .navbar-nav .open .dropdown-menu>li>a:focus {
		color: #CCC;
		background-color: transparent;
	}

	nav:hover .forAnimate{
		opacity: 1;
	}
	section{
		padding-left: 15px;
	}

    .form-horizontal{
        margin-top:50px;
        margin-left:40px;
    }
  
  
    </style>
</head>





<body>
    <div class="body"></div>
    <div class="nav">
        <nav class="navbar navbar-custom">
  <div class="container-fluid">
        <div class="navbar-header">
          <img src="../Images/logo.png" >      
        </div>
       <a class="navbar-brand" href="#">BMMApp</a>
        
        <ul class="nav navbar-nav navbar-right">
          <li><a href="#"><span class="glyphicon glyphicon-user"></span>
              <asp:Label ID="Label1" runat="server" Text=""></asp:Label> </a></li>
          <li><a href="../Disconnect.aspx"><span class="glyphicon glyphicon-log-in"></span> Se déconnecter</a></li>
        </ul>
      </div>
    </nav>
    </div>
     <div class="sidebar">
        <nav class="navbar navbar-inverse sidebar" role="navigation">
    <div class="container-fluid">
		<div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="AcceuilUser.aspx">Acceuil<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
                <li ><a href="CréerBMM.aspx">BMM<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-list-alt"></span></a></li>
                 				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Historique<span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></a>
					<ul class="dropdown-menu forAnimate" role="menu">
						<li><a href="HistoriqueEncours.aspx">BMM en cours</a></li>
						<li><a href="HistoriqueValide.aspx">BMM validés</a></li>
					</ul>
				</li>
                <li class="active"><a href="AjouterUser.aspx">Administration<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-cog"></span></a></li>
			</ul>
		</div>
	</div>
</nav>

    </div>
  
    
  <form id="contactForm" runat="server" method="post" class="form-horizontal">
      <div class="col-md-2">
      </div>
      <div class="col-md-8">
           <h2>Ajouter un utilisateur</h2> 
          <br /><br />
          <div class="form-group">
        <%--  --%>

       <h4> <label class="col-md-2 control-label content">Nom *</label></h4>
        <div class="col-md-4">
            <asp:TextBox ID="TextBoxNom" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
    </div>
      <div class="form-group">
        <label class="col-md-2 control-label content">Prenom *</label>
        <div class="col-md-4">
            <asp:TextBox ID="TextBoxPrenom" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
    </div>
      <div class="form-group">
        <label class="col-md-2 control-label content">Nom d'utilisateur *</label>
        <div class="col-md-4">
            <asp:TextBox ID="TextBoxUsername" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
    </div>
       <div class="form-group">
        <label class="col-md-2 control-label content">Matricule *</label>
        <div class="col-md-4">
            <asp:TextBox ID="TextBoxMatricule" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-2 control-label content">Email *</label>
        <div class="col-md-4">
            <asp:TextBox ID="TextBoxEmail" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-2 control-label content">Département</label>
        <div class="col-md-4">
            <asp:DropDownList  ID="DropDownListDepartement" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nom" DataValueField="Nom"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1"  runat="server" ConnectionString="<%$ ConnectionStrings:BMM_SHConnectionString2 %>" SelectCommand="SELECT [Nom] FROM [Departement]"></asp:SqlDataSource>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-2 control-label content">Type</label>
        <div class="col-md-4">
            <asp:DropDownList ID="DropDownListType" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nom" DataValueField="Nom"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BMM_SHConnectionString2 %>" SelectCommand="SELECT [Nom] FROM [TypeUser]"></asp:SqlDataSource>
        </div>
    </div>
       <div class="form-group">
        <label class="col-md-2 control-label content">Mot de passe *</label>
        <div class="col-md-4">
            <asp:TextBox ID="TextBoxMotdepasse" type="password" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
    </div>
      <div class="form-group">
        <label class="col-md-2 control-label content">Confirmer le mot de passe *</label>
        <div class="col-md-4">
            <asp:TextBox ID="TextBoxConfirm" type="password" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
    </div>
    <!-- #messages is where the messages are placed inside -->
 
    <div class="form-group">
        <div class="col-md-9 col-md-offset-3">
            <button type="submit" class="btn btn-warning">Validate</button>
            <asp:Label ID="Label2"  runat="server" Text=""></asp:Label>
        </div>
    </div>
      </div>
      <div class="col-md-4"></div>
    
</form>
    
	<script type="text/javascript">
        $(document).ready(function () {
            $('#contactForm').bootstrapValidator({
                container: '#messages',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    TextBoxNom: {
                        validators: {
                            notEmpty: {
                                message: 'Veuillez saisir le nom'
                            }
                        }
                    },
                    TextBoxPrenom: {
                        validators: {
                            notEmpty: {
                                message: 'Veuillez saisir le précom'
                            }
                        }
                    },
                    TextBoxUsername: {
                        validators: {
                            notEmpty: {
                                message: 'Veuillez saisir le nom d utilisateur'
                            }
                        }
                    },
                    TextBoxMatricule: {
                        validators: {
                            notEmpty: {
                                message: 'Veuillez saisir le matricule'
                            }
                        }
                    },
                    TextBoxEmail: {
                        validators: {
                            notEmpty: {
                                message: ''
                            },
                            emailAddress: {
                                message: 'Cette adresse n est pas valide'
                            }
                        }
                    },

                    TextBoxMotdepasse: {
                        validators: {
                            notEmpty: {
                                message: 'Veuillez saisir le mot de passe'
                            }
                           
                        }
                    },
                    TextBoxConfirm: {
                        validators: {
                            notEmpty: {
                                message: 'Veuillez saisir le mot de passe'
                            },
                         identical: {
                             field: 'TextBoxMotdepasse',
                             message: 'Veuillez confirmer le mot de passe'
                            }
                        }
                    }
                }
            });
        });
          </script>
   
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"> </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
   <script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>


</body>
</html>

