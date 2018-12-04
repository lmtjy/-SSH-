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

<title>My JSP 'test.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="css/index.css" type="text/css" rel="Stylesheet" />
<link href="css/catering.css" type="text/css" rel="Stylesheet" />
<link rel="stylesheet" href="jquery-ui-1.12.1/jquery-ui.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
    function foodsdetail(id){
    	$.getJSON("foods/foods_getFoodsDetail",{"foods.fid":id},function(data){
    		$("#fid").val(data.fid);
    		$("#fname").html(data.fname);
    		$("#fintr").html(data.fintr);
    		$("#fimg").attr("src",data.fimg);  		
    		$("#fprice").html(data.fprice);
    	});
    }
    
    function fen(page){
    	var url='foods/foods_queryByPage?page='+page;
    	location=url;
    }
    
    
    var msg='${msg}';
	if(msg!=""){
		alert(msg);	
	}
  </script>

</head>
<body>

	<!--头部-->
	<div id="c_header"></div>
	<!--主体-->
	<section> <!--餐饮主题显示-->
	<div id="food_index"></div>
	<!--其他分类-->
	<div id="other-chioose">
		<!--选择菜单-->
		<!--精品美食--->
		<div id="boutique">
			<p class="theme">
				<b>味|</b>精品美食
			</p>
			<!--文本-->
			<div class="text">
				<p>一口一味 自然精粹</p>
				<div>烹饪精准 营养均衡 贯彻数学家的严谨细致，调味出色 创意新锐 演绎艺术及的匠心风采，独特美味 惬意享受
					呈现美食家的精细巧思</div>
			</div>
			<!--列表-->
			<ul>
				<li><img src="images\meal\boutique_01.jpg">
					<div class="shade"></div></li>
				<li><img src="images\meal\boutique_02.jpg">
					<div class="shade"></div></li>
				<li class="b_wid"><img src="images\meal\boutique_03.jpg">
					<div class="shade"></div></li>
				<li><img src="images\meal\boutique_04.jpg">
					<div class="shade"></div></li>
				<li><img src="images\meal\boutique_05.jpg">
					<div class="shade"></div></li>
			</ul>

		</div>
		<!--热销菜式-->
		<div id="hot_sell">
			<div class="left_info">
				<p>-热销菜式-</p>
				<h3>Hot dish style</h3>
				<div class="text_me">
					谈到吃，最思念的自然就是家的味道，餐厅的大师傅们，可真是可爱至极，精选上等食材，精心烹饪而来，只愿为您献上最温馨的味道</div>
				<div class="text_clay">煲仔饭属于粤菜系。
					煲仔饭的风味多达百余种,新鲜采购，放入十几种味料腌制，在火候控制方面比较灵活，煲出来的饭也较为香口，齿间留香，回味无穷</div>
				<div class="text_soup">
					喝汤是南方人的习惯，各种汤，如排骨汤、鱼汤和鸡汤等都是餐桌上常见的汤品，各种汤品具有不同的功效</div>
				<a href="#">更多菜式</a>
			</div>
			<div class="right_more">
				<ul class="type_list">
					<li class="current" name="me">合家菜肴</li>
					<li name="clay">煲仔饭</li>
					<li name="soup">营养汤品</li>
				</ul>
				<ul class="chioce">
					<li><img src="images\meal\me0.jpg"></li>
					<li><img src="images\meal\me1.jpg"></li>
					<li><img src="images\meal\me2.jpg"></li>
				</ul>
			</div>
		</div>



		<!--厨师长特别推荐--->
		<div id="cainter">
			<!--选项卡--->
			<ul class="tab">
				<li class="active"><a href="foods/foods_queryByPage?page=1">全部菜品</a></li>
				<li><a href="foods/foods_queryType?foods.type=002">披萨</a></li>
				<li><a href="foods/foods_queryType?foods.type=003">西式扒类</a></li>
				<li><a href="foods/foods_queryType?foods.type=006">小食</a></li>
				<li><a href="foods/foods_queryType?foods.type=007">饮品</a></li>
				<li><a href="foods/foods_queryType?foods.type=008">沙拉</a></li>
				<li><a href="foods/foods_queryType?foods.type=009">套餐</a></li>
			</ul>
			<!---内容--->
			<div class="details">
				<s:iterator value="list">
					<div>
						<a onclick="foodsdetail(<s:property value="fid" />)"
							data-toggle="modal" data-target="#customerEditDialog"> <img
							alt="" src="<s:property value="fimg" />"></a>
						<div id="type_title">
							<s:property value="fname" />
						</div>
					</div>
				</s:iterator>
			</div>
			<!--遮罩框-->

			<!--页码部分--->
			<div id="pages">
				<!-- <a href="1" >首页</a>
                          <a href="#" class="before">上一页</a>
                  <a href="1">1</a>
                  <a href="2">2</a>
                  <a href="3">3</a>
                  <a href="#" class="next">下一页</a>
                  <a href="#" >尾页</a> -->
				当前页:${page} <a onclick="fen(1)">首页</a> <a onclick="fen(${shang})"
					class="before">上一页</a> <a onclick="fen(${xia})" class="next">下一页</a>
				<a onclick="fen(${pagecount})">尾页</a> 总页数:${pagecount}
			</div>
		</div>
		<!----->
		<!----->
	</div>
	<!--模态框-->
	<div class="modal fade" id="customerEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">

				<div class="f_infos">
					<span class="close"></span>
					<div>
						<img src="" alt="" id="fimg">
					</div>

					 <!--右侧详情-->
				 <div class="info">
					 <ul>
						 <li><span>菜名:</span><span id="fname" ></span></li>
						 <input type="hidden" id="fid"/>
						 <li><span>简介:</span><div class="intro" id="fintr"></div></li>
						 <li><span>价格:</span><span  id="fprice"></span>元/份</li>
						 <li><span>数量:</span><input type="text" id="count" /></li>
						 <li>
							 <p>
								 <button onclick="add_card()">加入订单</button>
							 </p>
						 </li>
					 </ul>
				 </div>
					
					<%-- <div class="info">
                          <form method="post" action="foods/foods_getByUname">
                          <input type="hidden" id="fid"/>
						<ul>
							<li><span>菜名:</span><span id="fname" ></span></li>
							<li><span>简介:</span>
								<div class="intro" id="fintr"></div></li>
							<li><span>单价:</span><span  id="fprice"></span>元/份</li>
							<li><span>数量:</span><input type="text" id="count" /></li>
							<li>
								<p>
									<input type="submit"  value="加入订单" />
								</p>
							</li>
						</ul>
                       </form>
					</div>
 --%>
				</div>

	</div>
