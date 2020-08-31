package member;

public class MemberVo {
	private String id;
	private String pw;
	private String job;
	private String gender;
	private String mailyn;
	private String reason;
	
	public MemberVo() {}
	
	public MemberVo(String id, String pw, String job, String gender, String mailyn, String reason) {
		super();
		this.id = id;
		this.pw = pw;
		this.job = job;
		this.gender = gender;
		this.mailyn = mailyn;
		this.reason = reason;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMailyn() {
		return mailyn;
	}
	public void setMailyn(String mailyn) {
		this.mailyn = mailyn;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	@Override
	public String toString() {
		return "MemberVo [id=" + id + ", pw=" + pw + ", job=" + job + ", gender=" + gender + ", mailyn=" + mailyn
				+ ", reason=" + reason + "]";
	}
	
}
