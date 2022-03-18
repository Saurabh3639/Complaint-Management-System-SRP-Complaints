<%-- 
    Document   : contactus
    Created on : Mar 22, 2021, 4:04:07 PM
    Author     : 91983
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*,java.util.*" %>
<% 
    String fname=request.getParameter("fullname");
    String mail=request.getParameter("email");
    String num=request.getParameter("number");
    String msg=request.getParameter("message");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/complaint","root","");
    Statement st=con.createStatement();
    int i=st.executeUpdate("insert into contactus values ('"+fname+"','"+mail+"','"+num+"','"+msg+"')");
    response.sendRedirect("contactus.html");
%>