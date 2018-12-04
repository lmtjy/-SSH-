package biz.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.UserDao;
import entity.User;
import biz.UserBiz;



@Service
public class UserBizImpl implements UserBiz{
@Resource
private UserDao dao;

@Override
public User login(String name, String pwd) {
	// TODO Auto-generated method stub
	return dao.login(name, pwd);
}

@Override
public User queryByName(Object ...objs) {
	// TODO Auto-generated method stub
	return dao.queryByName(objs);
}

@Override
public User queryByEmail(String email) {
	// TODO Auto-generated method stub
	return dao.queryByEmail(email);
}

@Override
public User queryByPhone(String phone) {
	// TODO Auto-generated method stub
	return dao.queryByPhone(phone);
}

@Override
public boolean add(User u) {
	// TODO Auto-generated method stub
	return dao.add(u);
}

@Override
public boolean queryVerifyCode(String verifyCode, String phone) {
	// TODO Auto-generated method stub
	return dao.queryVerifyCode(verifyCode, phone);
}

@Override
public User querypwd(String verifyCode, String phone) {
	// TODO Auto-generated method stub
	return dao.querypwd(verifyCode, phone);
}

@Override
public boolean updatepwd(String pwd, String name) {
	// TODO Auto-generated method stub
	return dao.updatepwd(pwd, name);
}




	
	
}
