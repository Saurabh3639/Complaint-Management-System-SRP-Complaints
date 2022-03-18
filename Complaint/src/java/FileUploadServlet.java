import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FileUploadServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)

public class FileUploadServlet extends HttpServlet { 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

    String fullname=request.getParameter("fullname");
    String address=request.getParameter("address");
    String number=request.getParameter("number");
    String email=request.getParameter("email");
    String complainttype=request.getParameter("complainttype");
    String explanation=request.getParameter("explanation");
 
        

        Part part = request.getPart("file");
        String fileName = extractFileName(part); //file name
        //String savePath = "C:\\Users\\91983\\Documents\\NetBeansProjects\\Complaint\\web\\images" + File.separator + fileName;
        String savePath = "C:\\Users\\HP\\OneDrive\\Documents\\NetBeansProjects\\Complaint\\web\\images" + File.separator + fileName;
        File fileSaveDir  = new File(savePath);
      
        part.write(savePath + File.separator);
        String latitude=request.getParameter("latitude");
        String longitude=request.getParameter("longitude");
        String status=request.getParameter("status");
        String employee=request.getParameter("employee");
        // int cmptid=Integer.parseInt(request.getParameter("cmptid"));      

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/complaint", "root", "");
            PreparedStatement pst = con.prepareStatement("insert into complaint(fullname,address,number,email,complainttype,explanation,fileName,latitude,longitude,status,employee) values(?,?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1, fullname);
            pst.setString(2, address);
            pst.setString(3, number);
            pst.setString(4, email);
            pst.setString(5, complainttype);
            pst.setString(6, explanation);
            pst.setString(7, fileName);
            pst.setString(8, latitude);
            pst.setString(9, longitude);
            pst.setString(10, status);
            pst.setString(11, employee); 
            
           int n= pst.executeUpdate();
           if(n>0){ 
               
    String result;

    // Get recipient's email-ID, message & subject-line from index.html page

    final String to = request.getParameter("email");
    
    final String fname = request.getParameter("fullname");

    final String subject = "New Message From SRP Complaints";

    final String messg = "Hello "+fname+",\n" +
"\n" +
"You got a new message from SRP Complaints :\n" +
"\n" +
"This email is just to let you know that your Complaint is successfully registered into our system.\n" +
"\n" +
"we will do our background check regarding your complaint and then will update the status \n" +
"\n" +
"\n" +
"\n" +
"==> To Check Your complaint status \n" +
"\n" +
"Step 1:\n" +
"\n" +
"On Dashboard Go to \"Get my Complaint ID\" section and generate your Complaint ID using your Mobile Number\n" +
"\n" +
"step 2:\n" +
"\n" +
"Now Go to \"Check Status\" to check your complaint status using Complaint ID\n" +
"\n" +
"\n" +
"\n" +
"Thank You ! 😃\n" +
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
        }
        catch (Exception e) {
            System.out.println("exception is "+e);
        }

    }
    // file name of the upload file is included in content-disposition header like this:
    //form-data; name="dataFile"; filename="PHOTO.JPG"

    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}