<!--  


	<div id="malog">
		<div class="f_infos">
			<span class="close"></span>
			<div>
				<img src="images/meal/food/ho_03.jpg" alt="">
			</div>


			<div class="info">
				<ul>
					<li><span>菜名:</span></li>
					<li><span>简介:</span>
						<div class="intro">${foods.fintr}</div></li>
					<li><span>价格:</span>${foods.fprice}</li>
					<li><span>操作:</span><b class="add">+</b><input type="text"
						value="1" /><b class="sub">-</b></li>
					<li>
						<p>
							<button class="add_cart">加入订单</button>
							<button class="booking">立即下单</button>
						</p>
					</li>
				</ul>
			</div>
		</div>
	</div>
	-->
	</section>
	<!---底部-->
	<div id="c_footer"></div>
	<script type="text/javascript">
	var loginName = "<%=session.getAttribute("uname")%>";
	sessionStorage.setItem('loginName', loginName);//整合后删除
	function add_card(){
		 var uname=sessionStorage['loginName'];
		    if(!uname){
		      alert("未进行登录，无法预订");
		    }
		    var pid=$("#fid").val();
		    var count=$("#count").val();
		    //alert(uname+pid+count);
		     $.ajax({
		          url:'room/order_addCard',
		          data:{uname:uname,productId:pid,count:count,type:1},
		          success:function(data){
		            alert("加入订单成功,跳转订单界面！");
		            location="room/myorder_toMyorder";
		          }
		     }) 
	}
	</script>
	<script src="js/jquery-1.11.3.js"></script>
	<script src="js/intro.js"></script>
	<script src="js/catering.js"></script>
	<script src="js/index.js"></script>
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="js/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->

</body>
</html>

