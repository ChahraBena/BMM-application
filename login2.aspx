<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login2.aspx.cs" Inherits="login2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>BMMApp | Login</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>  
  <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>  
  <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.min.css"/>
  <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"> </script>
    
<style>
      @import url(https://fonts.googleapis.com/css?family=Exo:100,200,400);
      @import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);
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
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background-image: url(Images/Sonatrach.png);
	background-size: cover;
	-webkit-filter: blur(2px);
	z-index: 0;
}

.grad{
	position: absolute;
	top: 0px;
	left: 0px;
	right: 0px;
	bottom: 0px;
	width: 25px;
	height: 25px;
	opacity: 1.5;
}
.grad>img
{
width:130px;
height:130px;
overflow:hidden;
}
.header{
	position: absolute;
	top: calc(50% - 180px);
	left: 469px;
	z-index: 2;
}

.header div{
	float: left;
	color: #FFFFFF;
	font-family:'Source Serif Pro', serif;
	font-size: 40px;
	font-weight: 200;
}

.header div span{
	color: #000000;
}

.login{
	position: absolute;
	top: calc(50% - 75px);
	left:483px;
	height: 150px;
	width: 350px;
	padding: 10px;
	z-index: 2;
}

.input-group{
    margin-top:5px;
    margin-bottom:0px;
    margin-left:40px;
    margin-right:40px;
}

.container {
    position:absolute;
    top:210px;
    height:490px;
    margin-right:40px;
      
}

.btn{
    margin-top:10px;
    margin-left:26px;
    width:297px;
    background-color:#FFBF00;
}
.panel{
    width:380px;
    height:300px;
    position: relative;
	top: 240px;
	left: 495px;
	z-index: 2;
}
.form-top {
	overflow: hidden;
	padding: 0 25px 15px 25px;
	background: #444;
	background: rgba(0, 0, 0, 0.35);
	-moz-border-radius: 4px 4px 0 0; -webkit-border-radius: 4px 4px 0 0; border-radius: 4px 4px 0 0;
	text-align: left;
}

.form-top-left {
	float: left;
	width: 75%;
	padding-top: 25px;
}
.LoginForm{
    margin-top:30px;

}
.label
{
    margin-left:30px;
    font-size:10px;
}
.text-danger{
    font-size:15px;
    margin-left:40px;
    margin-top:50px;
   

}

.form-top-left h3 { margin-top: 0; color: #fff; }
.form-top-left p { opacity: 0.8; color: #fff; }
.msg{
    color:red;
}

    </style>
</head>
<body>
    <form id="form1" runat="server" class="form-horizontal">
        <div class="body"></div>
	    <div class="grad"><img src="Images/logo.png"/></div>
		<div class="header">
			<div><strong>BMM</strong> Application <strong>Login</strong> </div>
		</div>
      <div class="panel" style="background-color:rgba(255, 99, 71, 0.2)">  
          <div class="form-top">
              	<div class="form-top-left">
                    <h3>Authentification</h3>
                </div>              

          </div>
          <div class="LoginForm">
              <div class="form-horizontal">
              <div class="input-group">
                     <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <asp:TextBox ID="TextBoxUser" runat="server"  type="text" class="form-control" name="username" placeholder="Nom d'utilisateur" OnTextChanged="TextBoxUser_TextChanged" ></asp:TextBox>
                    </div>
                  <div class="label">
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Saisir le nom d'utilisateur" CssClass="text-danger" ControlToValidate="TextBoxUser" ></asp:RequiredFieldValidator>
                  
                  </div>
                 
                    
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <asp:TextBox ID="TextBoxPassword" runat="server"  name ="password" type="password" class="form-control"  placeholder="Mot de passe" OnTextChanged="TextBoxPassword_TextChanged" ViewStateMode="Enabled"></asp:TextBox>
                     </div>
                   <div class="label">
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Saisir le mot de passe" CssClass="text-danger" ControlToValidate="TextBoxPassword" ></asp:RequiredFieldValidator>
                  
                  </div>
                  
                   
                        <div class="container">
                    <asp:Button ID="ButtonSubmit"  runat="server" CssClass="btn btn-warning "  Text="S'authentifier" OnClick="ButtonSubmit_Click" />
                   
                  <div class="input-group msg">
                       <asp:Label ID="LabelError" runat="server" Text="Le nom d'utilisateur et le mot de passe est érroné" Visible="false"></asp:Label>
                       </div>
               </div>
                  </div>
               
          
              </div>
           
         </div>
    </form>

</body>
</html>
