
import java.io.File;
import java.util.Properties;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.activation.*;
import javax.mail.internet.*;

public class Send_Mail_Attachment 
{   
	public static boolean sendPersonalizedMail(String recipient, String subject,String message)  
	{
		boolean debug = true;
		String from="chandanskanda2@gmail.com";
		try
		{
			
			Properties props = new Properties();
			props.put("mail.smtp.host",  "smtp.gmail.com");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			//props.put("mail.debug", "true");
			props.put("mail.smtp.port", "587");
			//props.put("mail.smtp.socketFactory.port", SMTP_PORT);
			//props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
			//props.put("mail.smtp.socketFactory.fallback", "false");
			

			Session session = Session.getInstance(props,null);

			MimeMessage msg = new MimeMessage(session);
			InternetAddress addressFrom = new InternetAddress(from);
			msg.setFrom(addressFrom);
		
			InternetAddress addressTo = new InternetAddress();

		
				addressTo = new InternetAddress(recipient);


			msg.addRecipient(Message.RecipientType.TO, addressTo);

			// Setting the Subject and Content Type
			
			msg.setSubject(subject);
			msg.setText(message);
		
			 Transport transport = session.getTransport("smtp");
			 transport.connect("smtp.gmail.com",from,"chandan123@");
			 transport.sendMessage(msg,msg.getAllRecipients());
		}
		catch(Exception e)
		{
			System.out.println(e);
			 debug = false;
		}		
		return debug;
	}
	
	

}
