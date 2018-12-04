<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="manage/css/pintuer.css">
    <link rel="stylesheet" href="manage/css/admin.css">
    <link rel="stylesheet" href="manage/css/base.css">
    <script src="manage/js/jquery-1.11.3.js"></script>
    <script src="manage/js/skip.js"></script>
    <script src="manage/js/admin.js"></script>
  <script type="text/javascript">
 
  </script>
  </head>
  
  <body>
  <div class="header bg-main">
    <div class="logo margin-big-left fadein-top">
        <h1>
            <!--<img src="../images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />-->
            中软国际大酒店后台管理系统</h1>
    </div>
    <div class="head-l">
        <a class="button button-little bg-green" href="login_index" target="_blank">
            <span class="icon-home"></span> 前台首页
        </a> &nbsp;&nbsp;
        <a class="button button-little bg-red" href="login_login">
            <span class="icon-power-off"></span> 退出登录
        </a>
    </div>
    <div class="admin_detail">
        <span class="aname"></span>
        <span class="atype"></span>
    </div>
</div>
<!--左边导航栏-->
<div>
<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
    <h2><a href="roommanage/room_query?page=1" target="main"><span class="icon-user"></span>客房管理</a></h2>
    <!--<ul style="display:block">-->
        <!--&lt;!&ndash;<li><a href="index.html" target="right"><span class="icon-caret-right"></span>客房状态</a></li>&ndash;&gt;-->
        <!--&lt;!&ndash;<li><a href="index.html"  target="right"><span class="icon-caret-right"></span>添加新客房</a></li>&ndash;&gt;-->
        <!--<li><a href="index.html" target="right"><span class="icon-caret-right"></span>入住信息</a></li>-->
    <!--</ul>-->
    <h2><a href="foods/foods_queryDishByPage" target="main"><span class="icon-pencil-square-o"></span>餐饮管理</a></h2>
    <!--<ul>-->
        <!--<li><a href="dish.html" target="right"><span class="icon-caret-right"></span>查看菜单</a></li>-->
        <!--<li><a href="add_dish.html" target="right"><span class="icon-caret-right"></span>添加新菜单</a></li>-->
    <!--</ul>-->
    <h2><a href="news/news_queryAll" target="main"><span class="icon-pencil-square-o"></span>新闻动态</a></h2>
    <!-- <ul>
        <li><a  href="manage/news.jsp" target="main"><span class="icon-caret-right"></span>查看动态</a></li>
        <li><a href="manage/add_news.jsp" target="main"><span class="icon-caret-right"></span>发布动态</a></li>
    </ul> -->
    <!-- <h2><a href="user.jsp"><span class="icon-pencil-square-o"></span>会员管理</a></h2> -->
    <!--<ul>-->
        <!--<li><a href="" target="right">-->
            <!--<span class="icon-caret-right"></span>查看会员</a>-->
        <!--</li>-->
        <!--<li><a onclick="skip('tpl/dish.html');" target="right">-->
            <!--<span class="icon-caret-right"></span>删除会员</a>-->
        <!--</li>-->
    <!--</ul>-->
    <h2><a href="orders/order_show" target="main"><span class="icon-pencil-square-o"></span>订单管理</a></h2>
    <h2><a href="manage/select_count.jsp" target="main"><span class="icon-pencil-square-o"></span>销量统计</a></h2>
    <!--<ul>-->
        <!--<li><a href="order.html" target="right">-->
            <!--<span class="icon-caret-right"></span>查看所有订单</a>-->
        <!--</li>-->
        <!--<li class="order_wai"><a href="waiting.html" target="right">-->
            <!--<span class="icon-caret-right"></span>待处理订单</a><i class="wait_pro">0</i>-->
        <!--</li>-->
    <!--</ul>-->
    <h2 class="super_admin"><a href="admin.jsp"><span class="icon-pencil-square-o"></span>管理员管理</a></h2>
    <!--<ul>-->
        <!--<li><a href="order.html" target="right">-->
            <!--<span class="icon-caret-right"></span>查看所有管理员</a>-->
        <!--</li>-->
    <!--</ul>-->
    <h2><a href="update_pwd" target="main" ><span class="icon-pencil-square-o" ></span>基本信息</a></h2>
    <!--<ul>i-->
        <!--<li><a onclick="skip('tpl/dish.html');" target="right">-->
            <!--<span class="icon-caret-right"></span>查看信息</a>-->
        <!--</li>-->
        <!--<li><a onclick="skip('tpl/update_pwd.html');" target="right">-->
            <!--<span class="icon-caret-right"></span>修改密码</a>-->
        <!--</li>-->
    <!--</ul>-->
</div>
<!--右边面包屑导航-->

<ul class="bread">
    <li><a href="../../../dll/index.html" target="right" class="icon-home"> 首页</a></li>
    <li><a href="#/start" id="a_leader_txt">客房状态</a></li>
</ul>
<div style="position: absolute; left: 191px; right: 20px; ">

<iframe src="" scrolling="no" border="none" name="main" width="100%" height="800px" style="margin:0;">

        
</iframe>
</div>
</div>
  </body>
</html>
