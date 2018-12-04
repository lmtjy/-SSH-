package util;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistryBuilder;

public class Testutil {
private static SessionFactory factory;
	
	static{
		Configuration config = new Configuration().configure();
		ServiceRegistryBuilder srb = new ServiceRegistryBuilder()
				.applySettings(config.getProperties());
		factory = config.buildSessionFactory(srb
				.buildServiceRegistry());
	}
	public static SessionFactory getFactory(){
		return factory;
	}
	
	public static Session getSession(){
		return factory.openSession();
	}
	//��Ӷ���
		public static boolean add(Object obj){
			boolean flag = false;
			Session session = getSession();
			try {
				Transaction tran = session.beginTransaction();
				session.save(obj);
				tran.commit();
				flag=true;
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				session.close();
			}
			return flag;
		}
		//���¶���
		public static boolean update(Object obj){
			boolean flag = false;
			Session session = getSession();
			try {
				Transaction tran = session.beginTransaction();
				session.update(obj);
				tran.commit();
				flag=true;
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				session.close();
			}
			return flag;
		}
		//ɾ�����
		public static boolean delete(Object obj){
			boolean flag = false;
			Session session = getSession();
			try {
				Transaction tran = session.beginTransaction();
				session.delete(obj);
				tran.commit();
				flag=true;
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				session.close();
			}
			return flag;
		}
		//��ѯ����
		public static <T> T get(Class cla,int id){
			T obj = null;
			Session session = getSession();
			try {
				obj = (T) session.get(cla, id);
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				session.close();
			}
			return obj;
		}
		//��ȡ������¼
		public  <T> List<T> queryHql(String hql,Object ...obj){
			List<T> list=new ArrayList<T>();
			Session session=getSession();
			try {
				Query query =session.createQuery(hql);
				if(obj!=null){
					for(int i=0;i<obj.length;i++){
						query.setString(i, obj[i].toString());
					}
				}
				list=query.list();
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				session.close();
			}
			return list;
		}
		//��ȡ������¼��ҳ
		public  <T> List<T> queryHqlByPage(String hql,int page,int size,Object ...obj){
			List<T> list=new ArrayList<T>();
			Session session=getSession();
			try {
				Query query =session.createQuery(hql);
				if(obj!=null){
					for(int i=0;i<obj.length;i++){
						query.setString(i, obj[i].toString());
					}
				}
				query.setFirstResult((page-1)*size);//�ӵڼ�����ʼ
				query.setMaxResults(size);//ÿ����ʾ����
				list=query.list();
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				session.close();
			}
			return list;
		}
		
		//��ȡ������¼
		public  <T> T queryByUnique(String hql,Object ...obj){
			T object=null;
			Session session=getSession();
			try {		
				Query query=session.createQuery(hql);
				if(obj!=null){
					for(int i=0;i<obj.length;i++){
						query.setString(i, obj[i].toString());
					}
				}
				object=(T) query.uniqueResult();
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				session.close();
			}
			return object;
		}
		//�����¼
		
		public  int queryCount(String hql,Object ...obj){
			int count=0;
			Session session=getSession();
			try {		
				Query query=session.createQuery(hql);
				if(obj!=null){
					for(int i=0;i<obj.length;i++){
						query.setString(i, obj[i].toString());
					}
				}
				count=Integer.valueOf(query.list().get(0).toString());
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				session.close();
			}
			return count;
		}
		public  boolean updateByHql(String hql,Object ...obj){
			boolean flag=false;
			Session session=getSession();
			Transaction tran=session.beginTransaction();
			try {
				Query query = session.createQuery(hql);
				if(obj!=null){
					for(int i=0;i<obj.length;i++){
						query.setString(i, obj[i].toString());
					}
				}
				query.executeUpdate();
				tran.commit();
				flag=true;
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				session.close();
			}
			return flag;
		}
}
