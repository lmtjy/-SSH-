package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import util.HibernateUtil;
import dao.NewsDao;
import entity.News;

@Repository
public class NewsDaoImpl implements NewsDao {
	@Resource
	private HibernateUtil util;
	@Override
	public News queryById(int id) {
		return util.get(News.class, id);
	}
	@Override
	public List<News> queryList(String hql, int page, int size,Object ...obj) {
		return util.queryHqlByPage(hql, page, size, obj);
	}
	@Override
	public int queryCount(String hql, Object... obj) {
		return util.queryCount(hql, obj);
	}
	@Override
	public boolean addNews(News news) {
		return util.add(news);
	}
	@Override
	public boolean delete(News news) {
		return util.delete(news);
	}
	@Override
	public List<News> queryType(String hql, Object... obj) {
		return util.queryHql(hql, obj);
	}
	@Override
	public boolean updateNews(News news) {
		return util.update(news);
	}
}
