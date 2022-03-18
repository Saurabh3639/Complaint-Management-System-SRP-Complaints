<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Welcome<%=session.getAttribute("login")%></title>

	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">

</head>

<body>

    <!-- <ul>
        <li><a href="home.html">Back to Home</a></li>
    </ul> -->
<br>
    <div class="main-content">
<left>	
	<%
	if(session.getAttribute("login")==null || session.getAttribute("login")==" ") //check condition unauthorize user not direct access welcome.jsp page
	{
		response.sendRedirect("index.html"); 
	}
	%>
	<h1> Welcome, <%=session.getAttribute("login")%> </h1>
	<h2><a href="logout.jsp">Logout</a></h2>
	
	 <ul>
        <li><a href="logout.jsp">Logout</a></li>
    </ul> 
   
	</left>
    </div>

</body>

</html>
