<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/feedtable.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <title>View Feedback</title>   
</head>
<body>
    <%@page import="java.sql.*,java.util.*"%>
    <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/complaint","root","");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from feedback");
    %>
        
	<header>
		<div class="left_area">
			<h3><a href="officerdashboard.html">Welcome Officer</a></h3> 
		</div> 

		<div class="right_area">
			<h4><a href="logout.jsp" id="logout">Logout</a></h4>
		</div>
	</header>

    <div class="icon"><i class="fas fa-user-tie"></i></div>

    <ul class="nav">
        <li><a href="updatecmpt.jsp">View Complaints</a></li>
        <li><a href="feedtable.jsp">View Feedback</a></li>
        <li><a href="emptable.jsp">Employee Details</a></li>
        <li><a href="contactdept1.html">Department Contacts</a></li>
    </ul>

	<div class="content-blog">
		<div class="container">

			<div class="headerr">
				<p style="color: #d8f0f2;
				font-family: Georgia, serif;
				font-size: 40px;
				font-weight: bold; ">User Feedbacks</p>
			</div>

			<table class="table table-striped content-table">
				<thead>
                                   
						<th>Experience</th>
						<th>First name</th>
						<th>Last name</th>
						<th>Number</th>
						<th>Email</th>
						<th>Comments</th>
					
				</thead>
                                <%
                                while(rs.next()){
                                %>
				<tbody >
					<tr class="active-row">
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getString(3)%></td>
						<td><%=rs.getString(4)%></td>
						<td><%=rs.getString(5)%></td>	
						<td><%=rs.getString(6)%></td>								
					</tr>
				</tbody>
			<% } %></table>

			<div class="form-btn">
				<a href="officerdashboard.html"><h3 align="center" style="color: white">Back to Home</h3></a>
			</div>
			<br>

		</div>
	</div>
</body>
</html>
