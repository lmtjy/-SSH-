<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'header.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
<script type="text/javascript">
/* function logincancel(){
	var uname="${uname }";
	if(uname){
		  location.href = 'login_tuichu';
	}else
		{
		location.href='login_denglu';
		}
} */
 
</script>
  </head>
  
  <body>
     <header id="header">
	         <div id="head_main">
			     <!--左侧菜单-->
			     <p class="lf">您好，欢迎来到大利来酒店--<b>官网预定享最优惠价格保证</b></p>
			     <a href="login_login3" class="go_manage">后台管理</a>
                 <!--右侧菜单-->
                 <ul class="memu">
				     <li class="welcome"><a href="#">欢迎来到大利来</a></li>
					 <li><a href="#">|论坛|</a></li>
					 <li><a href="#">帮助中心|</a></li>
					 <li><a href="#">English</a></li>
				 </ul>
			 </div>
	  </header>
	  <div id="b_logo">
	      <div id="logo">
			 <!--logo图-->
			 <div class="_logo">
				 <img src="images/logo-1.jpg">
			 </div>
			
			<ul class="call_info">
						<li class="txt">
						   酒店预订热线
						</li>
						<li>
						   <b></b>4008-802-802
						</li>
						<li class="txt">
						   加盟热线
						</li>
						<li>
						   <b></b>15158464250
						</li>
			 </ul>
	     </div>
	  
	  </div>
	   

   <nav id="nav">
	        <!--主要的导航-->
	        <div>
			   <!--导航-->
			   <ul class="the_nav">
				  <li class="core1"><a href="login_index"><span>首页</span></a></li>
				  <li class="core2">
					   <a href="room/room_queryRooms"><span>酒店预定</span> <b class="top_choise"></b></a>
					   <!--弹出菜单-->
					  <!--  <ul id="sub_box">
						  <li><a  href="">列表预订</a></li> 
					   </ul> -->
				  </li>
				  <li class="core3">
				       <a href="foods/foods_queryByPage?page=1"><span>餐饮美食</span><b class="top_choise"></b></a>
					   <!-- <ul id="sub_box">
						  <li><a  href="">所有菜单</a></li> 
						  <li><a  href="">我的订单</a></li>
						  
					   </ul> -->
				  </li>
				  <li class="core4">
				      <a href="news/news_queryNews"><span>最新资讯</span><b class="top_choise"></b></a>
					 <!--  <ul id="sub_box">
						  <li><a  href="">店面活动</a></li> 
						  <li><a  href="">招聘活动</a></li>
					   </ul> -->
				  </li>
				  <li class="core5">
				      <a href="league"><span>招商加盟</span></a>
				  </li>
				  <li class="core6">
				      <a href="about"><span>关于我们</span><b class="top_choise"></b></a>
					   <ul id="sub_box"> 
						  <li><a  href="about">员工动态</a></li>
					   </ul>
				  </li>
			   </ul>
			   <!--我的账户-->
			     <input type="hidden" id="tuichu" name="uname" value="${uname }"/>
			   <ul class="my_account" id="denglu">
						  <li class="login"><a href="javascript:logincancel()">登录|</a>
						  </li>
						  <li><a href="regsiter">注册</a></li>
						  <li class="cart">
							  <a href="#"><i></i><span class="account">我的账号</span><b class="top_choise"></b></a>
							  <!--弹出选择-->
							  <ul id="sub_msg">
								   <li><a href="room/myorder_toMyorder">我的订单</a></li>
								  
							  </ul>
						  </li>
			   </ul>
			  
		   <div>
	  </nav>
	  	  
	  <div id="top"><a href="#">^</a></div>
	
  </body>
</html>
