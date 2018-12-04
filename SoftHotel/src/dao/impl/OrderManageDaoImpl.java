package dao.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import util.HibernateUtil;
import dao.OrderManageDao;
import dao.RoomManageDao;
import entity.Foods;
import entity.HotelOrder;
import entity.HotelOrderDetail;
import entity.RoomOrderDetail;
import entity.Rooms;


@Repository
public class OrderManageDaoImpl implements OrderManageDao {
	
	@Resource
	public HibernateUtil util;

	@Override
	public List<HotelOrderDetail> getAllHotelOrderDetails() {
		// TODO Auto-generated method stub
		return util.queryHql("from HotelOrderDetail");
	}

	@Override
	public List<HotelOrder> getAllHotelOrders() {
		// TODO Auto-generated method stub
		return util.queryHql("from HotelOrder");
	}

	@Override
	public List<HotelOrderDetail> getRoomOrderDetailById(int oid,int type) {
		// TODO Auto-generated method stub
		return util.queryHql("from HotelOrderDetail where oid=? and type=?" ,oid,type);
	}

	@Override
	public List<HotelOrderDetail> getFoodOrderDetailById(int oid, int type) {
		// TODO Auto-generated method stub
		return util.queryHql("from HotelOrderDetail where oid=? and type=?",oid,type);
	}

	@Override
	public List<RoomOrderDetail> getRoomDetailsById(int rid, String name) {
		// TODO Auto-generated method stub
		return util.queryHql("from RoomOrderDetail where rid=? and tname=?",rid,name);
	}

	@Override
	public Foods getFoodById(int fid) {
		// TODO Auto-generated method stub
		return util.queryByUnique("from Foods where fid=?",fid);
	}

	@Override
	public boolean deleteRoomByOid(int oid) {
		// TODO Auto-generated method stub
		return util.updateByHql("delete from RoomOrderDetail where oid=?",oid);
		
	}

	@Override
	public RoomOrderDetail queryRoomByOid(int oid) {
		// TODO Auto-generated method stub
		return util.queryByUnique("from RoomOrderDetail where oid=?", oid);
	}

	@Override
	public HotelOrderDetail queryHotelOrderByRidAndType(int pid, int type) {
		// TODO Auto-generated method stub
		return util.queryByUnique("from HotelOrderDetail where productId=? and type=?",pid,2);
	}

	@Override
	public HotelOrder queryHotelUserByOid(int oid) {
		// TODO Auto-generated method stub
		return util.queryByUnique("from HotelOrder where oid=?",oid);
	}

	@Override
	public boolean updateHotelUserPrice(int price, int oid) {
		// TODO Auto-generated method stub
		return util.updateByHql("update HotelOrder set price=? where oid=?",price,oid);
	}

	@Override
	public int getCountUnpaidByStatus(int status) {
		// TODO Auto-generated method stub
		return util.queryCount("select count(*) from HotelOrder where status=?", status);
	}
	@Override
	public List<Rooms> getAllRooms() {
		// TODO Auto-generated method stub
		return util.queryHql("from Rooms");
	}

	@Override
	public boolean deleteTimeOrderById(int oid) {
		// TODO Auto-generated method stub
		return util.updateByHql("delete from HotelOrder where oid=?", oid);
	}


	@Override
	public boolean deleteHotelOrderDetailByOid(int oid) {
		// TODO Auto-generated method stub
		return util.updateByHql("delete from HotelOrderDetail where oid=?",oid);
	}

	@Override
	public boolean deleteHotelOrderByOid(int oid) {
		// TODO Auto-generated method stub
		return util.updateByHql("delete from HotelOrder where oid=?",oid);
	}

	@Override
	public HotelOrderDetail getHotelOrderDetail(int oid, int pid) {
		// TODO Auto-generated method stub
		return util.queryByUnique("from HotelOrderDetail where oid =? and type=2 and productId=?",oid,pid);
	}

	@Override
	public boolean updateHotelOrderDetail(HotelOrderDetail hod) {
		// TODO Auto-generated method stub
		return util.update(hod);
	}
	

}
