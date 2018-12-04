package action;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import util.OrderNumUtil;
import biz.RoomAddCardBiz;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import entity.HotelCartDetails;
import entity.RoomOrderDetail;

@Controller
public class RoomAddCardAction extends ActionSupport implements ModelDriven<RoomOrderDetail>{
	@Resource
	private RoomAddCardBiz cardBiz;
	private RoomOrderDetail ord = new RoomOrderDetail();
	private String msg;
	private OrderNumUtil util = new OrderNumUtil();
	private String uname;
	private int productId;
	private int count;
	private int type;
	private HotelCartDetails card;
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
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	@Override
	public RoomOrderDetail getModel() {
		return ord;
	}
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	/**
	 * 加入购物车  房间
	 * @return
	 */
 	public String addCard(){
 		card = new HotelCartDetails();
 		card.setProductId(productId);
 		card.setCount(count);
 		card.setType(type);
 		System.out.println(uname+"--------"+card);
 		boolean rs = cardBiz.addCard(uname,card);
 		if(rs==true){
 			Gson gson = new Gson();
 			msg =  gson.toJson(card);
 			return "ajax";
 		}else{
 			msg = "";
			return "room_detail";
 		}
 	}
 	/*
 	 * 加入订单
 	 */
	public String addOrder(){
		card = new HotelCartDetails();
		System.out.println("房间订单--------");
		ord.setOrderNum(util.getOrderNum());
		ord.setOrderTime(util.getOrderTime());
		System.out.println(ord);
		boolean rs = cardBiz.addRoomOrder(ord);
 		card.setProductId(ord.getRid().getRid());
 		card.setCount(ord.getNum());
 		card.setType(2);
		cardBiz.addCard(uname,card);
		if (rs == true) {
			Gson gson = new Gson();
			msg =  gson.toJson(ord.getOrderNum());
			return "ajax";
		} else {
			msg = "";
			return "room_order";
		}
	}
	/*
	 * 删除购物车详情
	 */
	public String deleteCardDtail(){
		boolean rs = cardBiz.deleteCardDtail(uname,type,productId);
		if(rs==true){
			msg = "";
			return "ajax";
		}else{
			return "myOrder";
		}
	}
	//更新购物车详情
	public String updateCartDetail(){
		boolean rs = cardBiz.updateCartDetail(uname,type,productId,count);
		if(rs==true){
			msg = "";
			return "ajax";
		}else{
			return "myOrder";
		}
	}
	/*//更新购物车详情checked
	public String updateChecked(){
		
	}*/
}
