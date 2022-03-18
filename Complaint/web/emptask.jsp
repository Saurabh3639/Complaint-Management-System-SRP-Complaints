<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <title>Employee Dashboard</title>
  <link rel="stylesheet" href="assets/css/bootstrap.css">
  <link rel="stylesheet" href="assets/css/google_releway.css">
  <link rel="stylesheet" href="assets/css/google_coiny.css">
  <link rel="stylesheet" href="css/awesomefont.css">
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="//pro.fontawesome.com/releases/v5.10.0/css/all.css">
  <link rel="stylesheet" href="//cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
  <link rel="stylesheet" href="//cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css'>
  <link rel="stylesheet" href="./style.css">
  <link rel="stylesheet" href="css/emptask.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
</head>
<%
	
%>
<body>
    
    
<div class="topnav">
  <a class="active" href="#"><i class="fa fa-users fa-lg" aria-hidden="true">	&nbsp;Employee Dashboard</i></a>
  <div class="topnav-right">
      <a href="index.html"><i class="fa fa-sign-out fa-lg" aria-hidden="true" style="color: white;"> Logout</i></a>
  </div>
</div>
    <br>
<div class="gone">
		<p style="color: #D0C1ED;
		font-family: Georgia, serif;
		font-size: 40px;
		font-weight: bold; ">Alloted Complaints</p>
		</div>
    <% 
	String name=(String)session.getAttribute("fname");
	System.out.println(name);
	try{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/complaint","root","");
	Statement st= con.createStatement();

	ResultSet rs=st.executeQuery("select * from complaint where employee='"+name+"'");
	
	
	while(rs.next()){
		
	


%>

    <div class="content-blog">
		<div class="container">
                    <center>
                    <table class="table table-striped">
                        <thead >
                                                <th style="padding: 6px 6px;">Comp id</th>
                                                <th style="padding: 6px 6px;">Full name</th>
                                                <th style="padding: 6px 6px;">Address</th>
						<th style="padding: 6px 6px;">Number</th>
						<th style="padding: 6px 6px;">Email</th>
						<th style="padding: 6px 6px;">Complaint Type</th>
						<th style="padding: 6px 6px;">Explanation</th>
						<th style="padding: 6px 6px;">latitude</th>
						<th style="padding: 6px 6px;">longitude</th>
						<th style="padding: 6px 6px;">Status</th>
						<th style="padding: 6px 6px;">Alloted Employee</th>


</thead>
<tbody>
	
	<tr style=" border-bottom: 2px solid #BB9FF3;">		
			<td><%out.println(rs.getString(1)); %></td>
			<td><%out.println(rs.getString(2));%></td>
			<td><%out.println(rs.getString(3)); %></td>
			<td><%out.println(rs.getString(4)); %></td>
			<td><%out.println(rs.getString(5)); %></td>
			<td><%out.println(rs.getString(6)); %></td>
			<td><%out.println(rs.getString(7)); %></td>
			<td><%out.println(rs.getString(9)); %></td>
			<td><%out.println(rs.getString(10)); %></td>
			<td><%out.println(rs.getString(11)); %></td>
			<td><%out.println(rs.getString(12)); %></td>
			
		
	</tr>


<%
	}
	}
	catch(Exception e){
		System.out.println(e);
	}

%>
</tbody>
</table><br><br>

</body>
<script src="../dataTables/js/jquery.js"></script>
<script src="../dataTables/js/jquery.datatables.js"></script>
<script src="../dataTables/js/datatables.bootstrap.js"></script>
<script src="//code.jquery.com/jquery-3.5.1.js"></script>
<script src="//cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script src="//cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="//cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>
<script src="//cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script> 

<script>


$(document).ready(function() {
    $('#example').DataTable( {
    	
    } );
} );
</script>

</html>