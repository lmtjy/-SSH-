package action;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.opensymphony.xwork2.ActionContext;
import com.zhenzi.sms.ZhenziSmsClient;

import entity.User;
import biz.UserBiz;

@Controller
public class UserAction  {
	@Resource
	private UserBiz biz;
	private List<User> list;
	private User user;
	private String msg;
	private String name;//后台login.jsp
	private String pwd;
	private String uname;//前台login.jsp
	private String upwd;
	private String uemail;//注册regsiter.jsp
	private String uphone;
	private String mobile;//手機驗證碼
	
	
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	private String data;
	
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUphone() {
		return uphone;
	}
	public void setUphone(String uphone) {
		this.uphone = uphone;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public List<User> getList() {
		return list;
	}
	public void setList(List<User> list) {
		this.list = list;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	//退出登录
	public String tuichu(){
	    ActionContext context=ActionContext.getContext();
		Map session= context.getSession();
		session.clear();
		return "tuichu";
	}
	//后台登录
	public String login(){
		System.out.println(name);
		System.out.println(pwd);
		if(name==null){
			return "false";
		}else{	
		user=biz.login(name, pwd);	
		if(user!=null){	
			ActionContext context=ActionContext.getContext();
			Map session=context.getSession();
			session.put("uuname", name);
			session.put("uupwd", pwd);
			msg="1";
			return "ajax";
		}else{			
			msg="0";
			return "ajax";
		}
		}
	}
   public String updatepwd(){
		
	return "updatepwd";
	}
	
	//前台登录
	public String denglu(){
		System.out.println("进入登录");
		System.out.println(uname);
		System.out.println(upwd);
		if(uname==null){		
			return "denglufalse";
		}		
		else{
		user=biz.login(uname, upwd);	
		if(user!=null){		
			System.out.println("dengluok");
		    ActionContext context=ActionContext.getContext();
			Map session= context.getSession();
			session.put("uname", uname);
			/*HttpSession session=ServletActionContext.getRequest().getSession();
			session.setAttribute("uname", uname);*/
			
			msg="1";
			return "ajax";
		}else{
			System.out.println("denglufalse");
			msg="0";
			return "ajax";			
		}		
	}
	}//判断手机号是否存在
	public String phone(){
		System.out.println("进入登录");
		System.out.println(uphone);
		System.out.println(upwd);
		if(uphone==null){			
			return "denglufalse";
		}		
		else{
		user=biz.queryByPhone(uphone);
		if(user!=null){		
			System.out.println("dengluok");
			msg="1";
			return "ajax";
		}else{
			System.out.println("denglufalse");
			msg="0";
			return "ajax";			
		}	
	}
	}
	//判断手机号跟验证码匹配
	public String phonepwd(){
		System.out.println("进入登录");
		System.out.println(uphone);
		System.out.println(upwd);
		if(uphone==null){			
			return "denglufalse";
		}		
		else{
		user=biz.querypwd(upwd, uphone);
		if(user!=null){	
			String uname=user.getUname();
			System.out.println(uname);
			 ActionContext context=ActionContext.getContext();
			 Map session= context.getSession();
			 session.put("uname", uname);
			System.out.println("dengluok");
			msg="1";
			return "ajax";
		}else{
			System.out.println("denglufalse");
			msg="0";
			return "ajax";			
		}	
	}
	}
	
	//发送验证码
			private static final long serialVersionUID = 1L;
			//短信平台相关参数
			private String apiUrl = "http://sms_developer.zhenzikj.com";
			private String appId = "100184";
			private String appSecret = "9ebed8e6-3247-4e3c-bdcd-1f5afd34071d";
			public void sendMassage(){
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpServletResponse response = ServletActionContext.getResponse();
				try {			
				String mobile = request.getParameter("mobile");
				System.out.println("mobile=="+mobile);
				JSONObject json = null;
				//生成6位验证码
				String verifyCode = String.valueOf(new Random().nextInt(899999) + 100000);
				user=biz.queryByPhone(mobile);
				if(user!=null){
					biz.queryVerifyCode(verifyCode, mobile);
				}
				
				//发送短信
				ZhenziSmsClient client = new ZhenziSmsClient(apiUrl, appId, appSecret);
				String result = client.send(mobile, "您的验证码为:" + verifyCode + "，歡迎登錄大利來酒店");			
				json = JSONObject.parseObject(result);
				System.out.println("json=="+json);
				if(json.getIntValue("code") != 0){//发送短信失败
					renderData(response, "fail");
					return; 
				}
				//将验证码存到session中,同时存入创建时间
				//以json存放，这里使用的是阿里的fastjson
				HttpSession session = request.getSession();
				json = new JSONObject();
				json.put("mobile", mobile);
				json.put("verifyCode", verifyCode);
				json.put("createTime", System.currentTimeMillis());
				// 将认证码存入SESSION
				request.getSession().setAttribute("verifyCode", json);
				System.out.println("json===="+json);
				renderData(response, "success");
				return ;
			} catch (Exception e) {
				e.printStackTrace();
			}
			renderData(response, "fail");
				
			}
			protected void renderData(HttpServletResponse response, String data){
				try {
					response.setContentType("text/plain;charset=UTF-8");
					response.getWriter().write(data);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
	//跳页面
	public String index(){
		return "index";
	}
	public String about(){
		return "about";
	}
	public String league(){
		return "league";
	}
	public String login2(){
		return "ok";
	}
	public String login3(){
		return "false";
	}

	//注册
	public String regsiter(){
		if(uname==null){
			return "regsiter";
		}else{
			return "regsiter";
		}
	
	}
	//注册验证(验证用户名)
	public String validate(){
		System.out.println("进入validate");
		System.out.println(uname);	
				
			User u=biz.queryByName(uname);
			System.out.println(u);
			if(u!=null){
				Gson gson = new Gson();
				msg =  gson.toJson("cunzai");
				System.out.println(msg);
				
				/*msg="cunzai";*/
				return "ajax";
			}else{
				Gson gson = new Gson();
				msg =  gson.toJson("bucunzai");
				return "ajax";
			}
		
	}
	//提交注册
	public String tijiaozhuce(){
		biz.add(new User(uname,upwd,uphone,uemail));
		return "regsiter";
	}
	//基本信息，判断输入密码
	public String check(){
		System.out.println(pwd);
		System.out.println(name);
		System.out.println("进入");
		User u=biz.login(name, pwd);
		if(u!=null){
			System.out.println(u);
			msg="1";
			return "ajax";
		}else{
			msg="0";
			return "ajax";
		}
	}
	//基本信息，修改密码
	public String pwd(){
		System.out.println(name);
		System.out.println(pwd);
		boolean u=biz.updatepwd(pwd, name);
		System.out.println(u);
		if(u){
		msg="1";
		return "ajax";
		}else{
			msg="0";
			return "ajax";
		}
	}
}
