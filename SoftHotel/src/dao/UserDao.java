package dao;

import entity.User;

public interface UserDao {
	//��¼
	public User login(String name,String pwd);
	//��֤ע����
	public User queryByName(Object ...objs);
	public User queryByEmail(String email);
	public User queryByPhone(String phone);
	//�ύע��
	public boolean add(User u);
	//�ж϶���
	public boolean queryVerifyCode(String verifyCode,String phone);
	public User querypwd(String verifyCode,String phone);
	//������Ϣ���޸�����
	public boolean updatepwd(String pwd,String name);
}
