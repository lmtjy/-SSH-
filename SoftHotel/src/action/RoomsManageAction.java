package action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.aspectj.util.FileUtil;
import org.springframework.stereotype.Controller;

import biz.RoomManageBiz;
import biz.RoomsBiz;
import entity.Rooms;


@Controller
public class RoomsManageAction {
	@Resource
	private RoomManageBiz rmbiz;
	@Resource
	private RoomsBiz roombiz;
	private List<Rooms> roomList;
	private Rooms room;
	private int page;
	private int prev;
	private int next;
	private int pagecount;
	private String status;
	private int rid;
	private String savePath;
	private String myfileFileName;
	private File myfile;
	private File myfile2;
	private String myfile2FileName;
	private String newlpic;
	private String newrpic;

	private int rid2;
	
	

	public int getRid2() {
		return rid2;
	}
	public void setRid2(int rid2) {
		this.rid2 = rid2;
	}
	public String query(){
		 int size = 3;
		 pagecount = rmbiz.queryCount();		 //获取总共页数
		 pagecount = pagecount%size==0?pagecount/size:(pagecount/size)+1;
		 //获取当前页
		 page = page<1?1:page;//上容错
		 page = page>pagecount?pagecount:page;//下容错
		 //上一页
		 prev = page-1<1?1:page-1;
		 prev = prev>pagecount?pagecount:prev;
		 //下一页
		 next = page+1<1?1:page+1;
		 next = next>pagecount?pagecount:next;
		roomList = rmbiz.queryByPage(page);
		
		
		return "query";
		
	}
	public String update(){
		System.out.println(rid);
		room = roombiz.queryById(rid);
		 System.out.println(room);
		 newlpic = room.getLpic();
		 newrpic = room.getRpic();
		
		return "update";
		
	}
	public String updateRe(){
		System.out.println("执行中");
		String path = ServletActionContext.getServletContext().getRealPath(savePath);
		File filePath = new File(path);
		System.out.println("地址:"+path);
		//System.out.println(myfileFileName);
		if(!filePath.exists()){
			filePath.mkdir();
		}
		if(myfile2FileName==null||myfileFileName==null){
			room.setRid(rid2);
		/*	room.setLpic(room.getLpic());
			room.setRpic(room.getRpic());*/
			System.out.println(room);
			int count = rmbiz.updateRoom(room);
			if(count>0){
				System.out.println("修改成功");
			}
			else{
				System.out.println("修改失败");
			}
			return query();
			
		}
		if(myfile2FileName.length()!=0||myfile2FileName!=null){
		
			room.setLpic("images/hotel/"+myfile2FileName);
			try {
				
				FileUtil.copyFile(myfile2, new File(path,myfile2FileName));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(myfileFileName.length()!=0||myfileFileName!=null){
			room.setRpic("images/hotel/"+myfileFileName);
			try {
				FileUtil.copyFile(myfile, new File(path,myfileFileName));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("roomid"+rid2);
	
		room.setRid(rid2);
		System.out.println("room:***"+room);
		
		System.out.println(room.getRpic());
		System.out.println(room.getLpic());
	
		int count = rmbiz.updateRoom(room);
		if(count>0){
			System.out.println("修改成功");
		}
		else{
			System.out.println("修改失败");
		}
		
		return query();
		
	}
	public String add(){
		System.out.println("执行add方法--------");
		return "update";
	}
	public String addRe(){
		System.out.println("执行中");
		String path = ServletActionContext.getServletContext().getRealPath(savePath);
		File filePath = new File(path);
		System.out.println(myfileFileName);
		if(!filePath.exists()){
			filePath.mkdir();
		}
		room.setRpic("images/hotel/"+myfileFileName);
		room.setLpic("images/hotel/"+myfile2FileName);
		room.setCancel(1);
		System.out.println(room.getRpic());
		try {
			FileUtil.copyFile(myfile, new File(path,myfileFileName));
			FileUtil.copyFile(myfile2, new File(path,myfile2FileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("room:***"+room);
		boolean flag = rmbiz.addRoom(room);
		if(flag){
			System.out.println("添加成功");
		}
		else{
			System.out.println("添加失败");
		}
		return query();
	}
	public List<Rooms> getRoomList() {
		return roomList;
	}
	public void setRoomList(List<Rooms> roomList) {
		this.roomList = roomList;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPrev() {
		return prev;
	}
	public void setPrev(int prev) {
		this.prev = prev;
	}
	public int getNext() {
		return next;
	}
	public void setNext(int next) {
		this.next = next;
	}
	public int getPagecount() {
		return pagecount;
	}
	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public Rooms getRoom() {
		return room;
	}
	public void setRoom(Rooms room) {
		this.room = room;
	}
	public File getMyfile() {
		return myfile;
	}
	public void setMyfile(File myfile) {
		this.myfile = myfile;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public String getMyfileFileName() {
		return myfileFileName;
	}
	public void setMyfileFileName(String myfileFileName) {
		this.myfileFileName = myfileFileName;
	}
	public File getMyfile2() {
		return myfile2;
	}
	public void setMyfile2(File myfile2) {
		this.myfile2 = myfile2;
	}
	public String getMyfile2FileName() {
		return myfile2FileName;
	}
	public void setMyfile2FileName(String myfile2FileName) {
		this.myfile2FileName = myfile2FileName;
	}
	public String getNewlpic() {
		return newlpic;
	}
	public void setNewlpic(String newlpic) {
		this.newlpic = newlpic;
	}
	public String getNewrpic() {
		return newrpic;
	}
	public void setNewrpic(String newrpic) {
		this.newrpic = newrpic;
	}
	
	
	
	
	

}
