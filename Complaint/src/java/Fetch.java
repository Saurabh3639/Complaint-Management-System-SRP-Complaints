import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*; 
import java.sql.*; 
import javax.servlet.jsp.PageContext;

@WebServlet("/Fetch")
public class Fetch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fetch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter(); 
 
		String ID = request.getParameter("id"); 
		//int id = Integer.parseInt(ID); 
         
		try { 
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/complaint","root",""); 
			PreparedStatement ps = con.prepareStatement("select * from complaint where employee=?"); 
			ps.setString(1, ID); 
 
			ResultSet rs = ps.executeQuery(); 
 
			  while (rs.next()) { 
		        out.println("<html>" +
                         "<head>" +
                         "</head>" +
                         "<body>" +
			 "<table>" +
				"<thead>" +
                                                "<th style="+"color: #bb99ff;" +">Comp id&nbsp;&nbsp;&nbsp;</th>" +
						"<th>Full Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>" +
						"<th>Address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>" +
						"<th>number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>" +
						"<th>email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>" +
						"<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Department&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>" +
                                                "<th>explaintion&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>" +
                                                "<th>filename&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>" +
                                                "<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;latitude&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>" +
                                                "<th>longitude&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>" +
                                                "<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>" +
                                        "</thead>" +
                                      "<tbody>" +
					"<tr>" +
						"<td>" + rs.getInt(1) + "</td>" +
						"<td>" + rs.getString(2) + "</td>" +
						"<td>" + rs.getString(3) + "</td>" +
						"<td>" + rs.getString(4) + "</td>" +
						"<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + rs.getString(5) + "</td>" +
						"<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + rs.getString(6) + "</td>" +
                                                "<td>" + rs.getString(7) + "</td>" +
                                                "<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + rs.getString(8) + "</td>" +
                                                "<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + rs.getString(9) + "</td>" +
                                                "<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + rs.getString(10) + "</td>" +
                                                "<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + rs.getString(11) + "</td>" +
					"</tr>" +
				"</tbody>" +
                                      "</table>" +
                                             "</body>" +
                                              "</html>" 
//                                      "Complaint id: " + rs.getInt(1) + "</br>"
//                              + " full Name: " + rs.getString(2) + "</br> "
//                              + "Address: " + rs.getString(3) + "</br>"
//                              + " number: " + rs.getString(4) + "</br>"
//                              + " email: " + rs.getString(5) + "</br>"
//                              + " Department: " + rs.getString(6) + "</br>"
//                              + " explaintion: " + rs.getString(7) + "</br>"
//                              + " filename: " + rs.getString(8) + "</br>"
//                              + " latitude: " + rs.getString(9) + "</br>"
//                              + " longitude: " + rs.getString(10) + "</br>"
//                              + " status: " + rs.getString(11) + "</br>"
//		              + "</br>" + "</html>"
                                                        );
                         
                                
			} 
			
		} catch (Exception e) { 
			e.printStackTrace(); 
		} finally { 
			out.close(); 
		} 
	 
	} 
	//response.sendRedirect("");

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
