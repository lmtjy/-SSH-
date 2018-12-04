<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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

<title>My JSP 'room_order.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/order.css">
</head>
<body>
	<!--- 页头--->
	<div id="c_header"></div> 
	<!----主体-->
	<div id="section">
		<!--客房信息-->
		<div class="hotel_inf_w">

			<div class="hotel_roominfobox">
				<!--<a href="#"><img src="images/hotel/room01_l.jpg" alt=""/></a>-->
				<!--<div class="info">-->
				<!--<h2>豪华双人房</h2>-->
				<!--豪华双人房&#45;&#45;&#45;&#45;预定-->
				<!--</div>-->
				<!--<ul class="hotel_detail">-->
				<!--<li><span>床型:</span>双床</li>-->
				<!--<li><span>面积:</span>18平方米</li>-->
				<!--<li><span>宽带:</span>无线/宽带</li>-->
				<!--<li><span>早餐:</span>无早</li>-->
				<!--<li><span>可住:</span>2人</li>-->
				<!--<li><span>其他:</span>双床：90cm</li>-->
				<!--</ul>-->
			</div>
			<div class="jump">
				<a href="javascript:details()">返回查看详情信息</a> <a href="room/room_queryRooms">更多房型</a>
			</div>
		</div>
		<script type="text/javascript">
		  function details(){
			  function GetQueryString(name) {
				  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
				  var r = window.location.search.substr(1).match(reg);
				  var context = "";
				  if (r != null)
					  context = r[2];
				  reg = null;
				  r = null;
				  return context == null || context == "" || context == "undefined" ? "" : context;
				  }
		    location="room/room_queryById?rid="+GetQueryString("rid");
		  }
		</script>
		<!--预定信息-->
		<div class="book_info">
			<form id="order_info">
				<ul>
					<input type="hidden" name="rid.rid" value="" />
					<li>
						<h3>预定信息</h3>

						<div class="info_group">
							<label>入住时间</label><input type="date" name="stime"
								value="2016-11-23" /> &nbsp &nbsp
							<label>离店时间</label><input type="date" name="ltime"
								value="2016-11-23" />
						</div>
						<div class="info_group num">
							<label>房间数量</label> <span class="sub">-</span> <input type="text"
								name="num" value="1" /> <span class="add">+</span>

							<div class="msg"></div>
						</div>
						<div class="info_group">
							<label>房费总计</label><span class="total">￥400</span> <input
								type="hidden" name="tprice" value="0" />
						</div>
					</li>
					<li>
						<h3>入住信息</h3>

						<div class="info_group">
							<label>姓名</label><input type="text" name="tname"
								id="orderName" /><span class="msg"></span>
						</div>
						<div class="info_group">
							<label>电话</label><input type="text" name="mobile" id="phone" onblur="yanzheng()"/><span
								class="msg" id="mob"></span>
						</div>
						<script type="text/javascript">
         	function yanzheng(){
         		var phone= $("input[name='mobile']").val();
             	checkMobile(phone);
         	}
		     function checkMobile(str) {
			         var  re = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
				         if (re.test(str)) {
				        	$("#mob").html("您输入的号码正确！")
				         } else {
				        	 $("#mob").html("您输入的号码错误！");
		         		} 
		     }
         </script>
						<div class="info_group">
							<label for="massage">留言信息</label>
							<textarea id="massage" name="remark">

                         </textarea>
						</div>
						<div class="info_group">
							<label>支付方式</label> <input type="radio" name="pay" value="1"
								checked />入店支付 <input type="radio" name="pay" value="2" />支付宝
							<input type="radio" name="pay" value="3" />银联
						</div>

					</li>
					<li>
						<div class="msg">预定须知:请携带好本人的身份证，办理入住手续，本店办理入住需要在前台缴费押金 ￥200

						</div>  <input
						type="hidden" name="roomList" value="0" />
						<input type="hidden" name="uname" value="0">
						<!--  <input type="hidden"
						name="foodList" value="[]" /> -->
						<div id="btn_booking">确认预定</div>

					</li>
				</ul>
			</form>
		</div>

		<div class="malog">
			<div class="message">
				<p class="msgs"></p>
				<p>
					您可以在 <a href="room/myorder_toMyorder">我的订单</a>查看详情
				</p>
				<p>
					系统会在<span class="num">5</span>秒后跳转会 <a href="foods/foods_queryByPage">菜单列表</a>
				</p>
			</div>
		</div>

	</div>
	<!----页底--->
	<div id="c_footer"></div>
	<script type="text/javascript">
   		var rid = "<%=session.getAttribute("rid")%>";
		sessionStorage.setItem('rid', rid);
	</script>
	<script src="js/jquery-1.11.3.js"></script>
	<script src="js/room_order.js"></script>
	<script src="js/intro.js"></script>
	<script src="js/index.js"></script>
	<script type="text/javascript">

	$("#btn_booking").click(function(){
		roomList = $(roomList).html();
		roomList = $.parseJSON(roomList);  //String 转对象类型
		var shuliang = (roomList.roomNum-roomList.bookNum);
		if(shuliang<=0){
			$(".malog").show();
			 $(".malog .msgs").html("抱歉！您预订的房间已被预订完，为您返回房间列表！");
			var i=5;
			 var timer=setInterval(function(){
				 i--;
				 $(".malog .num").html(i);
				 if(i==0){
					 location.href="room/room_queryRooms";
					 clearInterval(timer);
				 }
			 },1000);
		}else{
			var t=true;
			var info=$("#order_info").serialize();
			if(!$("#order_info input[name='tname']").val()){
				$("#order_info input[name='tname']").next().html("请留下入住人的姓名");
				t=false;
			}
			if(!$("#order_info input[name='mobile']").val()){
				$("#order_info input[name='mobile']").next().html("请留下电话号码以方便联系");
				t=false;
			}
			if(t){
				$.ajax({
					type:"POST",
					url:'room/order_addOrder',
					data:info,
					success:function(data){
						var str = $(data).html(); 
						data = JSON.parse(str);
		                 $(".malog").show();
						 if(data!=""){
							 $(".malog .msgs").html("您已经成功提交订单，订单编号为："+data);
							 var i=5;
							 var timer=setInterval(function(){
								 i--;
								 $(".malog .num").html(i);
								 if(i==0){
									 location.href="room/room_queryRooms";
									 clearInterval(timer);
								 }
							 },1000);
						 }else {
							$(".malog .msgs").html("Oh!订单提交失败，为您返回订单页面");
						}
					}
				})
			}	
		}
	})
	</script>
</body>
</html>
