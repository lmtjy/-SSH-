package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import util.HibernateUtil;
import dao.FoodsDao;
import entity.Foods;
import entity.HotelCart;
import entity.User;
@Repository
public class FoodsDaoImpl implements FoodsDao{

	@Resource
	private HibernateUtil util;
	@Override
	public boolean add(Foods f) {
		// TODO Auto-generated method stub
		return util.add(f);
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return util.delete(get(id));
	}

	@Override
	public boolean update(Foods f) {
		// TODO Auto-generated method stub
		return util.update(f);
	}

	@Override
	public Foods get(int id) {
		// TODO Auto-generated method stub
		return util.get(Foods.class,id);
	}

	@Override
	public Foods get(String hql, Object... objs) {
		// TODO Auto-generated method stub
		return util.queryByUnique(hql, objs);
	}

	/*
	 * @Override
	 
	public List<Foods> queryByHQL(String type,int page) {
		// TODO Auto-generated method stub
		return util.queryHqlByPage("from Foods where type=?", page, 4, type);
	}
*/
	@Override
	public List<Foods> queryByHQL(String type) {
		
		return util.queryHql("from Foods where type=?", type);
	}

	@Override
	public List<Foods> queryByHQLPage(int page) {
		// TODO Auto-generated method stub
		return util.queryHqlByPage("from Foods", page, 4);
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return util.queryCount("select count(*) from Foods");
	}

	@Override
	public User getUid(String uname) {

		return util.queryByUnique("from User where uname=?", uname);
	}

	@Override
	public boolean addcart(HotelCart h) {
		
		return util.add(h);
	}

	


	/*
	 * @Override
	 
	public int queryCountType(String type) {
		
		return util.queryCount("select count(*) from Foods where type=? ", type);
	}
*/
	
}
