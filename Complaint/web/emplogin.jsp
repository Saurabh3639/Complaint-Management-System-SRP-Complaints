<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String email=request.getParameter("email");
String pass=request.getParameter("password");
int z=0;
String imgFileName=null;
session.setAttribute("amount",1000);
try{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/complaint","root","");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from employee where email='"+email+"' AND password='"+pass+"'");
	
	while(rs.next()){
		
		session.setAttribute("fname",rs.getString(2));
	
		response.sendRedirect("emptask.jsp");
			
	}
        if(z==0){
		//response.sendRedirect("login.jsp");
	}

}
catch(Exception e){
	out.println(e);
	//response.sendRedirect("login.jsp?msg=notexist");
}

%>
<!DOCTYPE html>
<html>
<head>
	<title>Login Page</title>
<style>
/*body background css*/
body{
	padding: 0;
	margin: 0;
	background: url(https://i.postimg.cc/7bvS4jZ5/pexels-pixabay-33266.jpg)no-repeat;
	background-size: cover;
}

/*login form css*/
.form{
	font-family: "Roboto", sans-serif;
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	opacity: 95%;
	max-width: 260px;
	margin: 150px auto 100px;
	padding: 10px 45px 30px 45px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
	border-radius: 10px;
}
.form p{
	font-size: 15px;
	padding: 1px;
	text-align: center;
}
.form input{
	outline: 0;
	border-radius: 10px;
	background: #F2F2F2;
	width: 100%;
	border: 0;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 14px;
}

.form button{
	text-transform: uppercase;
	outline: 0;
	border-radius: 10px;
	background: #1ADBE5;
	width: 100%;
	border: 0;
	padding: 15px;
	color: #FFFFFF;
	font-size: 14px;
	cursor: pointer;
}
.form button:hover, .form button:active, .form button:focus{
	background-color: #06C5CF;
	transition: all 1s ease 0s;
}
.form .message{
	margin: 15px 0 0;
	color: #B3B3B3;
	font-size: 12px;
}
.form .message a{
	color: #06C5CF;
	text-decoration: none;
}
</style>
	</head>
<body>
	<div class="form" style="padding: 60px 60px">
	<p style="font-size: 20px; font-weight: bold; color: #666; padding: 6px 2px; background-color: #E0FFFF;">Employee Login</p>
        <br>
	<form >
		<input type="text" name="email" placeholder="email">
		<input type="password" name="password" placeholder="password">
        <button>login</button><br>
		<p class="message" style="font-size: 16px;">Not registered? <a href="empregister.jsp">Create an account</a></p>
		
		<br>
		<a href="index.html">Back to Home</a>
		
	</form>
	</div>
</body>
</html>