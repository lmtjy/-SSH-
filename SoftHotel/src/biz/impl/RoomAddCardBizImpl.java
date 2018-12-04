package biz.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import biz.RoomAddCardBiz;
import dao.RoomAddCardDao;
import entity.HotelCart;
import entity.HotelCartDetails;
import entity.RoomOrderDetail;
import entity.User;

@Service
public class RoomAddCardBizImpl implements RoomAddCardBiz {
	@Resource
	private RoomAddCardDao roomAddCardDao;

	@Override
	public User queryByName(String uname) {
		return roomAddCardDao.queryByName(uname);
	}

	@Override
	public boolean addRoomOrder(RoomOrderDetail ord) {
		return roomAddCardDao.addRoomOrder(ord);
	}

	@Override
	public boolean addCard(String uname, HotelCartDetails card) {
		// 1根据用户编号查询购物车编号
		User user = roomAddCardDao.queryByName(uname);
		// 获得购物车cid
		HotelCart cart = roomAddCardDao.queryByuid(user.getUid());
		System.out.println("用户姓名为：" + user);
		// 2.1对应用户已有购物车
		if (cart != null) {
			System.out.println("购物车id为：" + cart.getCid());
			// 3根据购物车编号和产品编号，查询是否已经购买过该产品
			HotelCartDetails queryBuy = roomAddCardDao.queryBuy(cart.getCid(),
					card.getProductId(), card.getType());
			if (queryBuy != null) {
				// 3.1已经购买过该商品
				// 3.1.1修改购买数量
				boolean rs = roomAddCardDao.updateCount(queryBuy, card);
				System.out.println("修改商品数量" + rs);
				if (rs == true) {
					return true;
				} else {
					return false;
				}
			} else {
				// 3.2没有购买过该商品
				// 3.2.1插入一行购买记录
				System.out.println("没有购买该商品");
				boolean rs = roomAddCardDao.insertCardDetail(cart, card);
				if (rs == true) {
					return true;
				} else {
					return false;
				}
			}
		} else {
			// 2.2对用用户没有购物车 购物车表中插入一行记录
			roomAddCardDao.insertCard(user);
			// 获得购物车cid
			HotelCart c = roomAddCardDao.queryByuid(user.getUid());
			// 3.2.1插入一行购买记录
			boolean rs = roomAddCardDao.insertCardDetail(c, card);
			System.out.println("用户没有购物车插入购买记录" + rs);
			if (rs == true) {
				return true;
			} else {
				return false;
			}
		}
	}

	@Override
	public boolean deleteCardDtail(String uname, int type, int productId) {
		// 1根据用户编号查询购物车编号
		User user = roomAddCardDao.queryByName(uname);
		// 获得购物车cid
		int cid = roomAddCardDao.queryByuid(user.getUid()).getCid();
		System.out.println(cid+"---"+type+"---"+productId);
		HotelCartDetails hot = roomAddCardDao.queryBuy(cid,productId,type);
		System.out.println(hot);
		return roomAddCardDao.deleteCardDetail(hot);
	}

	@Override
	public boolean updateCartDetail(String uname, int type, int productId,
			int count) {
		// 1根据用户编号查询购物车编号
		User user = roomAddCardDao.queryByName(uname);
		// 获得购物车cid
		int cid = roomAddCardDao.queryByuid(user.getUid()).getCid();
		HotelCartDetails hot = roomAddCardDao.queryBuy(cid,productId,type);
		System.out.println(hot);
		hot.setCount(count);
		return roomAddCardDao.updateCartDetail(hot);
	}

}
