<%@ page import="java.sql.*" %>  

<%
if(session.getAttribute("login")!=null) //check login session user not access or back to index.jsp page
{
	response.sendRedirect("welcome.jsp");
}
%>

<%
try
{
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/complaint","root",""); //create connection
	
	if(request.getParameter("btn_login")!=null) //check login button click event not null
	{
		String dbemail;
		
		String email;
		
		email=request.getParameter("txt_email"); //txt_email
		
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("select * from login where email=?"); //sql select query 
		pstmt.setString(1,email);
		
		ResultSet rs=pstmt.executeQuery(); //execute query and store in resultset object rs.
		
		if(rs.next())
		{
			dbemail=rs.getString("email");
			
			if(email.equals(dbemail))
			{
				session.setAttribute("login",dbemail); //session name is login and store fetchable database email address
                                response.sendRedirect("dashboard.html"); //after login success redirect to welcome.jsp page
                                
			}
		}
		else
		{
			request.setAttribute("errorMsg","invalid email"); //invalid error message for email or password wrong
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

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Login</title>

	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">
	
</head>

<body>
<br>
    <!-- <ul>
        <li><a href="home.html">Back to Home</a></li>
    </ul> -->

    <div class="main-content" style="opacity: 0.7; margin-top: 9rem;">

        <form class="form-register" action="UserVerify" method="post" name="myform" >

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row" >
                        <h1>Login</h1>
                    </div>
					
					<p style="color:red">				   		
                                        <%
					if(request.getAttribute("errorMsg")!=null)
					{
						out.println(request.getAttribute("errorMsg")); //error message for email or password 
					}
					%>
					</p>
				   
				   </br>
                   
                    <div class="form-row">
                        <label>
                            <span>Email</span>
                            <input type="text" name="txt_email" id="txt_email" placeholder="Enter your email">
                        </label>
                    </div>

                  <input type="submit" style="background-color: #FF6347; color: white; border-radius: 10px;" name="btn_login" value="Get OTP"><br><br><br>
                    
                  <a href="register.jsp" style="color: black;" class="form-log-in-with-existing">You Don't have an account? <b style="color: #FF6347;"> Register here </b></a>

                </div>


            </div>

        </form>

    </div>

</body>

</html>
