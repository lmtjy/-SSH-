package biz;

import java.util.List;

import entity.Recruit;

public interface RecruitBiz {
	public List<Recruit> queryAll();
	public int queryCount(Object ...obj);
	public boolean add(Recruit recruit);
	public boolean delAll();
}
