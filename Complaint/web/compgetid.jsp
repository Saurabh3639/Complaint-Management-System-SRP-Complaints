<html>
    <head>
		<title>Get Complaint ID</title>
		<link rel="stylesheet" href="css/compgetid.css">
    </head>

    <body>
    <div class="container">
		<form action=""newjsp.jsp method="post">
                  
			<div class="form-heading">
				<h1>Get Complaint ID</h1>
			</div>
			<div class="form-group">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>Enter Contact Number</label><br><br>
				&nbsp;<input type="text" name="eid">
			</div>
			<div class="form-btn">  
				<input type="submit"  value="Get Complaint ID">
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
        PreparedStatement ps=cn.prepareStatement("select * from complaint where number='"+id+"'");
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