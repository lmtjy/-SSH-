package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import util.HibernateUtil;
import dao.RoomDetailDao;
import entity.RoomOrderDetail;
import entity.Rooms;

@Repository
public class RoomDetailDaoImpl implements RoomDetailDao{
	@Resource 
	private HibernateUtil util;
	@Override
	public List<Rooms> queryRooms() {
		List<Rooms> list = util.queryHql("from Rooms");
		return list;
	}
	@Override
	public Rooms queryById(int rid) {
		return util.get(Rooms.class, rid);
	}
	@Override
	public List<Rooms> ASCRooms() {
		return util.queryHql("from Rooms order by proPrice asc");
	}
	@Override
	public List<Rooms> DESCRooms() {
		return util.queryHql("from Rooms order by proPrice desc");
	}
	

}
