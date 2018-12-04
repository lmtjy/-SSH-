package biz.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import biz.MyOrderBiz;
import dao.MyOrderDao;
import dao.RoomAddCardDao;
import entity.Foods;
import entity.HotelCart;
import entity.HotelCartDetails;
import entity.HotelOrder;
import entity.HotelOrderDetail;
import entity.Rooms;
import entity.User;

@Service
public class MyOrderBizImpl implements MyOrderBiz {
	@Resource
	private MyOrderDao myOrderDao;
	@Resource
	private RoomAddCardDao roomAddCardDao;

	@Override
	public Foods queryByFid(int fid) {
		return myOrderDao.queryByfid(fid);
	}

	@Override
	public Rooms queryByRid(int rid) {
		return myOrderDao.queryByrid(rid);
	}

	@Override
	public List<HotelCartDetails> queryOrder(String uname) {
		User user = roomAddCardDao.queryByName(uname);
		HotelCart hotelCart = roomAddCardDao.queryByuid(user.getUid());
		return myOrderDao.queryByCid(hotelCart.getCid());
	}

	@Override
	public boolean confirmOrder(String uname, HotelOrder hot) {
		// 创建订单详情表
		HotelOrderDetail hod = new HotelOrderDetail();
		// 根据用户名查询用户编号
		User user = roomAddCardDao.queryByName(uname);
		hot.setUid(user);
		// 根据用户编号查询cid
		int cid = roomAddCardDao.queryByuid(user.getUid()).getCid();
		// 向订单表插入一行记录，得到自增的订单编号
		myOrderDao.confirmOrder(hot);
		HotelOrder hotelOrder = roomAddCardDao.queryById(user.getUid());
		System.out.println(hotelOrder);
		// 循环执行：向订单详情表中插入记录
		List<HotelCartDetails> list = myOrderDao.queryByCid(cid);
		if (list != null) {
			for (HotelCartDetails hotelCartDetails : list) {
				hod.setCount(hotelCartDetails.getCount());
				hod.setOid(hotelOrder);
				hod.setType(hotelCartDetails.getType());
				hod.setProductId(hotelCartDetails.getProductId());
				roomAddCardDao.insertOrder(hod);// 插入数据
				roomAddCardDao.deleteCard(hotelCartDetails);// 删除数据
			}
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Map<String, List<Object>> queryHotelOrder(String uname) {
		Map<String,List<Object>> data = new HashMap<String, List<Object>>();
		//根据用户名查询用户编号
		User user = roomAddCardDao.queryByName(uname);
		//根据用户编号查询订单
		List<Object> orderlist = roomAddCardDao.queryOid(user.getUid());
		//遍历每个订单对象，添加一个新的属性:productList
		List<Object> productList = new ArrayList<Object>();
		List<HotelOrderDetail> hotList = new ArrayList<HotelOrderDetail>();
		HotelOrderDetail hot = null;
		for (Object hotelOrder : orderlist) {
			List<HotelOrderDetail> list = roomAddCardDao.queryByOid(((HotelOrder) hotelOrder).getOid());
			for (HotelOrderDetail hotelOrderDetail : list) {
				hot = new HotelOrderDetail();
				hot.setProductId(hotelOrderDetail.getProductId());
				hot.setType(hotelOrderDetail.getType());
				hotList.add(hot);
			}
		}
		for (HotelOrderDetail hotelOrderDetail : hotList) {
			if(hotelOrderDetail.getType()==1){
				productList.add(myOrderDao.queryByfid(hotelOrderDetail.getProductId()).getFimg());
			}else if(hotelOrderDetail.getType()==2){
				productList.add(myOrderDao.queryByrid(hotelOrderDetail.getProductId()).getRpic());
			}
		}
		data.put("orderlist", orderlist);
		data.put("productList", productList);
		return data;
	}

}
