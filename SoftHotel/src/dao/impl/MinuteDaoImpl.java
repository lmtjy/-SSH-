package dao.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import util.HibernateUtil;
import dao.MinuteDao;
import entity.Minute;

@Repository
public class MinuteDaoImpl implements MinuteDao {
	@Resource
	private HibernateUtil util;
	@Override
	public Minute queryById(int id) {
		return util.get(Minute.class, id);
	}
	@Override
	public boolean addMinute(Minute minute) {
		return util.add(minute);
	}
	@Override
	public boolean update(Minute minute) {
		return util.update(minute);
	}
	@Override
	public boolean delMinute(Minute minute) {
		return util.delete(minute);
	}
	
}
