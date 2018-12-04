package entity;

public class Minute {
	private int mid;
	private String mtitle;
	private String mdetails;
	private String stime;
	private String otime;
	private News newId;
	public News getNewId() {
		return newId;
	}
	public void setNewId(News newId) {
		this.newId = newId;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getMtitle() {
		return mtitle;
	}
	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}
	public String getMdetails() {
		return mdetails;
	}
	public void setMdetails(String mdetails) {
		this.mdetails = mdetails;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getOtime() {
		return otime;
	}
	public void setOtime(String otime) {
		this.otime = otime;
	}
	public Minute() {
		super();
	}
	public Minute(int mid, String mtitle, String mdetails, String stime,
			String otime, News newId) {
		super();
		this.mid = mid;
		this.mtitle = mtitle;
		this.mdetails = mdetails;
		this.stime = stime;
		this.otime = otime;
		this.newId = newId;
	}
	
	
}
