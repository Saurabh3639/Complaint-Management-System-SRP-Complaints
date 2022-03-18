<%-- 
    Document   : feedback
    Created on : Mar 1, 2021, 9:31:04 PM
    Author     : 91983
--%>

<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.MessagingException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*,java.util.*" %>
<% 
    String ex=request.getParameter("experience");
    String fn=request.getParameter("first name");
    String ln=request.getParameter("last name");
    String num=request.getParameter("number");
    String mail=request.getParameter("email");
    String cmt=request.getParameter("comments");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/complaint","root","");
    Statement st=con.createStatement();
    int i=st.executeUpdate("insert into feedback values ('"+ex+"','"+fn+"','"+ln+"','"+num+"','"+mail+"','"+cmt+"')");
    if (i>0)
    {
                     
    String result;

    // Get recipient's email-ID, message & subject-line from index.html page

    final String to = request.getParameter("email");
    
    final String fname = request.getParameter("first name");

    final String subject = "New Message From SRP Complaints";

    final String messg = "Hello "+fname+",\n" +
"\n" +
"You got a new message from SRP Complaints :\n" +
"\n" +
"Your Feedback was submitted successfully, Your feedback is valuable to us.\n" +
"\n" +
"Thank You for Connecting.\n" +
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
        
    response.sendRedirect("dashboard.html");
    }
%>
