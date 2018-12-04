package action;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;

import entity.Minute;
import entity.News;
import entity.Recruit;
import biz.MinuteBiz;
import biz.NewsBiz;
import biz.RecruitBiz;

@Controller
public class NewsAction implements ModelDriven<News> {
	@Resource
	private NewsBiz newsBiz;
	@Resource
	private MinuteBiz minuteBiz;
	@Resource
	private RecruitBiz recruitBiz;
	private News news = new News();
	private Minute minute = new Minute();
	private Recruit recruit = new Recruit();
	private List<Recruit> recruits;
	private List<News> list;
	private List<News> newlist;
	private List<News> titlelist;
	private int count;
	private String msg;
	private String delMany[];
	private File myfile;
	private String savePath;
	private String myfileFileName;
	public String queryAll(){
		list = newsBiz.queryList(news);
		return "newsList";
	}
	public String queryNews(){
		newlist = newsBiz.queryByTime(news);
		count = newlist.size()/3;
		news.setNewType("主题");
		titlelist = newsBiz.queryType(news);
		news.setNewType("招聘");
		list = newsBiz.queryType(news);
		titlelist.add(list.get(0));
		titlelist.get(0).setPagecount(newsBiz.queryCount(news));
		titlelist.get(1).setPagecount(recruitBiz.queryCount());
		return "time";
	}
	public String queryMinute(){
		if(news.getNewId()!=0){
			news = newsBiz.queryById(news.getNewId());
			news.setChose("2");
		} else if (news.getNewType().equals("招聘活动")){
			recruits = recruitBiz.queryAll();
			news.setNewType("招聘");
			list = newsBiz.queryType(news);
			news = list.get(0);
			news.setPagecount(recruitBiz.queryCount());
			news.setChose("3");
		} else if (news.getNewType().equals("店面活动")){
			list = newsBiz.queryType(news);
			news.setChose("1");
		}
		return "minute";
	}
	public String beforeadd(){
		if(news.getChose().equals("3")){
			news.setNewType("招聘");
			list = newsBiz.queryType(news);
			recruits = recruitBiz.queryAll();
			count = recruitBiz.queryCount();
		}
		return "newsAdd";
	}
	public String add(){
		if(news.getChose().equals("3")){
			minute.setMid(17);
			minuteBiz.delMinute(minute);
			minute=news.getMid();
			minute.setNewId(news);
			recruitBiz.delAll();
			newsBiz.updateNews(news);
			System.out.println(recruits);
			for (Recruit r : recruits) {
				if(r!=null){
					System.out.println(r);
					recruitBiz.add(r);
				}
			}
			return queryAll();
		}
		if(news.getChose().equals("1")){
			news.setNewType("主题");
		}
		if(addFile().equals("true")){
			minute=news.getMid();
			minute.setNewId(news);
			if(newsBiz.addNews(news)){
				msg = "添加成功!";
				return queryAll();
			} else {
				msg = "添加失败!";
				return "newsAdd";
			}
		}else{
			System.out.println(msg);
			return "newsAdd";
		}
	}
	public String addFile(){
		String path = ServletActionContext.getServletContext().getRealPath(savePath);
		File filePath = new File(path);
		if(!filePath.exists()){
			filePath.mkdir();
		}
		if(myfile==null || myfile.length()<=0){
			msg = "文件内容错误";
			return msg;
		}
		//myfileFileName = new Date().getTime()+"_"+myfileFileName;
		try {
			FileUtils.copyFile(myfile, new File(path, myfileFileName));
			news.setNewImg("images/"+myfileFileName);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "异常";
			return msg;
		}
	}
	public String delete(){
		if(newsBiz.delete(news)){
			msg = "删除成功!";
			return queryAll();
		} else {
			msg = "删除失败!";
			return queryAll();
		}
	}
	public String beforeupdate(){
		System.out.println(news);
		news = newsBiz.queryById(news.getNewId());
		news.setMid(minuteBiz.queryById(news.getNewId()));;
		System.out.println(news);
		return "update";
	}
	public String update(){
		minute.setMid(news.getNewId());
		minuteBiz.delMinute(minute);
		if(myfile!=null){
			if(addFile().equals("true"));
			else return "update";
		}
		minute=news.getMid();
		minute.setNewId(news);
		if(newsBiz.updateNews(news)){
			msg = "修改成功!";
			return queryAll();
		} else {
			msg = "修改失败!";
			return queryAll();
		}
	}
	public String deleteMany(){
		for (String del : delMany) {
			int id = Integer.valueOf(del);
			news.setNewId(id);
			newsBiz.delete(news);
		}
		return queryAll();
	}
	
	
	
	
	
	
	
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public List<Recruit> getRecruits() {
		return recruits;
	}
	public void setRecruits(List<Recruit> recruits) {
		this.recruits = recruits;
	}
	public Recruit getRecruit() {
		return recruit;
	}
	public void setRecruit(Recruit recruit) {
		this.recruit = recruit;
	}
	public List<News> getTitlelist() {
		return titlelist;
	}
	public void setTitlelist(List<News> titlelist) {
		this.titlelist = titlelist;
	}
	public List<News> getNewlist() {
		return newlist;
	}
	public void setNewlist(List<News> newlist) {
		this.newlist = newlist;
	}
	public Minute getMinute() {
		return minute;
	}
	public void setMinute(Minute minute) {
		this.minute = minute;
	}
	public String getMyfileFileName() {
		return myfileFileName;
	}
	public void setMyfileFileName(String myfileFileName) {
		this.myfileFileName = myfileFileName;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public File getMyfile() {
		return myfile;
	}
	public void setMyfile(File myfile) {
		this.myfile = myfile;
	}
	public String[] getDelMany() {
		return delMany;
	}
	public void setDelMany(String[] delMany) {
		this.delMany = delMany;
	}
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	public List<News> getList() {
		return list;
	}
	public void setList(List<News> list) {
		this.list = list;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	@Override
	public News getModel() {
		return news;
	}
}
