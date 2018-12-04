package action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import util.OrderNumUtil;
import biz.MyOrderBiz;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ModelDriven;

import entity.FoodDetail;
import entity.Foods;
import entity.HotelCartDetails;
import entity.HotelOrder;
import entity.HotelOrderDetail;
import entity.RoomDetail;
import entity.Rooms;

/*
 * 查看我的订单
 */
@Controller
public class MyOrderAction implements ModelDriven<HotelOrder>{
	@Resource
	private MyOrderBiz myOrderBiz;
	private String uname;
	private List<Object> foodList=new ArrayList<Object>();
	private List<Object> roomList=new ArrayList<Object>();
	private Map<String,List<Object>> data;
	private FoodDetail foodDetail = new FoodDetail();
	private RoomDetail roomDetail = new RoomDetail();
	private String msg;
	
	private HotelOrder hot = new HotelOrder();
	OrderNumUtil util = new OrderNumUtil();
	
	@Override
	public HotelOrder getModel() {
		// TODO Auto-generated method stub
		return hot;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String toOrderAdd(){
		return "orderAdd";
	}
	public String toMyorder(){
		return "myOrder";
	}
	/*
	 * 查看我的订单
	 */
	public String myOrder(){
		System.out.println("控制层执行了------"+uname);
		List<HotelCartDetails> list = myOrderBiz.queryOrder(uname); //获取rid,fid
		if(list!=null){
			Foods f;
			Rooms r;
			for (HotelCartDetails h : list) {
				if(h.getType()==1){
					f = myOrderBiz.queryByFid(h.getProductId());
					foodDetail.setProductId(h.getProductId());
					foodDetail.setCount(h.getCount());
					foodDetail.setFimg(f.getFimg());
					foodDetail.setFname(f.getFname());
					foodDetail.setFprice(f.getFprice());
					foodList.add(foodDetail);//得到所有食物订单
				}else{
					r = myOrderBiz.queryByRid(h.getProductId());
					roomDetail.setProductId(h.getProductId());
					roomDetail.setCount(h.getCount());
					roomDetail.setHouseType(r.getHouseType());
					roomDetail.setProPrice(r.getProPrice());
					roomDetail.setRpic(r.getRpic());
					roomList.add(roomDetail);//得到房间订单
				}
			}
			data = new HashMap<String, List<Object>>();
			data.put("foodList", foodList);
			data.put("roomList", roomList);
			Gson gson = new Gson();
			msg = gson.toJson(data);
			System.out.println(msg);
			return "ajax";
		}else{
			msg = "";
			return "reservation";
		}
	}
	/*
	 * 确认订单
	 */
	public String confirmOrder(){
		System.out.println(hot.getPrice()+"-----"+uname);
		hot.setOrderNum(util.getOrderNum());
		hot.setOrderTime(util.getOrderTime());
		hot.setStatus(0);
		System.out.println(hot);
		boolean rs = myOrderBiz.confirmOrder(uname,hot);
		if(rs==true){
			Gson gson = new Gson();
			msg =  gson.toJson(hot.getOrderNum());
			return "ajax";
		}else{
			msg = "";
			return "orderAdd";
		}
	}
	/*
	 * 查询订单信息
	 */
	public String queryHotelOrder(){
		Map<String, List<Object>> data = myOrderBiz.queryHotelOrder(uname);
		if(data!=null){
			Gson gson = new Gson();
			msg = gson.toJson(data);
			System.out.println(msg);
			return "ajax";
		}else{
			msg = "";
			return "myOrder";
		}
	}
}
