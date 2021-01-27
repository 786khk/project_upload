package model1;

public class memberTO {
	private String id;	private String password;
	private String nickname;
	private String email;
	private String gender;
	private String phone;
	private String introduce;
	private String picture;
	private int allview;	
	private String scrapseq;
	
	public String getPhone() {return phone;}
	public void setPhone(String phone) {this.phone = phone;}
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}
	public String getGender() {return gender;}
	public void setGender(String gender) {this.gender = gender;}
	public String getId() {return id;}
	public void setId(String id) {this.id = id;}
	public String getNickname() {return nickname;}
	public void setNickname(String nickname) {this.nickname = nickname;}
	public String getIntroduce() {return introduce;}
	public void setIntroduce(String introduce) {this.introduce = introduce;}
	public String getPicture() {return picture;}
	public void setPicture(String picture) {this.picture = picture;}
	public int getAllview() {return allview;}
	public void setAllview(int allview) {this.allview = allview;}
	public String getPassword() {return password;}
	public void setPassword(String password) {this.password = password;}
	public String getScrapseq() {return scrapseq;}
	public void setScrapseq(String scrapseq) {this.scrapseq = scrapseq;}
}
