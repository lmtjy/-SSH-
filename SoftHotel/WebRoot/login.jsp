<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<title>Document</title>
  <link href="css/index.css" type="text/css" rel="Stylesheet" />
  <link href="css/login.css" type="text/css" rel="Stylesheet" />
<style type="text/css">
#denglu{
background: rgb(221, 76, 64);
padding: 9px;
border:0px;
width: 310px;
}

</style>
   <script language="javascript">
			var code; //在全局 定义验证码
			window.onload=function(){
			      //do something		
				 code = "";
				 var codeLength =4;//验证码的长度
				 var selectChar = new Array(0,1,2,3,4,5,6,7,8,9,'a','b','c','d','e','f','g','h','i','j','k',
				         'l','m','n','o','p','q','r','s','t','u','v','w','x','y','z');//所有候选组成验证码的字符
				        
				 for(var i=0;i<codeLength;i++)
				 {     
				  var charIndex =Math.floor(Math.random()*36);
				  code +=selectChar[charIndex];     
				 }
				// 设置验证码的显示样式，并显示
				 document.getElementById("discode").style.fontFamily=" SimSun";  //设置字体
				 document.getElementById("discode").style.letterSpacing="0px";  //字体间距
				 document.getElementById("discode").style.color="#DD4C40";   //字体颜色
				 document.getElementById("discode").style.fontSize="20px";//字体大小
				 document.getElementById("discode").innerHTML=code;      // 显示
				
			};
			function createCode()
			{ 
				window.onload();
			}
			
		/* 	function validate()
			{//验证验证码输入是否正确
			     var val1=document.getElementById("t1").value;
			     var val2=code;			    
			     if(val1==''){
			    	 $("#validate").html("请输入验证码"); 
			         document.getElementById('t1').value="";
			         }
			     else if(val1!=val2 ){
			    	 $("#validate").html("验证码错误"); 
			    	 document.getElementById('t1').value="";
			    	 window.onload();
			    	 
			     }else {
			    	 $("#validate").html(""); 
			     }
			    
			    } */
			     function  mobile(){
			    	var phone=document.getElementById("phone").value;
			    	$.post("login_phone",{uphone:phone},function(data){
			    		var str = $(data).html(); 
						data = JSON.parse(str);
			    		//alert(data);
			    		if(data==0){
			    			$("#phone_validate").html("此手机号没有注册");
			    		}else{
			    			$("#phone_validate").html("");
			    		}
			    	});
			    
			    }
		
      </script>
 </head>
 <body>

       <header>
	          <div>
				<a href="login_index"><img src="images/logo-2.jpg" alt=""></a> <span>会员登录</span>
			  </div>

	   </header>
       <section>
	        <div class="left">
			    <img src="images\index.jpg" alt="">
			</div>
			<div class="login">
			     <!--二维码小图标-->
			     <span></span>
				 <div id="check_box">
                     <input type="radio" name="loginType" checked="checked" class="method_normal">普通登录
					 <input type="radio" name="loginType"  class="method_phone">手机动态密码登录
				 </div>
				 <!-- <p id="alert">请输入账户信息</p> -->
				 <!--普通登录-->
         
				 <div id="normal">
						 <ul id="nor_log">
							<li class="name">
							   <input name="uname" type="text" id="uname1" placeholder="请输入用户名">
							   <span class="icon"></span>
							</li>
							<li class="pwd">
							   <input  name="upwd" type="password" id="upwd1" placeholder="密码">
							   <span class="icon"></span>
							</li>
						 </ul>						         					
					   <div class="codes">
							 <input type="text"  id="t1" name= "t1" class="blur" placeholder="请输入验证码"   style="width: 88px"/>
							 
							  <input type="button" value="看不清换一张" class="c" style="height:32px;width:90px;color:#FFFF;background-color:#DD4C40;border:0px" onClick="createCode()">
							
							 <span id="discode" style="margin-left: 0px"></span><span id="validate" style="font-size: 12px" ></span>
						 </div>
						 <div class="cookie">
						 <!-- 等于0没被选中 -->
							<input type="checkbox"  id="rmbuser" onclick="saveuserinfo()"  >一周内记住我
							<!-- <a href="">忘记密码</a> -->
						 </div>
				 </div>
				 <!--手机电话登录-->
			     <div id="phone_login">
				     <div class="phone">
					     <div>中国大陆+86<span></span></div>
						 <input type="text"  name="phone" id="phone" placeholder="请输入手机号" onblur="mobile()">
					 </div>
					 <div class="pwd">
					    <input type="text"  name="pwd" id="pwd" placeholder="请输入动态密码" style="width: 115px" >
						<button type="button" class="sendVerifyCode" style="height:31px;width:185px;color:#FFFF;background-color:#DD4C40;border:0px;margin-left: 10px">获取动态密码</button>
						
					 </div>
					 <span id="phone_validate"></span>
					 <!-- <input type="checkbox" name="" id="">记住我 -->
				 </div>
				
				<div class="log" id="bt_login">
				 登录
				 </div>
		
			     <div class="other" style="padding-bottom: 0px">
				    其他账号登录
					<a href="">qq</a>
					<a href="">支付宝</a>
					<a href="">新浪微博</a>
					<a href="">人人网</a>
				 </div>
			</div>
			<div class="reg">
			   <a href="regsiter">立即注册 &gt;&gt;</a>
			</div>
	   </section>
       <footer class="clear">
	       <p class="signs">
		      <a class="ipa" href=""><span></span>iPhone / iPad</a>
		      <a class="android" href=""><span></span>Android</a>
		      <a class="windows" href=""><span></span>Windows</a>
		      <a class="phone" href=""><span></span>其他手机端</a>
		   </p>
		   <p>
		      <a href="">关于我们</a>|
			  <a href="">加盟大利来</a>|
			  <a href="">代理合作</a>|
			  <a href="">广告合作</a>|
			  <a href="">联系我们</a>
		   </p>
	   </footer>
	  <script src="js/jquery-1.11.3.js"></script>
	  <script src="js/jquery.cookie.js"></script>
	  <script src="js/login.js"></script>
 </body>
</html>
