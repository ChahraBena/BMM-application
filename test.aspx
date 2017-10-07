<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Créer BMM</title>
  
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
</script>
     
    <style>
    
    </style>
    </head>
<body>
    <form id="contactForm" runat="server" method="post" class="form-horizontal">
        <div class="table-responsive">
<table id="myTable" class="display table" >

            <thead>  
          <tr>  
            <th>Code</th>  
            <th>Date Création</th>  
            <th>Validation 1</th>  
            <th>Validation 2</th>  
            <th>Livraison</th>
          </tr>  
                 <tbody>
     <% foreach (var p in Liste) { %>
             <tr>
    <td><%= p.getModele() %></td>
                 <td><%= p.getModele() %></td>
                 <td><%= p.getModele() %></td>
                 <td><%= p.getModele() %></td>
  </tr>
<% } %>
</tbody>
        </thead>  
         
          

</table>
</div>
    </form>
    
</body>
</html>