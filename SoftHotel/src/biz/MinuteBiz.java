package biz;

import entity.Minute;

public interface MinuteBiz {
	public Minute queryById(int id);
	public boolean addMinute(Minute minute);
	public boolean delMinute(Minute minute);
	public boolean update(Minute minute);
}
