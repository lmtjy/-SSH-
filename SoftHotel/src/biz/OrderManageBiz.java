package biz;

import java.util.List;
import entity.Foods;
import entity.HotelOrder;
import entity.HotelOrderDetail;
import entity.RoomOrderDetail;
import entity.Rooms;

public interface OrderManageBiz {
	
	public List<HotelOrderDetail> getAllHotelOrderDetails();
	
	public List<HotelOrder> getAllHotelOrders();
	
	public List<HotelOrderDetail> getRoomOrderDetailById(int oid,int type);
	
	public List<HotelOrderDetail> getFoodOrderDetailById(int oid,int type); 
	
	public List<RoomOrderDetail> getRoomDetailsById(int rid, String name);
	
	public Foods getFoodById(int fid);
	
	public boolean deleteRoomByOid(int oid);
	
	//退房金额改变三部曲
	//1.根据oid找到该订单详情，得到rid
	public RoomOrderDetail queryRoomByOid(int oid);
	//2.根据productid(rid)和type找到用户的oid
	
	public HotelOrderDetail queryHotelOrderByRidAndType(int pid,int type);
	
	//3.根据oid找到找到用户的订单
	public HotelOrder queryHotelUserByOid(int oid);
	//更新价格
		public boolean updateHotelUserPrice(int price,int oid);
		
  public int getCountUnpaidByStatus(int status);
  
	public List<Rooms> getAllRooms();
	public boolean deleteTimeOrderById(int oid);
	
	  //根据oid和count=0的情况删除订单详情
	public boolean deleteHotelOrderDetailByOid(int oid);
		//根据oid删除订单
	public boolean deleteHotelOrderByOid(int oid);
	//查找单个订单详情
	public HotelOrderDetail getHotelOrderDetail(int oid,int pid);
		
		public boolean updateHotelOrderDetail(HotelOrderDetail hod);
  
}