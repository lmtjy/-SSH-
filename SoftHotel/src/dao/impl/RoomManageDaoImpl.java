package dao.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import util.HibernateUtil;
import dao.RoomManageDao;
import entity.Rooms;


@Repository
public class RoomManageDaoImpl implements RoomManageDao {
	
	@Resource
	public HibernateUtil util;
	@Override
	public List<Rooms> queryByPage(int page) {
		// TODO Auto-generated method stub
		
		return util.queryHqlByPage("from Rooms",page,3);
	}
	@Override
	public int queryCount() {
		// TODO Auto-generated method stub
		return util.queryCount("select count(*) from Rooms");
	}
	@Override
	public int updateRoom(Rooms room) {
		boolean flag = util.updateByHql("update Rooms set regPrice=?,houseType=?,rpic=?,lpic=? where rid = ?", room.getRegPrice(),room.getHouseType(),room.getRpic(),room.getLpic(),room.getRid());
	   if(flag){
		   return 1;
	   }
	   return 0;
		
	}
	@Override
	public boolean addRoom(Rooms room) {
		// TODO Auto-generated method stub
		return util.add(room);
	}

}
