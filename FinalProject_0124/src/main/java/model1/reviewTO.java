package model1;

public class reviewTO {
	private String rvseq;
	private String rcseq;
	private String rvwriter;
	private String rvwdate;
	private int star;
	private String rvcontent;
	private String rev;
	private String rvfilename;
	
	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	private String nickname;
	
	
	public String getRvseq() {
		return rvseq;
	}

	public void setRvseq(String rvseq) {
		this.rvseq = rvseq;
	}

	public String getRvfilename() {
		return rvfilename;
	}

	public void setRvfilename(String rvfilename) {
		this.rvfilename = rvfilename;
	}

	public String getRev() {
		return rev;
	}

	public void setRev(String rev) {
		this.rev = rev;
	}

	public String getRvwriter() {
		return rvwriter;
	}

	public void setRvwriter(String rvwriter) {
		this.rvwriter = rvwriter;
	}

	public String getRcseq() {
		return rcseq;
	}

	public void setRcseq(String rcseq) {
		this.rcseq = rcseq;
	}


	public String getRvwdate() {
		return rvwdate;
	}

	public void setRvwdate(String rvwdate) {
		this.rvwdate = rvwdate;
	}

	

	public int getStar() {
		return star;
	}

	public void setStar(int Star) {
		this.star = Star;
	}

	public String getRvcontent() {
		return rvcontent;
	}

	public void setRvcontent(String rvcontent) {
		this.rvcontent = rvcontent;
	}
}