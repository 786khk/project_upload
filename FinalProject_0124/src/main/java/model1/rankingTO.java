package model1;

public class rankingTO {
   private String rfilename;   
   private String rcseq;
   private String nickname;
   private String subject;
   private String picture;
   private String wdate;
   private String hit;
   private String rev;   
   private String url;
   private int star;
   private int averstar;
      
   
   public String getrfilename() {
	return rfilename;
}
public void setrfilename(String rfilename) {
	this.rfilename = rfilename;
}
public int getAverstar() {
	return averstar;
}
public void setAverstar(int averstar) {
	this.averstar = averstar;
}
public int getStar() {
   return star;
}
public void setStar(int star) {
   this.star = star;
}
   public String getUrl() {
   return url;
}
public void setUrl(String url) {
   this.url = url;
}
   public String getPicture() {
   return picture;
}
public void setPicture(String picture) {
   this.picture = picture;
}
   
   public String getRcseq() {
      return rcseq;
   }
   public void setRcseq(String rcseq) {
      this.rcseq = rcseq;
   }
   
   public String getNickname() {
      return nickname;
   }
   public void setNickname(String nickname) {
      this.nickname = nickname;
   }
   public String getSubject() {
      return subject;
   }
   public void setSubject(String subject) {
      this.subject = subject;
   }
   public String getWdate() {
      return wdate;
   }
   public void setWdate(String wdate) {
      this.wdate = wdate;
   }
   public String getHit() {
      return hit;
   }
   public void setHit(String hit) {
      this.hit = hit;
   }
   public String getRev() {
      return rev;
   }
   public void setRev(String rev) {
      this.rev = rev;
   }
      
   
   
   
}