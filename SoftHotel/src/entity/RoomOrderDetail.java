package entity;
/*oidint(11) NOT NULL
stimedate NULL
ltimedate NULL
numint(10) NULL
ridint(30) NULL
tnamevarchar(30) NULL
mobilevarchar(11) NULL
payint(11) NULL
tpriceint(11) NOT NULL
orderNumint(200) NOT NULL
ordertimebigint(20) NOT NULL*/
public class RoomOrderDetail {
	private int oid;            //����
	private String stime;       //��ʼʱ��
	private String ltime;       //����ʱ��
	private int num;            //����
	private Rooms rid;            //����ţ������
	private String tname;       //�ͻ�����(session�л�ȡ)
	private String mobile;      //�ͻ�����
	private int pay;            //֧����ʽ
	private int tprice;         //֧�����
	private Long orderNum;       //�������
	private String orderTime;     //����ʱ��
	private String remark;      //��ע��Ϣ
	
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getLtime() {
		return ltime;
	}
	public void setLtime(String ltime) {
		this.ltime = ltime;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public Rooms getRid() {
		return rid;
	}
	public void setRid(Rooms rid) {
		this.rid = rid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public int getTprice() {
		return tprice;
	}
	public void setTprice(int tprice) {
		this.tprice = tprice;
	}
	
	
	public String getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	public RoomOrderDetail() {
		super();
	}
	
	public Long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}
	
	public RoomOrderDetail(int oid, String stime, String ltime, int num,
			Rooms rid, String tname, String mobile, int pay, int tprice,
			Long orderNum, String orderTime, String remark) {
		super();
		this.oid = oid;
		this.stime = stime;
		this.ltime = ltime;
		this.num = num;
		this.rid = rid;
		this.tname = tname;
		this.mobile = mobile;
		this.pay = pay;
		this.tprice = tprice;
		this.orderNum = orderNum;
		this.orderTime = orderTime;
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "RoomOrderDetail [oid=" + oid + ", stime=" + stime + ", ltime="
				+ ltime + ", num=" + num + ", rid=" + rid + ", tname=" + tname
				+ ", mobile=" + mobile + ", pay=" + pay + ", tprice=" + tprice
				+ ", orderNum=" + orderNum + ", orderTime=" + orderTime
				+ ", remark=" + remark + "]";
	}
	
	
	
}
