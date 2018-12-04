package biz;

import java.util.List;
import java.util.Map;

import entity.Foods;
import entity.HotelCartDetails;
import entity.HotelOrder;
import entity.HotelOrderDetail;
import entity.Rooms;

/*
 * 查询用户订单
 */
public interface MyOrderBiz {

	// 查询食物
	public Foods queryByFid(int fid);

	// 查询房间
	public Rooms queryByRid(int rid);

	// 通过用户姓名查询用户订单
	public List<HotelCartDetails> queryOrder(String uname);
	//确认订单
	public boolean confirmOrder(String uname, HotelOrder hot);
	//通过姓名查询订单信息
	public Map<String, List<Object>> queryHotelOrder(String uname);
	
}
