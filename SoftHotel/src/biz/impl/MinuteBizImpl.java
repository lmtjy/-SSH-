package biz.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import biz.MinuteBiz;
import dao.MinuteDao;
import entity.Minute;

@Service
public class MinuteBizImpl implements MinuteBiz {
	@Resource
	private MinuteDao minuteDao;
	@Override
	public Minute queryById(int id) {
		return minuteDao.queryById(id);
	}
	@Override
	public boolean addMinute(Minute minute) {
		return minuteDao.addMinute(minute);
	}
	@Override
	public boolean update(Minute minute) {
		return minuteDao.update(minute);
	}
	@Override
	public boolean delMinute(Minute minute) {
		return minuteDao.delMinute(minute);
	}
	
}
