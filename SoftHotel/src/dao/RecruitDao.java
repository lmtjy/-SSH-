package dao;

import java.util.List;

import entity.Recruit;

public interface RecruitDao {
	public List<Recruit> queryAll();
	public int queryCount(String hql,Object ...obj);
	public boolean add(Recruit recruit);
	public boolean delAll(Recruit recruit);
}
