package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import util.HibernateUtil;
import dao.RoomAddCardDao;
import entity.HotelCart;
import entity.HotelCartDetails;
import entity.HotelOrder;
import entity.HotelOrderDetail;
import entity.RoomOrderDetail;
import entity.User;

@Repository
public class RoomAddCardDaoImpl implements RoomAddCardDao {
	@Resource
	private HibernateUtil util;

	@Override
	public User queryByName(String uname) {
		return util.queryByUnique("from User where uname=?", uname);
	}

	@Override
	public boolean addRoomOrder(RoomOrderDetail ord) {
		return util.add(ord);
	}

	@Override
	public boolean insertCard(User user) {
		HotelCart hotelCart = new HotelCart();
		hotelCart.setUid(user);
		return util.add(hotelCart);
	}

	@Override
	public HotelCart queryByuid(int uid) {
		return util.queryByUnique("from HotelCart where uid = ?", uid);
	}

	@Override
	public HotelCartDetails queryBuy(int cid, int productId, int type) {
		return util
				.queryByUnique(
						"from HotelCartDetails where cid.cid=? and productId=? and type=?",
						cid,productId,type);
	}

	@Override
	public boolean updateCount(HotelCartDetails queryBuy, HotelCartDetails card) {
		int count = queryBuy.getCount();
		queryBuy.setCount(count+card.getCount());
		return util.update(queryBuy);
	}

	@Override
	public boolean insertCardDetail(HotelCart cart,HotelCartDetails card) {
		HotelCartDetails c = new HotelCartDetails();
		c.setCid(cart);
		c.setProductId(card.getProductId());
		c.setCount(card.getCount());
		c.setType(card.getType());
		c.setState(0);
		return util.add(c);
	}

	@Override
	public HotelOrder queryById(int uid) {
		return util.queryByUnique("from HotelOrder where uid=?", uid);
	}

	@Override
	public boolean insertOrder(HotelOrderDetail hod) {
		return util.add(hod);
	}

	@Override
	public boolean deleteCard(HotelCartDetails hotelCartDetails) {
		return util.delete(hotelCartDetails);
	}

	@Override
	public boolean deleteCardDetail(HotelCartDetails hot) {
		return util.delete(hot);
	}

	@Override
	public boolean updateCartDetail(HotelCartDetails hot) {
		return util.update(hot);
	}

	@Override
	public List<Object> queryOid(int uid) {
		return util.queryHql("from HotelOrder where uid=?", uid);
	}

	@Override
	public List<HotelOrderDetail> queryByOid(int oid) {
		return util.queryHql("from HotelOrderDetail where oid=?", oid);
	}

}
