﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CréerBmm.aspx.cs" Inherits="CréerBmm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Créer BMM</title>
    <script>
        function change(textb,buttont)
        {
            var t = document.getElementById('<%= modele0.ClientID%>');
            if (textb.value.length >= 1 && t.value.length >= 1) {
                document.getElementById(buttont).disabled = false;
            }
            else { document.getElementById(buttont).disabled = true; }
        }
    </script>

   <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">   
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
<script type="text/javascript" 

src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" 

src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>  
   
     <script>
$(document).ready(function(){
    $('#myTable').dataTable();
});
</script>      <style>
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
	background-color:#FAFAFA;
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
    .contenu{
        font-size:15px;
        font-family:'Source Serif Pro', serif;
        color:white;
        top:10px;
        left:40px;
    }
    .h2{
        margin-bottom:35px;
    }
    .buttons{
        margin-left:220px;
        margin-top:62px;
    }
    .buttonss{
        margin-right:-110px;
    }
    
       .tableBack{
           background-color:#EFA805;
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
              <asp:Label ID="LabelUser" runat="server" Text=""></asp:Label> </a></li>
          <li><a href="Disconnect.aspx"><span class="glyphicon glyphicon-log-in"></span> Se déconnecter</a></li>
        </ul>
      </div>
    </nav>
    </div>
     </div>
    <div class="sidebar">
        <nav class="navbar navbar-inverse sidebar" role="navigation">
    <div class="container-fluid">
		<div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li ><a href="AcceuilUser.aspx">Acceuil<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
                <li class="active"><a href="CréerBMM.aspx">BMM<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-list-alt"></span></a></li>
                 				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Historique<span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></a>
					<ul class="dropdown-menu forAnimate" role="menu">
						<li><a href="HistoriqueEncours.aspx">BMM en cours</a></li>
						<li><a href="HistoriqueValide.aspx">BMM validés</a></li>
					</ul>
				</li>
                        <li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Stock<span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-shopping-cart"></span></a>
					<ul class="dropdown-menu forAnimate" role="menu">
						<li><a href="Livraison.aspx">BMM à livrer</a></li>
						<li><a href="stock.aspx">Gestion de stock</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>

    </div>
  
    
  <form id="contactForm" runat="server" method="post" class="form-horizontal">
     <div class="form-group">
          <div class="col-md-5">
              <asp:Button ID="add_row" class="btn btn-warning pull-left  buttons" runat="server" Text="Ajouter ce produit" OnClick="add_row_Click" Enabled="false" />
              
          </div>
         <div class="col-md-4">
             <div class="contenu">
                   <h2>Créer un BMM</h2></div>
                    <asp:Button ID="delete_row" class="pull-right btn btn-warning buttonss" runat="server" Text="Valider BMM" OnClick="delete_row_Click" Enabled="false" />
       
         </div>
         
              </div>
       <div class="row clearfix">
           <div class="col-md-2 column">

           </div>
		<div class="col-md-8 column" id="tableau" runat="server">
           
            <div class="matable" id="Matable" runat="server" visible="false" onclick="delete_row_Click">
                
                <br />
                <div class="table-responsive table-back">
                    <table id="myTable" class="display table">
                        <thead>
                            <tr>
                                <th>Modèle</th>
                                <th>Marque</th>
                                <th>Description</th>
                                <th>Référence</th>
                            </tr>
                        </thead>
                        <tbody  id="BmmBody" runat="server">
                           
                        </tbody>



                    </table>
                </div>
            </div>
          
       
            <div class="tableau" id="tab" runat="server">

            
			<table class="table table-bordered table-hover" id="tab_logic">
				<thead>
					<tr >
						<th class="text-center">
							#
						</th>
						<th class="text-center">
							Modèle
						</th>
						<th class="text-center">
							Marque
						</th>
						<th class="text-center">
							Déscription
						</th>
                        <th class="text-center">
							Référence
						</th>
					</tr>
				</thead>
				<tbody>
					<tr id='addr0'>
						<td>
						<asp:Label ID="Label2" runat="server" Text="1"></asp:Label>
						</td>
						<td>
						<asp:TextBox ID="modele0" placeholder='Modèle' class="form-control" runat="server" OnTextChanged="modele0_TextChanged" onkeyup="change(this,'add_row');"></asp:TextBox>
						</td>
						<td>
						<asp:TextBox ID="marque0" placeholder='Marque' class="form-control" runat="server"></asp:TextBox>
						</td>
						<td>
						<asp:TextBox ID="description0" placeholder='Description' class="form-control" runat="server"></asp:TextBox>
						</td>
                        <td>
						<asp:TextBox ID="reference0" placeholder='Référence' class="form-control" runat="server"></asp:TextBox>
						</td>
					</tr>
				</tbody>
			</table>
                </div>
            <br />
             <asp:Button ID="Button1" CssClass="btn btn-warning" runat="server" Text="Confirmer" Visible="false" OnClick="Button1_Click" />
         <asp:Button ID="Button2" CssClass="btn btn-warning" runat="server" Text="Annuler" Visible="false" OnClick="Button2_Click" />

		</div>

           <div class="col-md-2 ">
           </div>
	</div>
	
       
    
</form>

   
   
    <script src="../Scripts/bootstrap.min.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
   <script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>


</body>
</html>
