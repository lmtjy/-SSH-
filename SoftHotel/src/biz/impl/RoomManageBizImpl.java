package biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.RoomDetailDao;
import dao.RoomManageDao;
import entity.Rooms;
import biz.RoomManageBiz;
import biz.RoomsBiz;

@Service
public class RoomManageBizImpl implements RoomManageBiz {
	@Resource
	private RoomManageDao rmdao;

	@Override
	public List<Rooms> queryByPage(int page) {
		// TODO Auto-generated method stub
		return rmdao.queryByPage(page);
	}

	@Override
	public int queryCount() {
		// TODO Auto-generated method stub
		return rmdao.queryCount();
	}

	@Override
	public int updateRoom(Rooms room) {
		// TODO Auto-generated method stub
		return rmdao.updateRoom(room);
	}

	@Override
	public boolean addRoom(Rooms room) {
		// TODO Auto-generated method stub
		return rmdao.addRoom(room);
	}


}
