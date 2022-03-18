<%@ page import="java.sql.*" %>  

<%
if(session.getAttribute("officer")!=null) 
{
	response.sendRedirect("index.html");
}
%>

<%
try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/complaint","root",""); 
	
	if(request.getParameter("login")!=null) //check login button click event not null
	{
		String dbemail,dbpassword;
		
		String email,password;
		
		email=request.getParameter("email"); 
		password=request.getParameter("password");
		
		PreparedStatement pstmt=null;
		
		pstmt=con.prepareStatement("select * from officer where email=? AND password=?"); //sql select query 
		pstmt.setString(1,email);
		pstmt.setString(2,password);
		
		ResultSet rs=pstmt.executeQuery(); //execute query and store in resultset object rs.
		
		if(rs.next())
		{
			dbemail=rs.getString("email");
			dbpassword=rs.getString("password");
			
			if(email.equals(dbemail) && password.equals(dbpassword))
			{
				session.setAttribute("login",dbemail); //session name is login and store fetchable database email address
				response.sendRedirect("officerdashboard.html"); //after login success redirect to welcome.jsp page
			}
		}
		else
		{
			request.setAttribute("errorMsg","invalid email or password"); //invalid error message for email or password wrong
		}
		
		con.close(); //close connection	
	}
	
}
catch(Exception e)
{
	out.println(e);
}
%>

<!DOCTYPE html>
<html>
 <head>
    <title>officer login</title>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width,initial-scale=1.0">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	 <style>
	 
html {
  box-sizing: border-box;
  font-size: 16px;
}

*, *:before, *:after {
  box-sizing: inherit;
}

body, h1, h2, h3, h4, h5, h6, p, ol, ul {
  margin: 0;
  padding: 0;
  font-weight: normal;
}

ol, ul {
  list-style: none;
}

img {
  max-width: 100%;
  height: auto;
}

body{
	background: url(https://i.postimg.cc/Hx1wwVZM/pexels-roman-koval-2903060.jpg);
	background-position: center;
	background-size: cover;
  	height: 100%;
}

div{
	max-width: 400px;
	min-height: 200px;
	margin: 0 auto 0 auto;
}

form{
    background: #ffffff;
    min-height: 200px;
    padding: 25px;
}

h1, h3{
    color: #ffffff;
    font-family: Georgia, serif;
}

h1{
    font-size: 40px;
    padding-top: 100px;
    font-weight: bold;  
}

h3{
	padding-bottom: 10px;
}
 
label{
    display: block;
    color: #888888;
    font-size: 14px;
}
	
input{
    border: 1px solid #ccc;
    width: 348px;
    padding: 10px;
    font-size: 15px;
    margin-bottom: 15px;
}
input[type=submit]{
    border: none;
    width: 350px; 
    background: #900C3F;
    color: #fff;
    font-size: 13px;
    font-weight: bold;
    padding-top: 15px;
    padding-bottom: 15px;
}
input[type=button]{
    border: none;
    width: 350px; 
    background: #e68a00;
    color: #fff;
    font-size: 13px;
    font-weight: bold;
    padding-top: 15px;
    padding-bottom: 15px;
}
	 
	 </style>
	
	<script>
		
		function validate()
		{
			var email = document.myform.txt_email;
			var password = document.myform.txt_password;
				
			if (email.value == null || email.value == "") //check email textbox not blank
			{
				window.alert("please enter email ?"); //alert message
				email.style.background = '#f08080';
				email.focus();
				return false;
			}
			if (password.value == null || password.value == "") //check password textbox not blank
			{
				window.alert("please enter password ?"); //alert message
				password.style.background = '#f08080'; 
				password.focus();
				return false;
			}
		}
			
	</script>
	
</head>
<body>
<div class="login-form"> 
   <h1 align="center">OFFICER LOGIN</h1><br>
   <p style="color:red">				   		
	<%
		if(request.getAttribute("errorMsg")!=null)
		{
			out.println(request.getAttribute("errorMsg")); //error message for email or password 
		}
	%>
	</p> </br>
    <form style="opacity: 0.8;">
        <br><label>Email:</label> 
		<input type="email" placeholder="email" name="email" required="required" class="form-control" id="email"><br><br>
        
        <label>Password:</label> 
		<input type="password" name="password" required="required" class="form-control" placeholder="password" id="pwd"><br><br>
                
        <br>
		<input type="submit" class="btn btn-primary btn-block btn-lg" name="login" value="Login">

		<br>
		<a href="index.html"><h5 align="center">Back to Home</h5></a>
   </form> 
  </div> 
</body>
</html>
