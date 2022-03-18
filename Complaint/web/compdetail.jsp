<html>
    <head>
		<title>Check Status</title>
		<link rel="stylesheet" href="css/compdetail.css">
    </head>
    <body>

        <div class="container">
			<form action=""newjsp.jsp method="post">
                <br><br><br><br><br><br><br><br><br><br>
				<div class="form-heading">
					<h1>Check Status</h1>
				</div>
				<div class="form-group">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>Enter Complaint ID</label><br><br>
					&nbsp;<input type="text" name="eid">
				</div>
				<div class="form-btn">  
					<input type="submit"  value="Get Status">
				</div>
				
				<div class="form-btn">
					<a href="dashboard.html">Back to Home</a>
				</div>

        	</form>
		</div>
    
<%@page import="java.sql.*"%>

<%
String id=request.getParameter("eid");
try
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/complaint","root","");
    if(!cn.isClosed())
    {
        PreparedStatement ps=cn.prepareStatement("select * from complaint where id='"+id+"'");
        ResultSet rs=ps.executeQuery();
        if(rs.next())
        {%>
       <div class="container">
		<form >
                    <br><br><br><br><br><br><br><br>
			<div class="form-group">
				<label>Complaint ID:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" readonly value='<%=rs.getString("id") %>'>
			</div>
			<div class="form-group">
				<label>First Name:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" readonly value='<%=rs.getString("fullname") %>'>
			</div>
			<div class="form-group">
				<label>Cont Number:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" readonly value='<%=rs.getString("number") %>'>
			</div>
			<div class="form-group">
				<label>Email:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" readonly value='<%=rs.getString("email") %>'>
			</div>
			<div class="form-group">
				<label>Complaint Type:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" readonly value='<%=rs.getString("complainttype") %>'>
			</div>
			<div class="form-group">
				<label>Status:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" readonly value='<%=rs.getString("status") %>'>
			</div>
			<div class="form-group">
				<label>Alloted Employee:</label>&nbsp;&nbsp;&nbsp;
				<input type="text" readonly value='<%=rs.getString("employee") %>'>
			</div>
		</form>
	</div>
    </body>
</html>
        <%}
        else
        {
            out.println("");
        }
    }
}
catch (Exception e)
{
    out.println("The Error is :" +e.getMessage());
}

%>