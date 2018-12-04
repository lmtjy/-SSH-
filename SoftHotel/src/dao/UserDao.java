package dao;

import entity.User;

public interface UserDao {
	//ï¿½ï¿½Â¼
	public User login(String name,String pwd);
	//ï¿½ï¿½Ö¤×¢ï¿½ï¿½ï¿½ï¿½
	public User queryByName(Object ...objs);
	public User queryByEmail(String email);
	public User queryByPhone(String phone);
	//Ìá½»×¢²á
	public boolean add(User u);
	//ÅÐ¶Ï¶ÌÐÅ
	public boolean queryVerifyCode(String verifyCode,String phone);
	public User querypwd(String verifyCode,String phone);
	//»ù±¾ÐÅÏ¢£¬ÐÞ¸ÄÃÜÂë
	public boolean updatepwd(String pwd,String name);
}
