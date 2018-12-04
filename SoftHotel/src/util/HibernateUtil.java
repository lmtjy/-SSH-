package util;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistryBuilder;
import org.springframework.stereotype.Component;
@Component
public class HibernateUtil {
	@Resource(name="sessionFactory")
	private  SessionFactory factory;
	
	public  SessionFactory getFactory(){
		return factory;
	}
	public  Session getSession(){
		return factory.openSession();
	}
	public  boolean add(Object obj){
		boolean flag=false;
		Session session=getSession();
		try {
			Transaction tran=session.beginTransaction();
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
	public  boolean delete(Object obj){
		boolean flag=false;
		Session session=getSession();
		try {
			Transaction tran=session.beginTransaction();
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
	public  boolean update(Object obj){
		boolean flag=false;
		Session session=getSession();
		try {
			Transaction tran=session.beginTransaction();
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
	public  <T> T get(Class cla,int id){
		T obj=null;
		Session session=getSession();
		try {		
			obj=(T) session.get(cla, id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		return obj;
	}
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
}
