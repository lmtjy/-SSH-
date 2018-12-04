package entity;

public class Recruit {
	private int new_rid;
	private String rname;
	private String rnumber;
	private String smoney;
	private String omoney;
	private String requiren;
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public int getNew_rid() {
		return new_rid;
	}
	public void setNew_rid(int new_rid) {
		this.new_rid = new_rid;
	}
	public String getRnumber() {
		return rnumber;
	}
	public void setRnumber(String rnumber) {
		this.rnumber = rnumber;
	}
	public String getSmoney() {
		return smoney;
	}
	public void setSmoney(String smoney) {
		this.smoney = smoney;
	}
	public String getOmoney() {
		return omoney;
	}
	public void setOmoney(String omoney) {
		this.omoney = omoney;
	}
	public String getRequiren() {
		return requiren;
	}
	public void setRequiren(String requiren) {
		this.requiren = requiren;
	}
	public Recruit() {
		super();
	}
	public Recruit(int new_rid, String rname, String rnumber, String smoney,
			String omoney, String requiren) {
		super();
		this.new_rid = new_rid;
		this.rname = rname;
		this.rnumber = rnumber;
		this.smoney = smoney;
		this.omoney = omoney;
		this.requiren = requiren;
	}
	@Override
	public String toString() {
		return "Recruit [new_rid=" + new_rid + ", rname=" + rname
				+ ", rnumber=" + rnumber + ", smoney=" + smoney + ", omoney="
				+ omoney + ", requiren=" + requiren + "]";
	}
}
