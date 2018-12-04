package biz;

import java.util.List;

import entity.HotelCartDetails;
import entity.RoomOrderDetail;
import entity.User;

/*
 * 房间订单
 */
public interface RoomAddCardBiz {
	// 根据uname 查询uid
	public User queryByName(String uname);

	// 添加房间订单
	public boolean addRoomOrder(RoomOrderDetail ord);

	public boolean addCard(String uname, HotelCartDetails card);
	//删除购物车详情
	public boolean deleteCardDtail(String uname, int type, int productId);
	//更新购物车详情
	public boolean updateCartDetail(String uname, int type, int productId,
			int count);

}
