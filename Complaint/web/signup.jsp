<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
	<%@page import="java.sql.*,java.util.*"%>
	<%
	
		String fn = request.getParameter("first name");
		String ln = request.getParameter("last name");
		String eml = request.getParameter("email");
		String cont = request.getParameter("number");
		String add = request.getParameter("address");
		String pass = request.getParameter("password");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/complaint", "root", "");
		Statement st = con.createStatement();
		int i = st.executeUpdate("insert into user values('" + fn + "','" + ln + "','" + eml + "','" + cont + "','" + add + "','" + pass + "')");
	%>
</body>
</html>