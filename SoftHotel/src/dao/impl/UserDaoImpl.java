package dao.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import util.HibernateUtil;
import dao.UserDao;
import entity.User;
@Repository
public class UserDaoImpl implements UserDao{
	@Resource
	private HibernateUtil util;

	@Override
	public User login(String name, String pwd) {
		// TODO Auto-generated method stub
		return   util.queryByUnique("from User where uname=? and upwd=? ",name,pwd);
	}

	@Override
	public User queryByName(Object ...objs) {
		// TODO Auto-generated method stub
		return util.queryByUnique(" from User where uname=? ", objs);
	}

	@Override
	public User queryByEmail(String email) {
		// TODO Auto-generated method stub
		return util.queryByUnique("from User where email=?", email);
	}

	@Override
	public User queryByPhone(String phone) {
		// TODO Auto-generated method stub
		return util.queryByUnique("from User where uphone=?", phone);
	}

	@Override
	public boolean add(User u) {
		// TODO Auto-generated method stub
		return util.add(u);
	}

	@Override
	public boolean queryVerifyCode(String verifyCode, String phone) {
		// TODO Auto-generated method stub
		return util.updateByHql("UPDATE User set verifyCode=? where uphone=?", verifyCode,phone);
	}

	@Override
	public User querypwd(String verifyCode, String phone) {
		// TODO Auto-generated method stub
		return util.queryByUnique("from User where verifyCode=? and uphone=?",verifyCode, phone);
	}

	@Override
	public boolean updatepwd(String pwd,String name) {
		// TODO Auto-generated method stub
		return util.updateByHql("update User set upwd =? where uname=?", pwd,name);
	}

	
	
		
	

}
