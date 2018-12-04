package action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import biz.RoomsBiz;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

import entity.Rooms;

@Controller
public class RoomsAction extends ActionSupport{
	@Resource
	private RoomsBiz roomsBiz;
	private List<Rooms> roomList;
	private Rooms room;
	private String msg;
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	private int rid;

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public List<Rooms> getRoomList() {
		return roomList;
	}

	public void setRoomList(List<Rooms> roomList) {
		this.roomList = roomList;
	}
	//查询所有房子
	public String queryRooms() {
		roomList = roomsBiz.queryRooms();
		return "reservation";
	}
	//根据查询id跳转页面
	public String queryById() {
		ServletActionContext.getRequest().getSession().setAttribute("rid",rid);
		System.out.println("----回话执行了----");
		return "room_detail";
	}
	//ajax查询房间详情
	public String getbyId(){
		room = roomsBiz.queryById(rid);
		Gson gson = new Gson();
		msg =  gson.toJson(room);
		return "ajax";
	}
	//升序查询
	public String ASCRoom(){
		roomList =roomsBiz.ASCRooms();
		return "reservation";
	}
	//降序查询
	public String DESCRoom(){
		roomList = roomsBiz.DESCRooms();
		return "reservation";
	}
	//跳转订单页面
	public String toOrder(){
		ServletActionContext.getRequest().getSession().setAttribute("rid",rid);
		System.out.println("----回话执行了----");
		return "room_order";
	}
	//返回订单详情页面
	public String roomOrder(){
		room = roomsBiz.queryById(rid);
		Gson gson = new Gson();
		msg =  gson.toJson(room);
		return "ajax";
	}
}
