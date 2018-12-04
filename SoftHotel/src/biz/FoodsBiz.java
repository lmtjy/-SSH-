package biz;

import java.util.List;

import entity.Foods;
import entity.HotelCart;
import entity.User;

public interface FoodsBiz {

	public Foods get(String hql);
	public List<Foods> queryByHQLPage(int page);
	public int getCount();
	public List<Foods> queryByHQL(String type);            //,int page
	//public int queryCountType(String type);	
	public Foods get(int id);
	public boolean add(Foods f);
	public boolean delete(int id);
	public boolean update(Foods f);
	
	public User getUid(String uname);
	public boolean addcart(HotelCart h);
}
