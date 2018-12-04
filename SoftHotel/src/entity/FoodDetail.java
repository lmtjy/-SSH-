package entity;

public class FoodDetail {
	private int count;
	private String fname;
	private int fprice;
	private String fimg;
	private int checked=1;
	private int type=1;
	private int productId;
	
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
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public int getFprice() {
		return fprice;
	}
	public void setFprice(int fprice) {
		this.fprice = fprice;
	}
	public String getFimg() {
		return fimg;
	}
	public void setFimg(String fimg) {
		this.fimg = fimg;
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
	
	public FoodDetail(int count, String fname, int fprice, String fimg,
			int checked, int type, int productId) {
		super();
		this.count = count;
		this.fname = fname;
		this.fprice = fprice;
		this.fimg = fimg;
		this.checked = checked;
		this.type = type;
		this.productId = productId;
	}
	public FoodDetail() {
		super();
	}
	@Override
	public String toString() {
		return "FoodDetail [count=" + count + ", fname=" + fname + ", fprice="
				+ fprice + ", fimg=" + fimg + ", checked=" + checked
				+ ", type=" + type + ", productId=" + productId + "]";
	}
	
}
