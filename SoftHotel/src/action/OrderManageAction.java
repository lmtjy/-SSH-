package action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.google.gson.Gson;

import biz.OrderManageBiz;
import entity.Foods;
import entity.HotelOrder;
import entity.HotelOrderDetail;
import entity.RoomOrderDetail;
import entity.Rooms;


@Controller
public class OrderManageAction {
	
	@Resource
	public OrderManageBiz ombiz;
	public List<HotelOrderDetail> hotelorderlist;
	public List<HotelOrder> hotelorders;//获取所有用户的订单
	public List<HotelOrderDetail> roomorders;//获取单个用户的餐饮订单
	public List<HotelOrderDetail> foodorders;//获取单个用户的食物订单
	public List<RoomOrderDetail>  roomdetails;//获取单个用户的餐饮订单详情
	public Foods foodorder;
	public List<Foods> foodorderlist = new ArrayList<Foods>();
	public List<RoomOrderDetail> roominfos = new ArrayList<RoomOrderDetail>();
 	
	public int oid;
	public int status;
	public int tstatus;
	public int statuscount;
	public String msg;
	public String show(){
		
		hotelorders = ombiz.getAllHotelOrders();

		return "order";
		
	}
	public String showinfo() throws ParseException{
		roomorders = ombiz.getRoomOrderDetailById(oid, 2);
		foodorders = ombiz.getFoodOrderDetailById(oid, 1);
		for(int i=0;i<foodorders.size();i++){
			int pfid = foodorders.get(i).getProductId();
			foodorder = ombiz.getFoodById(pfid);
			foodorderlist.add(foodorder);
		}
	    for(int i=0;i<roomorders.size();i++){
	     int pid =roomorders.get(i).getProductId();
	    
	     String name = roomorders.get(i).getOid().getOrderName();
	    
	        roomdetails = ombiz.getRoomDetailsById(pid, name);
	       for(int j=0;j<roomdetails.size();j++){
	    	   roominfos.add(roomdetails.get(j)); 
	       }
	    }
	  
	   
	    
	    System.out.println("roominfos:------"+roominfos);
	    System.out.println("foodorderlist-----"+foodorderlist);
	    tstatus = status;
		
		return "orderinfo";
	}
	
	public String delete(){
		int tprice = ombiz.queryRoomByOid(oid).getTprice();
		int rid = ombiz.queryRoomByOid(oid).getRid().getRid();
		 int userid =  ombiz.queryHotelOrderByRidAndType(rid,2).getOid().getOid();
		 int uprice =  ombiz.queryHotelUserByOid(userid).getPrice();
		int price = uprice - tprice;
		boolean flag = ombiz.updateHotelUserPrice(price, userid);
		if(flag){
			System.out.println("更新成功");
		}
		else{
			System.out.println("更新失败");
		}
	System.out.println( "count:"+ombiz.queryHotelOrderByRidAndType(rid,2).getCount());
	System.out.println("num"+ombiz.queryRoomByOid(oid).getNum());
	   int count = ombiz.queryHotelOrderByRidAndType(rid,2).getCount()-ombiz.queryRoomByOid(oid).getNum();
	   ombiz.deleteRoomByOid(oid);
	   System.out.println("new count:"+count);
	     //ombiz.updateHotelOrderCount(userid,rid,count);
	   HotelOrderDetail hod = ombiz.getHotelOrderDetail(userid, rid);
	   System.out.println("hod:"+hod);
	     hod.setCount(count);
	     boolean f = ombiz.updateHotelOrderDetail(hod);
	     System.out.println("fff:"+f);
	     if(count==0){
	    	 ombiz.deleteHotelOrderDetailByOid(userid);
	    	 ombiz.deleteHotelOrderByOid(userid);
	     }
	        return show();
	}
	
	public String sum(){
		List<Rooms> list = ombiz.getAllRooms();
		Gson gson = new Gson();
		 msg = gson.toJson(list);
		return "ajax";
	}

	public List<HotelOrderDetail> getHotelorderlist() {
		return hotelorderlist;
	}

	public void setHotelorderlist(List<HotelOrderDetail> hotelorderlist) {
		this.hotelorderlist = hotelorderlist;
	}

	public List<HotelOrder> getHotelorders() {
		return hotelorders;
	}

	public void setHotelorders(List<HotelOrder> hotelorders) {
		this.hotelorders = hotelorders;
	}
	public List<HotelOrderDetail> getFoodorders() {
		return foodorders;
	}
	public void setFoodorders(List<HotelOrderDetail> foodorders) {
		this.foodorders = foodorders;
	}
	public List<RoomOrderDetail> getRoomdetails() {
		return roomdetails;
	}
	public void setRoomdetails(List<RoomOrderDetail> roomdetails) {
		this.roomdetails = roomdetails;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public List<RoomOrderDetail> getRoominfos() {
		return roominfos;
	}
	public void setRoominfos(List<RoomOrderDetail> roominfos) {
		this.roominfos = roominfos;
	}
	public List<Foods> getFoodorderlist() {
		return foodorderlist;
	}
	public void setFoodorderlist(List<Foods> foodorderlist) {
		this.foodorderlist = foodorderlist;
	}
	public int getTstatus() {
		return tstatus;
	}
	public void setTstatus(int tstatus) {
		this.tstatus = tstatus;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getStatuscount() {
		return statuscount;
	}
	public void setStatuscount(int statuscount) {
		this.statuscount = statuscount;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
	
	
	
	
}
