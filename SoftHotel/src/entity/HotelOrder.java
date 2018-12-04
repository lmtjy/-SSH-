package entity;
/*oidint(11) NOT NULL
orderNamevarchar(20) NULL
phonevarchar(30) NULL
ltimedatetime NULL
massagevarchar(100) NULL
paymentint(11) NULL
orderTimevarchar(100) NULL
priceint(11) NULL
statusint(11) NULL
uidint(11) NULL
orderNumbigint(20) NULL*/
public class HotelOrder {
	private int oid;
	private String orderName;
	private String phone;
	private String ltime;
	private String massage;
	private Integer payment;
	private String orderTime;
	private int price;
	private int status;
	private User uid;
	private Long orderNum;
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getLtime() {
		return ltime;
	}
	public void setLtime(String ltime) {
		this.ltime = ltime;
	}
	public String getMassage() {
		return massage;
	}
	public void setMassage(String massage) {
		this.massage = massage;
	}
	public String getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public User getUid() {
		return uid;
	}
	public void setUid(User uid) {
		this.uid = uid;
	}
	public Long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}
	
	public Integer getPayment() {
		return payment;
	}
	public void setPayment(Integer payment) {
		this.payment = payment;
	}
	public HotelOrder(int oid, String orderName, String phone, String ltime,
			String massage, int payment, String orderTime, int price,
			int status, User uid, Long orderNum) {
		super();
		this.oid = oid;
		this.orderName = orderName;
		this.phone = phone;
		this.ltime = ltime;
		this.massage = massage;
		this.payment = payment;
		this.orderTime = orderTime;
		this.price = price;
		this.status = status;
		this.uid = uid;
		this.orderNum = orderNum;
	}
	public HotelOrder() {
		super();
	}
	@Override
	public String toString() {
		return "HotelOrder [oid=" + oid + ", orderName=" + orderName
				+ ", phone=" + phone + ", ltime=" + ltime + ", massage="
				+ massage + ", payment=" + payment + ", orderTime=" + orderTime
				+ ", price=" + price + ", status=" + status + ", uid=" + uid
				+ ", orderNum=" + orderNum + "]";
	}
	
	
}
