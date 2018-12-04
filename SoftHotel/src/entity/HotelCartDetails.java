package entity;
/*didint(11) NOT NULL
cidint(11) NULL
productIdint(11) NULL
countint(11) NULL
typeint(11) NULL
stateint(11) NULL*/
public class HotelCartDetails {
	private int did;
	private HotelCart cid;
	private int productId;
	private int count;
	private int type;
	private int state;
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public HotelCart getCid() {
		return cid;
	}
	public void setCid(HotelCart cid) {
		this.cid = cid;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public HotelCartDetails(int did, HotelCart cid, int productId, int count,
			int type, int state) {
		super();
		this.did = did;
		this.cid = cid;
		this.productId = productId;
		this.count = count;
		this.type = type;
		this.state = state;
	}
	public HotelCartDetails() {
		super();
	}
	@Override
	public String toString() {
		return "HotelCartDetails [did=" + did + ", cid=" + cid + ", productId="
				+ productId + ", count=" + count + ", type=" + type
				+ ", state=" + state + "]";
	}
	
}
