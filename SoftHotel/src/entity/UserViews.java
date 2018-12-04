package entity;

/*vIdint(11) NOT NULL
 uIdint(11) NULL
 vdetailvarchar(600) NULL
 replyvarchar(600) NULL
 gradefloat NULL
 postTimedate NULL*/
public class UserViews {
	private int vId; // 主键
	private User uId; // 用户id（外键）
	private String vdetail; // 评价信息
	private String reply; // 回复
	private float grade; // 评价星级
	private String postTime; // 提交时间
	public int getvId() {
		return vId;
	}
	public void setvId(int vId) {
		this.vId = vId;
	}
	public User getuId() {
		return uId;
	}
	public void setuId(User uId) {
		this.uId = uId;
	}
	public String getVdetail() {
		return vdetail;
	}
	public void setVdetail(String vdetail) {
		this.vdetail = vdetail;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public float getGrade() {
		return grade;
	}
	public void setGrade(float grade) {
		this.grade = grade;
	}
	public String getPostTime() {
		return postTime;
	}
	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}
	public UserViews(int vId, User uId, String vdetail, String reply,
			float grade, String postTime) {
		super();
		this.vId = vId;
		this.uId = uId;
		this.vdetail = vdetail;
		this.reply = reply;
		this.grade = grade;
		this.postTime = postTime;
	}
	public UserViews() {
		super();
	}
	@Override
	public String toString() {
		return "UserViews [vId=" + vId + ", uId=" + uId + ", vdetail="
				+ vdetail + ", reply=" + reply + ", grade=" + grade
				+ ", postTime=" + postTime + "]";
	}
	
}
