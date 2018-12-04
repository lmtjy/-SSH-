package entity;

/*ridint(11) NOT NULL
 roomNumint(11) NULL
 proPriceint(11) NULL
 RegPriceint(11) NULL
 houseTypevarchar(11) NULL
 bedTypeint(11) NULL
 rPicvarchar(128) NULL
 lpicvarchar(128) NOT NULL
 matingint(11) NULL
 bookNumint(11) NULL
 cancelint(8) NOT NULL*/
public class Rooms {
	private int rid; // ����
	private int roomNum; // �����
	private int proPrice; // ����۸񣨻�Ա�ۣ�
	private int regPrice; // ����۸���ͨ�ۣ�
	private String houseType; // ��������
	private int bedType; // ����
	private String rpic; // �����б�ͼƬ��С��
	private String lpic; // ����ͼƬ����
	private int mating; // �Ƿ�ƥ��
	private int bookNum; // ������
	private int cancel; // �Ƿ����
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public int getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
	public int getProPrice() {
		return proPrice;
	}
	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}
	
	public String getHouseType() {
		return houseType;
	}
	public void setHouseType(String houseType) {
		this.houseType = houseType;
	}
	public int getBedType() {
		return bedType;
	}
	public void setBedType(int bedType) {
		this.bedType = bedType;
	}
	public String getRpic() {
		return rpic;
	}
	public void setRpic(String rpic) {
		this.rpic = rpic;
	}
	public String getLpic() {
		return lpic;
	}
	public void setLpic(String lpic) {
		this.lpic = lpic;
	}
	public int getMating() {
		return mating;
	}
	public void setMating(int mating) {
		this.mating = mating;
	}
	public int getBookNum() {
		return bookNum;
	}
	public void setBookNum(int bookNum) {
		this.bookNum = bookNum;
	}
	public int getCancel() {
		return cancel;
	}
	public void setCancel(int cancel) {
		this.cancel = cancel;
	}
	
	public int getRegPrice() {
		return regPrice;
	}
	public void setRegPrice(int regPrice) {
		this.regPrice = regPrice;
	}
	public Rooms() {
		super();
	}
	public Rooms(int rid, int roomNum, int proPrice, int regPrice,
			String houseType, int bedType, String rpic, String lpic,
			int mating, int bookNum, int cancel) {
		super();
		this.rid = rid;
		this.roomNum = roomNum;
		this.proPrice = proPrice;
		this.regPrice = regPrice;
		this.houseType = houseType;
		this.bedType = bedType;
		this.rpic = rpic;
		this.lpic = lpic;
		this.mating = mating;
		this.bookNum = bookNum;
		this.cancel = cancel;
	}
	@Override
	public String toString() {
		return "Rooms [rid=" + rid + ", roomNum=" + roomNum + ", proPrice="
				+ proPrice + ", regPrice=" + regPrice + ", houseType="
				+ houseType + ", bedType=" + bedType + ", rpic=" + rpic
				+ ", lpic=" + lpic + ", mating=" + mating + ", bookNum="
				+ bookNum + ", cancel=" + cancel + "]";
	}
	
}
