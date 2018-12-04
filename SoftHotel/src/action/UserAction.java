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
	private String name;//��̨login.jsp
	private String pwd;
	private String uname;//ǰ̨login.jsp
	private String upwd;
	private String uemail;//ע��regsiter.jsp
	private String uphone;
	private String mobile;//�֙C��C�a
	
	
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
	//�˳���¼
	public String tuichu(){
	    ActionContext context=ActionContext.getContext();
		Map session= context.getSession();
		session.clear();
		return "tuichu";
	}
	//��̨��¼
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
	
	//ǰ̨��¼
	public String denglu(){
		System.out.println("�����¼");
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
	}//�ж��ֻ����Ƿ����
	public String phone(){
		System.out.println("�����¼");
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
	//�ж��ֻ��Ÿ���֤��ƥ��
	public String phonepwd(){
		System.out.println("�����¼");
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
	
	//������֤��
			private static final long serialVersionUID = 1L;
			//����ƽ̨��ز���
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
				//����6λ��֤��
				String verifyCode = String.valueOf(new Random().nextInt(899999) + 100000);
				user=biz.queryByPhone(mobile);
				if(user!=null){
					biz.queryVerifyCode(verifyCode, mobile);
				}
				
				//���Ͷ���
				ZhenziSmsClient client = new ZhenziSmsClient(apiUrl, appId, appSecret);
				String result = client.send(mobile, "������֤��Ϊ:" + verifyCode + "���gӭ��䛴�����Ƶ�");			
				json = JSONObject.parseObject(result);
				System.out.println("json=="+json);
				if(json.getIntValue("code") != 0){//���Ͷ���ʧ��
					renderData(response, "fail");
					return; 
				}
				//����֤��浽session��,ͬʱ���봴��ʱ��
				//��json��ţ�����ʹ�õ��ǰ����fastjson
				HttpSession session = request.getSession();
				json = new JSONObject();
				json.put("mobile", mobile);
				json.put("verifyCode", verifyCode);
				json.put("createTime", System.currentTimeMillis());
				// ����֤�����SESSION
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
	//��ҳ��
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

	//ע��
	public String regsiter(){
		if(uname==null){
			return "regsiter";
		}else{
			return "regsiter";
		}
	
	}
	//ע����֤(��֤�û���)
	public String validate(){
		System.out.println("����validate");
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
	//�ύע��
	public String tijiaozhuce(){
		biz.add(new User(uname,upwd,uphone,uemail));
		return "regsiter";
	}
	//������Ϣ���ж���������
	public String check(){
		System.out.println(pwd);
		System.out.println(name);
		System.out.println("����");
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
	//������Ϣ���޸�����
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
