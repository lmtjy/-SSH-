package entity;
/*didint(11) NOT NULL
oidint(11) NULL
typeint(11) NULL
countint(11) NULL
productIdint(11) NULL*/
public class HotelOrderDetail {
	private int did;
	private HotelOrder oid;
	private int type;
	private int count;
	private int productId;
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public HotelOrder getOid() {
		return oid;
	}
	public void setOid(HotelOrder oid) {
		this.oid = oid;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public HotelOrderDetail(int did, HotelOrder oid, int type, int count,
			int productId) {
		super();
		this.did = did;
		this.oid = oid;
		this.type = type;
		this.count = count;
		this.productId = productId;
	}
	public HotelOrderDetail() {
		super();
	}
	@Override
	public String toString() {
		return "HotelOrderDetail [did=" + did + ", oid=" + oid + ", type="
				+ type + ", count=" + count + ", productId=" + productId + "]";
	}
	
}
