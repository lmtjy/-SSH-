package biz.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import biz.RecruitBiz;
import util.HibernateUtil;
import dao.RecruitDao;
import entity.Recruit;

@Service
public class RecruitBizImpl implements RecruitBiz {
	@Resource
	private RecruitDao recruitDao;
	@Override
	public int queryCount(Object... obj) {
		String hql = "select count(*) from Recruit";
		return recruitDao.queryCount(hql);
	}
	@Override
	public boolean add(Recruit recruit) {
		System.out.println(recruit);
		return recruitDao.add(recruit);
	}
	@Override
	public List<Recruit> queryAll() {
		return recruitDao.queryAll();
	}
	@Override
	public boolean delAll() {
		List<Recruit> list = new ArrayList<Recruit>();
		list = recruitDao.queryAll();
		boolean f = true;
		for (Recruit recruit : list) {
			f = recruitDao.delAll(recruit);
		}
		return f;
	}
	
}
