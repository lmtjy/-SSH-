package dao;

import java.util.List;

import entity.Foods;
import entity.HotelCart;
import entity.HotelCartDetails;
import entity.HotelOrder;
import entity.Rooms;
import entity.User;

/*
 * 查看我的订单
 */
public interface MyOrderDao {
	/*// 通过用户姓名查询 订单id
	public FoodOrder queryByName(String uname);

	// 通过用户id查询订单
	public List<FoodOrderDetail> queryOrder(int oid);*/

	// 通过食物id查询
	public Foods queryByfid(int fid);
	
	//通过房间id查询
	public Rooms queryByrid(int rid);
	
	public HotelCart queryById(int uid);

	public List<HotelCartDetails> queryByCid(int cid);
	//创建订单表
	public boolean confirmOrder(HotelOrder hot);
}
