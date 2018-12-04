package biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.OrderManageDao;
import dao.RoomDetailDao;
import dao.RoomManageDao;

import entity.Foods;
import entity.HotelOrder;
import entity.HotelOrderDetail;
import entity.RoomOrderDetail;
import entity.Rooms;
import biz.OrderManageBiz;
import biz.RoomManageBiz;
import biz.RoomsBiz;

@Service
public class OrderManageBizImpl implements OrderManageBiz {

	@Resource
	private OrderManageDao omdao;

	@Override
	public List<HotelOrderDetail> getAllHotelOrderDetails() {
		// TODO Auto-generated method stub
		return omdao.getAllHotelOrderDetails();
	}

	@Override
	public List<HotelOrder> getAllHotelOrders() {
		// TODO Auto-generated method stub
		return omdao.getAllHotelOrders();
	}

	@Override
	public List<HotelOrderDetail> getRoomOrderDetailById(int oid, int type) {
		// TODO Auto-generated method stub
		return omdao.getRoomOrderDetailById(oid, type);
	}

	@Override
	public List<HotelOrderDetail> getFoodOrderDetailById(int oid, int type) {
		// TODO Auto-generated method stub
		return omdao.getFoodOrderDetailById(oid, type);
	}

	@Override
	public List<RoomOrderDetail> getRoomDetailsById(int rid, String name) {
		// TODO Auto-generated method stub
		return omdao.getRoomDetailsById(rid, name);
	}

	@Override
	public Foods getFoodById(int fid) {
		// TODO Auto-generated method stub
		return omdao.getFoodById(fid);
	}

	@Override
	public boolean deleteRoomByOid(int oid) {
		// TODO Auto-generated method stub
		return omdao.deleteRoomByOid(oid);
	}


	@Override
	public boolean updateHotelUserPrice(int price, int oid) {
		// TODO Auto-generated method stub
		return omdao.updateHotelUserPrice(price, oid);
	}

	@Override
	public RoomOrderDetail queryRoomByOid(int oid) {
		// TODO Auto-generated method stub
		return omdao.queryRoomByOid(oid);
	}

	@Override
	public HotelOrderDetail queryHotelOrderByRidAndType(int pid, int type) {
		// TODO Auto-generated method stub
		return omdao.queryHotelOrderByRidAndType(pid, type);
	}

	@Override
	public HotelOrder queryHotelUserByOid(int oid) {
		// TODO Auto-generated method stub
		return omdao.queryHotelUserByOid(oid);
	}

	@Override
	public int getCountUnpaidByStatus(int status) {
		// TODO Auto-generated method stub
		return omdao.getCountUnpaidByStatus(status);
	}

	@Override
	public List<Rooms> getAllRooms() {
		// TODO Auto-generated method stub
		return omdao.getAllRooms();
	}

	@Override
	public boolean deleteTimeOrderById(int oid) {
		// TODO Auto-generated method stub
		return omdao.deleteTimeOrderById(oid);
	}


	@Override
	public boolean deleteHotelOrderDetailByOid(int oid) {
		// TODO Auto-generated method stub
		return omdao.deleteHotelOrderDetailByOid(oid);
	}

	@Override
	public boolean deleteHotelOrderByOid(int oid) {
		// TODO Auto-generated method stub
		return omdao.deleteHotelOrderByOid(oid);
	}

	@Override
	public HotelOrderDetail getHotelOrderDetail(int oid, int pid) {
		// TODO Auto-generated method stub
		return omdao.getHotelOrderDetail(oid, pid);
	}

	@Override
	public boolean updateHotelOrderDetail(HotelOrderDetail hod) {
		// TODO Auto-generated method stub
		return omdao.updateHotelOrderDetail(hod);
	}


	



}
