package entity;
/*fidint(11) NOT NULL
fname varchar(100) NULL
fintr varchar(300) NULL
fpriceint(10) NULL
fimgvarchar(128) NULL
fcountint(11) NULL
typevarchar(30) NOT NULL*/
public class Foods {         
		private int fid;        //食物主键
		private String fname;   //食物名称
		private String fintr;   //食物介绍
		private int fprice;     //食物价格
		private String fimg;    //图片
		private int fcount;     //食物库存数量
		private String type;    //食物类型
		/*
		 * 		
		private int page=1;
		private int size=4;
		private int pagecount=0;
		
		
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
		public int getPagecount() {
			return pagecount;
		}
		public void setPagecount(int pagecount) {
			this.pagecount = pagecount;
		}
		*/
		public int getFid() {
			return fid;
		}
		public void setFid(int fid) {
			this.fid = fid;
		}
		public String getFname() {
			return fname;
		}
		public void setFname(String fname) {
			this.fname = fname;
		}
		public String getFintr() {
			return fintr;
		}
		public void setFintr(String fintr) {
			this.fintr = fintr;
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
		public int getFcount() {
			return fcount;
		}
		public void setFcount(int fcount) {
			this.fcount = fcount;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public Foods(int fid, String fname, String fintr, int fprice,
				String fimg, int fcount, String type) {
			super();
			this.fid = fid;
			this.fname = fname;
			this.fintr = fintr;
			this.fprice = fprice;
			this.fimg = fimg;
			this.fcount = fcount;
			this.type = type;
		}
		public Foods() {
			super();
		}
		@Override
		public String toString() {
			return "Foods [fid=" + fid + ", fname=" + fname + ", fintr="
					+ fintr + ", fprice=" + fprice + ", fimg=" + fimg
					+ ", fcount=" + fcount + ", type=" + type + "]";
		}
		
		
		
		
}
