<%@page import="java.sql.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/updatecmpt.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <title>View Complaints</title>
</head>
<body>

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
                font-weight: bold;">User Complaints</p>
            </div>

                <center>
            <table class="table table-striped">
				<thead>
                        <th>Comp id</th>
                        <th>Full name</th>
						<th>Number</th>
						<th>Email</th>
						<th>Complaint Type</th>
						<th>Explanation</th>
						<th>image</th>
                                                <th>Address</th>
						<th>latitude</th>
						<th>longitude</th>
						<th>Status</th>
						<th>Alloted Employee</th>
                                                <th>Action</th>


</thead>
<tbody>
<% 

String host="jdbc:mysql://localhost:3306/complaint";
Connection conn=null;
Statement stat=null;
ResultSet res=null;
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection(host,"root","");
stat=conn.createStatement();
String data="select * from complaint order by id";
res=stat.executeQuery(data);
while(res.next()){
	
%>
<tr>
    <td><%=res.getString("id") %></td>
  <td><%=res.getString("fullname") %></td>
   <td><%=res.getString("number") %></td>
    <td><%=res.getString("email") %></td>
     <td><%=res.getString("complainttype") %></td>
      <td><%=res.getString("explanation") %></td>
       <td><a target="_blank" href="images/<%=res.getString("filename") %>">
           <image src="images/<%=res.getString("filename") %>" width="70" height="70"/>
           </a>
       </td>
        <td><%=res.getString("address") %></td>
       <td><%=res.getString("latitude") %></td>
       <td><%=res.getString("longitude") %></td>
       <td><%=res.getString("status") %></td>
       <td><%=res.getString("employee") %></td>
       <td>
            <a href='updateDriver.jsp?u=<%=res.getString("number") %>' class="btn btn-info">Update</a>
       </td>
 </tr>
 <%
 }%>
</tbody>

</table>

<div class="form-btn">
	<a href="officerdashboard.html"><h3 align="center" style="color: white">Back to Home</h3></a>
</div>

</div>
</div>
<br><br>

</body>
</html>