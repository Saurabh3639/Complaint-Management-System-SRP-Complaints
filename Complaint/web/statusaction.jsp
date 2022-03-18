<%@page import="java.sql.*"%>
<%
try{
	String did=request.getParameter("uid");
	String vol=request.getParameter("status");
	String or=request.getParameter("or");
	System.out.println(did);

	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/fwms","root","");
	PreparedStatement ps=con.prepareStatement("update donation set status=? where donation_id=?");
	ps.setString(1,vol);
	
	ps.setString(2,did);
	int n=ps.executeUpdate();
	
	if(n>0){
		System.out.println("Update");
		response.sendRedirect("vol_action.jsp");
	}
	
	
	//
//	

	
	
	
}
catch(Exception e){
	
}




%>