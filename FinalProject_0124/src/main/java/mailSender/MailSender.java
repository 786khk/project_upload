package mailSender;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSender {
	
	private String fromEmail;
	private String fromPassword;
	
	public MailSender() {
		this.fromEmail = "maenkaengee@gmail.com";
		this.fromPassword = "dndgthr9";
	}
	
	public void sendMail(String toEmail, String toName, String subject, String content) {
		
		try {
			
			Properties props = new Properties();
			
			props.put("mail.smtp.starttls.enable", true);
			props.put("mail.transfer.protocol", "smtp");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			
			//인증
			MyAuth auth = new MyAuth(fromEmail, fromPassword);
			Session session = Session.getDefaultInstance(props, auth);
			
			//메세지
			MimeMessage msg = new MimeMessage(session);
			//msg.setHeader("Content-type", "text/plain; charset=utf-8");
			msg.setHeader("Content-type", "text/html; charset=utf-8");
			
			//보낼사람
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail, toName, "utf-8"));
			
			//보낼제목
			msg.setSubject(subject);
			
			//보낼내용
			//msg.setContent(content, "text/plain; charset=utf-8");
			msg.setContent(content, "text/html; charset=utf-8");
			
			//보낼시간
			msg.setSentDate(new java.util.Date());
			
			//보내기
			Transport.send(msg);
			
			
		}catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
