package entity;

public class RoomDetail {
	private String rpic;
	private String houseType;
	private int proPrice;
	private int count;
	private int checked=1;
	private int type=2;
	private int productId;
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getRpic() {
		return rpic;
	}
	public void setRpic(String rpic) {
		this.rpic = rpic;
	}
	public String getHouseType() {
		return houseType;
	}
	public void setHouseType(String houseType) {
		this.houseType = houseType;
	}
	public int getProPrice() {
		return proPrice;
	}
	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	public int getChecked() {
		return checked;
	}
	public void setChecked(int checked) {
		this.checked = checked;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public RoomDetail() {
		super();
	}
	
	public RoomDetail(String rpic, String houseType, int proPrice, int count,
			int checked, int type, int productId) {
		super();
		this.rpic = rpic;
		this.houseType = houseType;
		this.proPrice = proPrice;
		this.count = count;
		this.checked = checked;
		this.type = type;
		this.productId = productId;
	}
	@Override
	public String toString() {
		return "RoomDetail [rpic=" + rpic + ", houseType=" + houseType
				+ ", proPrice=" + proPrice + ", count=" + count + ", checked="
				+ checked + ", type=" + type + ", productId=" + productId + "]";
	}
	
}
