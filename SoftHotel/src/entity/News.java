package entity;

import java.util.List;

/*newIdint(11) NOT NULL
newTitlevarchar(200) NULL
detailsvarchar(300) NULL
relTimedate NULL
newImgvarchar(128) NULL
nTypevarchar(32) NULL*/
public class News {
	private int newId;          //锟斤拷锟斤拷锟斤拷锟斤拷
	private String newTitle;    //锟斤拷锟脚憋拷锟斤拷
	private String details;     //锟斤拷锟斤拷锟斤拷锟斤拷
	private String relTime;     //锟斤拷锟斤拷时锟斤拷
	private String newImg;      //锟斤拷锟斤拷图片
	private String newType;       //锟斤拷锟斤拷锟斤拷锟斤拷
	private Minute mid;
	private String chose;
	private int page=1;
	private int size=5;
	private int pagecount=0;
	public Minute getMid() {
		return mid;
	}
	public void setMid(Minute mid) {
		this.mid = mid;
	}
	public String getChose() {
		return chose;
	}
	public void setChose(String chose) {
		this.chose = chose;
	}
	public int getPagecount() {
		return pagecount;
	}
	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getNewId() {
		return newId;
	}
	public void setNewId(int newId) {
		this.newId = newId;
	}
	public String getNewTitle() {
		return newTitle;
	}
	public void setNewTitle(String newTitle) {
		this.newTitle = newTitle;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getRelTime() {
		return relTime;
	}
	public void setRelTime(String relTime) {
		this.relTime = relTime;
	}
	public String getNewImg() {
		return newImg;
	}
	public void setNewImg(String newImg) {
		this.newImg = newImg;
	}
	public String getNewType() {
		return newType;
	}
	public void setNewType(String newType) {
		this.newType = newType;
	}
	public News() {
		super();
	}
	public News(int newId, String newTitle, String details, String relTime,
			String newImg, String newType, Minute mid) {
		super();
		this.newId = newId;
		this.newTitle = newTitle;
		this.details = details;
		this.relTime = relTime;
		this.newImg = newImg;
		this.newType = newType;
		this.mid = mid;
	}
	@Override
	public String toString() {
		return "News [newId=" + newId + ", newTitle=" + newTitle + ", details="
				+ details + ", relTime=" + relTime + ", newImg=" + newImg
				+ ", newType=" + newType + ", mid=" + mid
				+ ", chose=" + chose + ", page=" + page + ", size=" + size
				+ ", pagecount=" + pagecount + "]";
	}
	public News(String newType) {
		super();
		this.newType = newType;
	}
}
