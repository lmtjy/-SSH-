package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import util.HibernateUtil;
import dao.MyOrderDao;
import entity.Foods;
import entity.HotelCart;
import entity.HotelCartDetails;
import entity.HotelOrder;
import entity.Rooms;
import entity.User;

@Repository
public class MyOrderDaoImpl implements MyOrderDao {
	@Resource
	private HibernateUtil util;

	@Override
	public Foods queryByfid(int fid) {
		return util.queryByUnique("from Foods where fid=?", fid);
	}

	@Override
	public Rooms queryByrid(int rid) {
		return util.queryByUnique("from Rooms where rid=?", rid);
	}

	@Override
	public HotelCart queryById(int uid) {
		return util.queryByUnique("from HotelCart where uid=?", uid);
	}

	@Override
	public List<HotelCartDetails> queryByCid(int cid) {
		return util.queryHql("from HotelCartDetails where cid=?", cid);
	}

	@Override
	public boolean confirmOrder(HotelOrder hot) {
		return util.add(hot);
	}


}
