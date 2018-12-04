package entity;

public class HotelCart {
	private int cid;
	private User uid;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public User getUid() {
		return uid;
	}
	public void setUid(User uid) {
		this.uid = uid;
	}
	@Override
	public String toString() {
		return "HotelCart [cid=" + cid + ", uid=" + uid + "]";
	}
	
}
