package dao;

import java.util.List;

import entity.News;

public interface NewsDao {
	public News queryById(int id);
	public List<News> queryList(String hql,int page,int size,Object ...obj);
	public int queryCount(String hql,Object ...obj);
	public List<News> queryType(String hql,Object ...obj);
	public boolean updateNews(News news);
	public boolean addNews(News news);
	public boolean delete(News news);
}
