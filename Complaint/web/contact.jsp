<%-- 
    Document   : contact
    Created on : Mar 22, 2021, 9:51:04 PM
    Author     : 91983
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*,java.util.*" %>
<% 
    String fn=request.getParameter("firstname");
    String ln=request.getParameter("lastname");
    String mn=request.getParameter("mobilenumber");
    String sub=request.getParameter("subject");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/complaint","root","");
    Statement st=con.createStatement();
    int i=st.executeUpdate("insert into contact values ('"+fn+"','"+ln+"','"+mn+"','"+sub+"')");
    
%>