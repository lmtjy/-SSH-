package dao;

import entity.Minute;

public interface MinuteDao {
	public Minute queryById(int id);
	public boolean addMinute(Minute minute);
	public boolean delMinute(Minute minute);
	public boolean update(Minute minute);
}
