package biz;

import java.util.List;

import entity.Rooms;

public interface RoomManageBiz {
	
	public List<Rooms> queryByPage(int page);
	
	public int queryCount();
	
	public int updateRoom(Rooms room);
	
	public boolean addRoom(Rooms room);
}
