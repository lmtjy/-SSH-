package biz;

import java.util.List;

import entity.News;

public interface NewsBiz {
	public News queryById(int id);
	public List<News> queryByTime(News news,Object ...obj);
	public List<News> queryList(News news,Object ...obj);
	public List<News> queryType(News news,Object ...obj);
	public int queryCount(News news, Object... obj);
	public boolean updateNews(News news);
	public boolean addNews(News news);
	public boolean delete(News news);
}
