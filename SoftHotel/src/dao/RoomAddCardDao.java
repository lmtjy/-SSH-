package dao;

import java.util.List;

import entity.HotelCart;
import entity.HotelCartDetails;
import entity.HotelOrder;
import entity.HotelOrderDetail;
import entity.RoomOrderDetail;
import entity.User;

/*
 * 加入房间订单
 */
public interface RoomAddCardDao {
	// 根据uname 查询uid
	public User queryByName(String uname);

	// 添加房间订单
	public boolean addRoomOrder(RoomOrderDetail ord);
/*
	// 添加购物信息表
	public boolean addCardOrder(FoodOrder foodOrder);

	// 添加购物详情表
	public boolean addCardDetail(FoodOrderDetail detail);

	// 查看购物车表
	public List<FoodOrder> queryCard();

	public FoodOrder queryCartByname(String uname);*/
	//插入购物车数据
	public boolean insertCard(User user);
	//根据uid 获取 购物车
	public HotelCart queryByuid(int uid);
	//判断是否购买过商品
	public HotelCartDetails queryBuy(int cid, int productId, int type);

	public boolean updateCount(HotelCartDetails queryBuy, HotelCartDetails card);
	//插入一条商品数据
	public boolean insertCardDetail(HotelCart cart, HotelCartDetails card);
	//根据uid得到订单id
	public HotelOrder queryById(int uid);
	//向订单详情表中加入数据
	public boolean insertOrder(HotelOrderDetail hod);

	public boolean deleteCard(HotelCartDetails hotelCartDetails);
	//删除购物车详情
	public boolean deleteCardDetail(HotelCartDetails hot);
	//更新购物车详情
	public boolean updateCartDetail(HotelCartDetails hot);
	//根据用户id查询订单表
	public List<Object> queryOid(int uid);
	//通过oid查找订单详情
	public List<HotelOrderDetail>  queryByOid(int oid);
}
