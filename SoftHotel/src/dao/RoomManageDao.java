package dao;

import java.util.List;

import entity.Rooms;


public interface RoomManageDao {
	
	//分页显示客房
	public List<Rooms> queryByPage(int page);
	//查询总记录数
	public int queryCount();
	//修改对应的客房信息
	public int updateRoom(Rooms room);
	
	//添加客房
	public boolean addRoom(Rooms room);
}
