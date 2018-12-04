package action;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;

import entity.Foods;
import entity.HotelCart;
import entity.User;
import biz.FoodsBiz;

@Controller
public class FoodsAction {
	@Resource
	private FoodsBiz fbiz;
	private Foods foods;
	private HotelCart hc;
	private User user;
	private List<Foods> list;
	private String msg;
	private int page;
	private int shang;
	private int xia;
	private int pagecount;
	private String savePath;
	private String myfileFileName;
	private File myfile;
    private String uname;
	
	
	public HotelCart getHc() {
		return hc;
	}
	public void setHc(HotelCart hc) {
		this.hc = hc;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Foods getFoods() {
		return foods;
	}
	public void setFoods(Foods foods) {
		this.foods = foods;
	}
	public List<Foods> getList() {
		return list;
	}
	public void setList(List<Foods> list) {
		this.list = list;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
	
	public File getMyfile() {
		return myfile;
	}
	public void setMyfile(File myfile) {
		this.myfile = myfile;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public String getMyfileFileName() {
		return myfileFileName;
	}
	public void setMyfileFileName(String myfileFileName) {
		this.myfileFileName = myfileFileName;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getShang() {
		return shang;
	}
	public void setShang(int shang) {
		this.shang = shang;
	}
	public int getXia() {
		return xia;
	}
	public void setXia(int xia) {
		this.xia = xia;
	}
	public int getPagecount() {
		return pagecount;
	}
	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}
	
	
	public String queryType(){

		list=fbiz.queryByHQL(foods.getType());
		return "foodslist";
	}
/*
	public String query1(){
		System.out.println(foods.getType());
		list=fbiz.queryByHQL(foods.getType());
        System.out.println(list);
        Gson gson = new Gson();
		msg=  gson.toJson(list);
		return "foodsajax";
	}
	*/
	public String queryByPage(){
		int size=4;
		pagecount = fbiz.getCount();		 
		 pagecount = pagecount%size==0?pagecount/size:(pagecount/size)+1;
		 page = page<1?1:page;
		 page = page>pagecount?pagecount:page;
		 shang = page-1<1?1:page-1;
		 shang = shang>pagecount?pagecount:shang;
		 xia = page+1<1?1:page+1;
		 xia = xia>pagecount?pagecount:xia;
		list = fbiz.queryByHQLPage(page);
		return "foodslist";
		
	}
	
	public String queryDishByPage(){
		int size=4;
		pagecount = fbiz.getCount();		 
		 pagecount = pagecount%size==0?pagecount/size:(pagecount/size)+1;
		 page = page<1?1:page;
		 page = page>pagecount?pagecount:page;
		 shang = page-1<1?1:page-1;
		 shang = shang>pagecount?pagecount:shang;
		 xia = page+1<1?1:page+1;
		 xia = xia>pagecount?pagecount:xia;
		list = fbiz.queryByHQLPage(page);
		return "dish";
		
	}
	
	public String getFoodsDetail(){
		foods=fbiz.get(foods.getFid());
		
		Gson gson = new Gson();
		msg=  gson.toJson(foods);
		return "foodsajax";
		/* 
		Foods foodsmsg=fbiz.get(foods.getFid());		
		Gson gson = new Gson();
		msg=  gson.toJson(foodsmsg);
		return "foodsajax";
		*/
	}
	
	public String add(){
		String path = ServletActionContext.getServletContext().getRealPath(savePath);
		File filePath = new File(path);
		if(!filePath.exists()){
			filePath.mkdir();
		}
		foods.setFimg("images/meal/food/"+myfileFileName);
		try {
			FileUtils.copyFile(myfile, new File(path, myfileFileName));
		} catch (Exception e) {
			msg = "异常";
			return "adddish";
		}
		boolean flag=fbiz.add(foods);
		if(flag){
			msg="添加成功";
			return queryDishByPage();
		}
		else{
			msg = "添加失败!";
			return "adddish";
		}
		/*
		if(myfile!=null&&myfile.length()>0){
			myfileFileName = new Date().getTime()+"_"+myfileFileName;
			try {
				FileUtils.copyFile(myfile, new File(path, myfileFileName));
				foods.setFimg("upload/"+myfileFileName);
			} catch (Exception e) {
				e.printStackTrace();
				msg = "异常";
				return "adddish";
			}
		}else{
			msg = "添加失败!";
			return "adddish";
		}		
		msg = "添加成功!";
		return "adddish";
		*/
	}
	public String update(){

		foods=fbiz.get(foods.getFid());
		return "adddish";
	}
	
	public String toupdate(){
		String path = ServletActionContext.getServletContext().getRealPath(savePath);
		File filePath = new File(path);
		if(!filePath.exists()){
			filePath.mkdir();
		}
		foods.setFimg("images/meal/food/"+myfileFileName);
		foods.setFid(foods.getFid());
		try {
			FileUtils.copyFile(myfile, new File(path, myfileFileName));
		} catch (Exception e) {
			msg = "异常";

		}
		System.out.println("接收到的数据:"+foods);
		boolean flag=fbiz.update(foods);
		if(flag){
			msg="修改成功";
			
		}
		else{
			msg = "修改失败!";

		}
		return queryDishByPage();
	}
	
	public String delete(){
		boolean flag2=fbiz.delete(foods.getFid());
		System.out.println("通过jsp传来的fid删除:"+foods.getFid());
		System.out.println("有没有删除:"+flag2);
		return queryDishByPage();
	}
	
	
}
