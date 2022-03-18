package newpackage;

import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
    //generate vrification code
    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    //send email to the user email
    public boolean sendEmail(User user) {
        boolean test = false;

        String toEmail = user.getEmail();
        String fromEmail = "srpcomplaint@gmail.com";
        String password = "srpcomplaint@123";

        try {

            // your host email smtp server details
            Properties pr = new Properties();
             pr.put("mail.smtp.auth", "true");
        
        pr.put("mail.smtp.starttls.enable", "true");
        
        pr.put("mail.smtp.host", "smtp.gmail.com");
        
        pr.put("mail.smtp.port", "587");
 
            //get session to authenticate the host email address and password
            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            //set email message details
            Message mess = new MimeMessage(session);

    		//set from email address
            mess.setFrom(new InternetAddress(fromEmail));
    		//set to email address or destination email address
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
    		
    		//set email subject
            mess.setSubject("User Email Verification");
            
    		//set message text
            mess.setText("Hello,\n" +
"\n" +
"Welcome To SRP COMPLAINTS\n" +
"\n" +
"This is System Generated Email Just to verify Your Account\n" +
"\n" +
"Please DO NOT REPLY to this mail.\n" +
"\n" +
"Verify your account using this code : " + user.getCode() +
"\n" +
"\n" +
"Thank You for Connecting\n" +
"\n" +
"Best wishes,\n" +
"\n" +
"SRP Complaints team.");
                //send the message
            Transport.send(mess);
            
            test=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }
}