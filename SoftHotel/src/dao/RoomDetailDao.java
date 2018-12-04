package dao;

import java.util.List;

import entity.RoomOrderDetail;
import entity.Rooms;

public interface RoomDetailDao {
	// 查询房间的基本信息
	public List<Rooms> queryRooms();

	// 根据id查询房间的具体信息
	public Rooms queryById(int rid);

	// 价格升序
	public List<Rooms> ASCRooms();

	// 价格降序
	public List<Rooms> DESCRooms();

	// 查询订单信息
	//public RoomOrderDetail queryByDetail(String uname);
}
