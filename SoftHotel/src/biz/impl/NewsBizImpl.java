package biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.NewsDao;
import entity.News;
import biz.NewsBiz;

@Service
public class NewsBizImpl implements NewsBiz {
	@Resource
	private NewsDao newsDao;
	@Override
	public News queryById(int id) {
		return newsDao.queryById(id);
	}
	@Override
	public List<News> queryByTime(News news, Object... obj) {
		String hql = "FROM News WHERE newType = '店面活动' ORDER BY relTime DESC";
		return newsDao.queryList(hql, 0, 9);
	}
	@Override
	public List<News> queryList(News news, Object... obj) {
		String hql1 = "select count(*) from News WHERE newType = '店面活动'";
		String hql2 = "from News WHERE newType = '店面活动'";
		int page = news.getPage();
		int size = news.getSize();
		int count = newsDao.queryCount(hql1);
		count = count%size==0?(count/size):(count/size+1);
		if(count==0){
			return null;
		}
		page = page < 1?1:page;
		page = page > count?count:page;
		
		news.setPage(page);
		news.setSize(size);
		news.setPagecount(count);
		return newsDao.queryList(hql2, page, size, obj);
	}
	@Override
	public int queryCount(News news, Object... obj) {
		String hql = "select count(*) from News WHERE newType = '店面活动'";
		return newsDao.queryCount(hql, obj);
	}
	@Override
	public boolean addNews(News news) {
		return newsDao.addNews(news);
	}
	@Override
	public boolean delete(News news) {
		return newsDao.delete(news);
	}
	@Override
	public List<News> queryType(News news, Object... obj) {
		String hql = "from News where newType = ?";
		return newsDao.queryType(hql, news.getNewType());
	}
	@Override
	public boolean updateNews(News news) {
		return newsDao.updateNews(news);
	}
	
	
}
