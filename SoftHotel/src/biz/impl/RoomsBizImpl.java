package biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.RoomDetailDao;
import entity.Rooms;
import biz.RoomsBiz;

@Service
public class RoomsBizImpl implements RoomsBiz {
	@Resource
	private RoomDetailDao roomDetailDao;

	@Override
	public List<Rooms> queryRooms() {
		return roomDetailDao.queryRooms();
	}

	@Override
	public Rooms queryById(int rid) {
		return roomDetailDao.queryById(rid);
	}

	@Override
	public List<Rooms> ASCRooms() {
		return roomDetailDao.ASCRooms();
	}

	@Override
	public List<Rooms> DESCRooms() {
		return roomDetailDao.DESCRooms();
	}

}
