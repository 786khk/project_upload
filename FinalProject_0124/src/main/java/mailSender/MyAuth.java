package mailSender;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuth extends Authenticator {
	private String userName;
	private String userPassword;
	
	public MyAuth(String userName, String userPassword) {
		super();
		this.userName = userName;
		this.userPassword = userPassword;
	}
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		// TODO Auto-generated method stub
		return new PasswordAuthentication(userName, userPassword);
	}
}
