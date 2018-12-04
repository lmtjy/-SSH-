<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'reservation.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link href="css/reservation.css" type="text/css" rel="Stylesheet" />
<link href="css/index.css" type="text/css" rel="Stylesheet" />

<link rel="stylesheet" href="jquery-ui-1.12.1/jquery-ui.css">
</head>
<body>

	<!--头部-->
	<div id="c_header"></div>
	<!--主体内容-->
	<section>
	<div id="subject">
		<img src="images\hotel\subject01.jpg" alt="">
		<!--遮罩-->
		<ul class="shade_mag">
			<li class="hover"><img src="images\hotel\s_02.png" alt=""></li>
			<li><img src="images\hotel\s_01.png" alt=""></li>
		</ul>
		<!---预订菜单框-->
		<div class="schedule_box">
			<p>酒店预订</p>
			<ul>
				<li><input type="text" value="入住时间" name="invite"><span></span></li>
				<li><input type="text" value="离店时间" name="deptime"><span></span></li>
				<li><input type="text" value="关键词"></li>
				<li><a href="">查询并预订</a></li>
			</ul>
		</div>
	</div>


	<!----> <!---预订菜单--->
	<div id="due_menu">
		<!--关于-->
		<div class="about">
			<div>
				<p>舒适</p>
				360°
				自由睡超级大床是大利来送给出行在外的商旅客人最好的睡眠礼物。纯天然乳胶床垫具有高弹性、无噪音、无震动的特点，可以满足不同体重人群的需要，其良好的支撑力能够适应睡眠者的各种睡姿，尤其是根据人体工程学精心设计
				“五段分区”床垫，分头、肩、腰、臀、腿五个区域部位，均衡分散人体各部位的自重，保障人体在睡眠时的自然弯曲和血循环的畅通，让人一夜好梦到天亮。
				<p>时尚</p>
				大利来向来不认为自己只是一个酒店品牌，更希望代表一种时尚个性的生活方式。我们认为新一代的酒店宾客是“城市移动者”，无论是因为商务还是旅游休闲而出行，他们都很清楚在酒店里想要什么——时尚的设计，高性价比，舒适感，免费的娱乐和好的地理位置
			</div>
			<dl>
				<dd>
					<img src="images\hotel\about01.jpg" alt="">
				</dd>
				<dt>
					<h1>开启</h1>
					<h4>O P E N</h4>

					<h3>大空间，随心自由</h3>

					<h3>大床铺，随性放松</h3>

					<h3>大水量，随心所欲</h3>
				</dt>
			</dl>
			<dl class="core2">
				<dt>
					<h1>感受</h1>
					<h4>F E E L I N G</h4>

					<h3>今晚，安全安心</h3>

					<h3>今晚，舒适舒心</h3>

					<h3>今晚，超值超享</h3>
				</dt>
				<dd>
					<img src="images\hotel\about02.jpg" alt="">
				</dd>
			</dl>
		</div>
		<!--客房-->
		<div id="guest_rooms">
			<p class="booking_tab">
				<span></span>客房列表
			</p>
			<div class="chioce">
				入住时间：<input type="date" />| 离店时间：<input type="date" />| <input
					type="text" placeholder="关键字" id="kw" /> <input type="button"
					value="搜索" id="search" /> <a href="room/room_DESCRoom">价格从高到低</a>|
				<a href="room/room_ASCRoom">价格从低到高</a>
			</div>
			<!--列表-->
			<div style="height: 200px; overflow-y:scroll">
				<table id="pro_list">
					<thead>
						<tr>
							<th width="200px">客房</th>
							<th>房型</th>
							<th>床宽</th>
							<th>取消政策</th>
							<th>房价</th>
							<th>房态</th>
							<th>预订</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${roomList}" var="r">
							<tr>
								<td><img src="${r.rpic}" alt=""></td>
								<td align="center">
									<p>${r.houseType}</p> <a class="sub_txt"
									href="room/room_queryById?rid=${r.rid}">查看更多信息</a>
								</td>
								<td>${r.bedType}</td>
								<c:choose>
									<c:when test="${r.mating==0}">
										<td>不可取消</td>
									</c:when>
									<c:otherwise>
										<td>可取消</td>
									</c:otherwise>
								</c:choose>
								<td>${r.proPrice}</td>
								<td>${r.regPrice}</td>
								<td><input type="button" value="预订" onclick="reserve(${r.rid})"></td>
								<%-- <c:choose>
									<c:when test="${r.cancel==2}">
										<td><input type="button" value="预订" disabled="disabled" "></td>
									</c:when>
									<c:when test="${r.cancel==3}">
										<td><input type="button" value="预订" disabled="disabled" ></td>
									</c:when>
									<c:otherwise>
										
									</c:otherwise>
								</c:choose> --%>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- -->
			<!--<ul class="rooms_type">-->
			<!--<li class="core1">客房</li>-->
			<!--<li>房型</li>-->
			<!--<li>床型</li>-->
			<!--<li>早餐</li>-->
			<!--<li>房价</li>-->
			<!--<li>预订</li>-->
			<!--</ul>-->
			<!--&lt;!&ndash; 菜单列表 &ndash;&gt;-->
			<!--<ul id="room-list">-->
			<div id="pages"></div>
			<!--  -列表菜单 -->
			<div></div>
		</div>
	</div>

	</section>
	<!--底部-->
	<div id="c_footer"></div>
	<script src="js/jquery-1.11.3.js"></script>
	<!-- <script src="js/reservation.js"></script> -->
	<script src="js/intro.js"></script>
	<script src="js/index.js"></script>
	<script src="jquery-ui-1.12.1/jquery-ui.js"></script>
	<script>
		//功能点2：
		$("#subject>div.schedule_box input[name='invite']").datepicker({

			dateFormat : "yy年mm月dd日"
		});
		$("#subject>div.schedule_box input[name='deptime']").datepicker({

			dateFormat : "yy年mm月dd日"
		});
		$("#subject>div.schedule_box>ul>li>span").click(function() {
			$(this).siblings("input").focus();
		});
	</script>
	<script type="text/javascript">
		function reserve(id) {
			location = 'room/room_toOrder?rid=' + id;
		}
	</script>
</body>
</html>
