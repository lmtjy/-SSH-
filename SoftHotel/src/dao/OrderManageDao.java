package dao;

import java.util.List;

import entity.Foods;
import entity.HotelOrder;
import entity.HotelOrderDetail;
import entity.RoomOrderDetail;
import entity.Rooms;

public interface OrderManageDao {
	
	//查询hotel_order_detail表里的所有订单
	
	public  List<HotelOrderDetail> getAllHotelOrderDetails();
	
	//订单管理
	//第一步：获取所有的订单
	public List<HotelOrder> getAllHotelOrders();
	
	//第二步：根据oid查询该用户的餐饮订单详情
	public List<HotelOrderDetail> getRoomOrderDetailById(int oid,int type);
	//第二步：根据oid查询该用户的食物订单详情
	public List<HotelOrderDetail> getFoodOrderDetailById(int oid,int type);
	//第三步:根据rid和tname查询用户房间订单详情
	public List<RoomOrderDetail> getRoomDetailsById(int rid,String name);
	//第四步:根据fid查询用户预定的菜品信息
	public Foods getFoodById(int fid);
	
	//退房处理，根据oid删除订单详情
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
	
	//统计未支付的订单数量
	public int getCountUnpaidByStatus(int status);

	
	public List<Rooms> getAllRooms();
	
	public boolean deleteTimeOrderById(int oid);
	//根据oid和pid更新房间count
	public HotelOrderDetail getHotelOrderDetail(int oid,int pid);
	
	public boolean updateHotelOrderDetail(HotelOrderDetail hod);
	
	//根据oid和count=0的情况删除订单详情
	public boolean deleteHotelOrderDetailByOid(int oid);
	//根据oid删除订单
	public boolean deleteHotelOrderByOid(int oid);
}
