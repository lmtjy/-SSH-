package biz;

import entity.User;

public interface UserBiz {
	//��¼
		public User login(String name,String pwd);
		//ע����֤
		public User queryByName(Object ...objs);
		public User queryByEmail(String email);
		public User queryByPhone(String phone);
		
		public boolean add(User u);
		public boolean queryVerifyCode(String verifyCode,String phone);
		public User querypwd(String verifyCode,String phone);
		public boolean updatepwd(String pwd,String name);
		
}
