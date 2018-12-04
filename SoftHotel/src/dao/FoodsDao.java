package dao;

import java.util.List;

import entity.Foods;
import entity.HotelCart;
import entity.User;

public interface FoodsDao {
	
	public boolean add(Foods f);
	public boolean delete(int id);
	public boolean update(Foods f);
	public Foods get(int id);          //����ID��ѯ
	public Foods get(String hql,Object ...objs);	
	public List<Foods> queryByHQLPage(int page);
	public int getCount();
	public List<Foods> queryByHQL(String type);     //,int page
    
	public User getUid(String uname);             //����uname��ѯuid
	public boolean addcart(HotelCart h);

}
