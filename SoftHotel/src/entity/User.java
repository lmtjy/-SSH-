package entity;
/*uidint(11) NOT NULL
unamevarchar(32) NOT NULL
upwdvarchar(32) NOT NULL
uphonevarchar(11) NOT NULL
emailvarchar(32) NOT NULL*/
public class User {
	private int uid;          //主键
	private String uname;     //姓名
	private String upwd;      //密码
	private String uphone;    //电话号码
	private String email;     //邮箱
	private String verifyCode;//手机验证码
	
	public String getVerifyCode() {
		return verifyCode;
	}
	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getUphone() {
		return uphone;
	}
	public void setUphone(String uphone) {
		this.uphone = uphone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public User(int uid, String uname, String upwd, String uphone, String email) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.upwd = upwd;
		this.uphone = uphone;
		this.email = email;
	}
	public User() {
		super();
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", uname=" + uname + ", upwd=" + upwd
				+ ", uphone=" + uphone + ", email=" + email + ", verifyCode="
				+ verifyCode + "]";
	}
	public User(String uname, String upwd, String uphone, String email) {
		super();
		this.uname = uname;
		this.upwd = upwd;
		this.uphone = uphone;
		this.email = email;
	}
	
	
	
}
