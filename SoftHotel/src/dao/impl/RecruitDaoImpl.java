package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import util.HibernateUtil;
import dao.RecruitDao;
import entity.Recruit;

@Repository
public class RecruitDaoImpl implements RecruitDao {
	@Resource
	private HibernateUtil util;
	@Override
	public int queryCount(String hql, Object... obj) {
		return util.queryCount(hql, obj);
	}
	@Override
	public boolean add(Recruit recruit) {
		return util.add(recruit);
	}
	@Override
	public List<Recruit> queryAll() {
		String hql = "from Recruit";
		return util.queryHql(hql);
	}
	@Override
	public boolean delAll(Recruit recruit) {
		return util.delete(recruit);
	}
	
}
