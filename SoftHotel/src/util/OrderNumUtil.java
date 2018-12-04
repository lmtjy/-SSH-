package util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class OrderNumUtil {
 	private static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
	private static String orderTime;
	private static Long orderNum ;
	
	static{
		orderTime = df.format(new Date());// new Date()为获取当前系统时间;
		orderNum = Long.valueOf(getRandomFileName());
	}
	
	public static String getOrderTime() {
		return orderTime;
	}
	
	public static Long getOrderNum() {
		return orderNum;
	}

	public static String getRandomFileName() {

		SimpleDateFormat simpleDateFormat;

		simpleDateFormat = new SimpleDateFormat("yyyyMMdd");

		Date date = new Date();

		String str = simpleDateFormat.format(date);

		Random random = new Random();

		int rannum = (int) (random.nextDouble() * (99999 - 10000 + 1)) + 10000;// 获取5位随机数

		return rannum + str;// 当前时间
	}

}
