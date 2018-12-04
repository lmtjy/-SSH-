package biz;

import entity.User;

public interface UserBiz {
	//µÇÂ¼
		public User login(String name,String pwd);
		//×¢²áÑéÖ¤
		public User queryByName(Object ...objs);
		public User queryByEmail(String email);
		public User queryByPhone(String phone);
		
		public boolean add(User u);
		public boolean queryVerifyCode(String verifyCode,String phone);
		public User querypwd(String verifyCode,String phone);
		public boolean updatepwd(String pwd,String name);
		
}
