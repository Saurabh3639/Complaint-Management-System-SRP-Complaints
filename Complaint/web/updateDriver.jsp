<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Driver</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
            
        * {
	margin: 0;
	padding: 0;
}
body {
	font-family: 'Poppins', sans-serif;
        background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url(https://i.postimg.cc/TYLPb0TP/pexels-gdtography-911738.jpg);
	height: 100vh;
	background-size: cover;
	background-position: center center;
	position: relative;
}

.wrapper {
	width: 1170px;
	margin: auto;
}
.nav-area {
	float: right;
	list-style: none;
	margin-top: 30px;
        padding: 20px 20px;
}
.nav-area li {
	display: inline-block;
}
.nav-area li a {
        margin-bottom: 30px;
	color: #fff;
	text-decoration: none;
	padding: 5px 20px;
	font-family: poppins;
	font-size: 20px !important;
	text-transform: uppercase;
}
.nav-area li a:hover {
	background: #fff;
	color: #333;
}
.ui {
    background-color: #8C7853;
    padding: 30px;
    margin-top: 50px;  
    opacity: 0.9;
}
.ui label{
    color: #fff;
}

.ui h1{
    color: #fff;
    font-family: cursive;
}

.inputfield
 {  
 position:relative;  
 top:30px;  
 width:900px;  
 line-height: 60px!important;  
 }
            
        </style>
</head>
<body>

<% 
String host="jdbc:mysql://localhost:3306/complaint";
Connection conn=null;
Connection conn1=null;
Statement stat=null;
Statement stat1=null;
ResultSet res=null;
ResultSet res1=null;
PreparedStatement stmt=null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn=DriverManager.getConnection(host,"root","");

%>

<form action="" method="post">
  <%
  stat=conn.createStatement();
  String number=request.getParameter("u");
  String data="select * from complaint where number='"+number+"'";
  res = stat.executeQuery(data);
  while(res.next()){
  %>
  
  
  <div class="container">
            
           <div class="row">
               
               <div class="col-log-3"></div>
  <div class="col-log-6">
                   <div class="ui">
                       <h1 class="text-center">UPDATE STATUS</h1><br>
  <form class="form-group text-center">
                           <div class="row">
                               <div class="col-lg-6">
                                   <label>Full Name :</label>
                                   <input type="text" class="form-control" name="fullname" value='<%=res.getString("fullname") %>'/>
                               </div>
                               <div class="col-lg-6">
                                   <label>Email :</label>
                                    <input type="text" class="form-control" name="email"  value='<%=res.getString("email") %>' />
                               </div>
                            </div>
                            <div class="row">
                               <div class="col-lg-6">
                                   <label>Number :</label>
                                    <input type="text" name="number" class="form-control" value='<%=res.getString("number") %>'/>
                               </div>
                               <div class="col-lg-6">
                                   <label>Complaint Type :</label>
                                    <input type="text"  size="50" name="complainttype" class="form-control" value='<%=res.getString("complainttype") %>'/>                               </div>
                            </div>
                            <div class="row">
                               <div class="col-lg-6">
                                   <label>Explanation :</label>
                                    <input type="text" class="form-control" name="explanation" value='<%=res.getString("explanation") %>'/> 
                               </div>
                               <div class="col-lg-6">
                                   <label>Filename :</label>
                                    <input type="text" class="form-control" name="filename" value='<%=res.getString("filename") %>'/>      
                               </div>
                            </div>
                            <div class="row">
                               <div class="col-lg-6">
                                   <label>Latitude :</label>
                                    <input type="text" class="form-control" name="latitude" value='<%=res.getString("latitude") %>'/> 
                               </div>
                               <div class="col-lg-6">
                                   <label>Longitude :</label>
                                    <input type="text" class="form-control" name="longitude" value='<%=res.getString("longitude") %>'/> 
                               </div>
                            </div>
                               <br>
                                   <label>Status :</label>
                                    <select class="form-control" name="status" value='<%=res.getString("status") %>'>
                                        <option value="<%=res.getString("status") %>"><%=res.getString("status") %></option>
                                        <option value="Pending">Pending</option>
						<option value="In Process">In Process</option>
						<option value="Completed">Completed</option>
						<option value="Rejected">Rejected</option>
                                    </select>
                                    <br>
                                    
                                   <label>Employee :</label>
                                <select class="form-control" name="employee">
                                                <option value="<%=res.getString("employee") %>"><%=res.getString("employee") %></option>
						<%
                                                try
                                                {
                                                    String data1="select * from employee";
                                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                    conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/complaint","root","");
                                                    stat1=conn1.createStatement();
                                                    res1 = stat1.executeQuery(data1);
                                                    while(res1.next())
                                                    {
                                                        %>
                                                        <option value="<%=res1.getString("fname")%>"><%=res1.getString("fname")%> --- <%=res1.getString("Department")%></option>
                                                        <%
                                                    }

                                                }
                                                catch(Exception ex)
                                                {
                                                    ex.printStackTrace();
                                                    out.println("Error "+ex.getMessage());
                                                }
                                                
                                                %>
                                </select>
                            <br>
                        <input type="submit" value="Update" class="btn btn-primary btn-block btn-lg">
                        
                        <br>
                        <div class="form-btn">
                            <a href="updatecmpt.jsp"><h4 align="center" style="color: white">Back to Complaints</h4></a>
                        </div>
                           
                       </form>
                    </div> 
               </div>
           </div>
        

  
  <%
    }
  %>
</form>
</body>
</html>

<%
String a=request.getParameter("fullname");
String b=request.getParameter("email");
String c=request.getParameter("number");
String d=request.getParameter("complainttype");                 
String e=request.getParameter("explanation");
String f=request.getParameter("filename");
String g=request.getParameter("latitude");
String h=request.getParameter("longitude");
String i=request.getParameter("status");
String j=request.getParameter("employee");

if(a!=null && b!=null && c!=null  && d!=null && e!=null && f!=null && g!=null && h!=null && i!=null && j!=null)
{
	String query="update complaint set fullname=?,email=?,number=?,complainttype=?,explanation=?,filename=?,latitude=?,longitude=?,status=?,employee=? where number='"+c+"'";
	stmt=conn.prepareStatement(query);
        stmt.setString(1,a);
	stmt.setString(2,b);
	stmt.setString(3,c);
	stmt.setString(4,d);
	stmt.setString(5,e);
	stmt.setString(6,f);
	stmt.setString(7,g);
        stmt.setString(8,h);
	stmt.setString(9,i);
	stmt.setString(10,j);

	
        int n= stmt.executeUpdate();
	if(n>0)
        {
                            
    String result;

    // Get recipient's email-ID, message & subject-line from index.html page

    final String to = request.getParameter("email");
    
    final String fullname = request.getParameter("fullname");
    final String num = request.getParameter("number");
    final String type = request.getParameter("complainttype");
    final String explain = request.getParameter("explanation");
    final String status = request.getParameter("status");
    final String emp = request.getParameter("employee");

    final String subject = "New Message From SRP Complaints";

    final String messg = "Hello "+fullname+",\n" +
"\n" +
"You got a new message from SRP Complaints :\n" +
"\n" +
"Your Complaint Status is just got updated. Details are as follows\n" +
"\n" +
"\n" +            
"Contact Number : " +num+
"\n" +
"Complaint Type : " +type+
"\n" +
"Explanation : " +explain+
"\n" +
"Complaint Status : " +status+
"\n" +
"Alloted Employee : " +emp+
"\n" +
"\n" +
"This is System Auto-generated Email, Please do not reply to this Email.\n" +
"\n" +
"\n" +
"Thank You !\n" +
"\n" +
"Best wishes,\n" +
"SRP Complaints team ";

 

    // Sender's email ID and password needs to be mentioned

    final String from = "srpcomplaint@gmail.com";

    final String pass = "srpcomplaint@123";
 

    // Creating Properties object

    Properties props = new Properties();

 

    // Defining properties

        props.put("mail.smtp.auth", "true");
        
        props.put("mail.smtp.starttls.enable", "true");
        
        props.put("mail.smtp.host", "smtp.gmail.com");
        
        props.put("mail.smtp.port", "587");

 

    // Authorized the Session object.

    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

        @Override

        protected PasswordAuthentication getPasswordAuthentication() {

            return new PasswordAuthentication(from, pass);

        }

    });

 

    try {

        // Create a default MimeMessage object.

        MimeMessage message = new MimeMessage(mailSession);

        // Set From: header field of the header.

        message.setFrom(new InternetAddress(from));

        // Set To: header field of the header.

        message.addRecipient(Message.RecipientType.TO,

                new InternetAddress(to));

        // Set Subject: header field

        message.setSubject(subject);

        // Now set the actual message

        message.setText(messg);

        // Send message

        Transport.send(message);

        result = "Your mail sent successfully....";

    } catch (MessagingException mex) {

        mex.printStackTrace();

        result = "Error: unable to send mail....";

    }
        }
        response.sendRedirect("updatecmpt.jsp");
}
%>