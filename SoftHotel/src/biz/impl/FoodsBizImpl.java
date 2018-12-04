package biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.FoodsDao;
import entity.Foods;
import entity.HotelCart;
import entity.User;
import biz.FoodsBiz;
@Service
public class FoodsBizImpl implements FoodsBiz{

	@Resource
	private FoodsDao dao;
	
	/*
	@Override
	public List<Foods> queryByHQL(String type,int page) {
		
		return dao.queryByHQL(type, page);
	}
*/
	@Override
	public List<Foods> queryByHQL(String type) {
		
		return dao.queryByHQL(type);
	}
	@Override
	public Foods get(String foods) {
		
		return dao.get("from Foods", foods);
	}


	@Override
	public List<Foods> queryByHQLPage(int page) {
		
		return dao.queryByHQLPage(page);
	}

	@Override
	public int getCount() {

		return dao.getCount();
	}

/*
	@Override
	public int queryCountType(String type) {
	
		return dao.queryCountType(type);
	}
	*/
	@Override
	public Foods get(int id) {
		
		return dao.get(id);
	}
	@Override
	public boolean add(Foods f) {

		return dao.add(f);
	}
	@Override
	public boolean delete(int id) {

		return dao.delete(id);
	}
	@Override
	public boolean update(Foods f) {

		return dao.update(f);
	}
	@Override
	public User getUid(String uname) {
		
		return dao.getUid(uname);
	}
	@Override
	public boolean addcart(HotelCart h) {
		return dao.addcart(h);
	}

}
