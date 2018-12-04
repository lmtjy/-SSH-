<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'news.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/index.css" type="text/css" rel="Stylesheet" />
	<link href="css/news.css" type="text/css" rel="Stylesheet" />
	<link href="css/news1.css" type="text/css" rel="Stylesheet" />
	<link href="css/news2.css" type="text/css" rel="Stylesheet" />
 </head>
 <body>
      <!---头部-->
	   <jsp:include page="header.jsp"></jsp:include>
	  <!---中间部分--->
      <section id="ab_section">
	     
		 <!--活动页面-->
		 <div id="act_shows">
		    <!--新闻页面-->
		    <div class="show"></div>
		    <div >
		    	<s:set value="news" var="n"></s:set>
		    	<s:set value="list" var="tl"></s:set>
		    	<s:if test="#n.chose == 1">
		    		<div class="new_sl_section">
						<div class="new_content">
							<div class="new_all_offer">
								<div class="new_title new_title_regular">所有资讯</div>
								<div class="new_all_offer_con">
					    			<s:iterator value="list">
									
									<div class="new_all_offer_item" style="text-align: center;">
										<div class="new_gc new_text_regular">会员专享</div>
										<a onclick="minute(<s:property value="newId"/>)">
											<div class="new_img_wrap">
												<img class="new_img" src="<s:property value="newImg"/>" />
											</div>
										</a>
										<div class="new_offer_title new_title_regular"><s:property value="newTitle"/></div>
										<div class="new_offer_desc"><s:property value="details"/></div>
										<a onclick="minute(<s:property value="newId"/>)">
											<div class="new_text_medium new_offer_more">查看详情</div>
										</a>
									</div>
									</s:iterator>
									
									
								</div>
							</div>
						</div>
					</div>
		    	</s:if>
		    	<s:if test="#n.chose == 2">
			    	<div style="font-family: '宋体';">
			    		<div style="text-align: center;"><img style="width: 1180px;height: 360px;" alt="" src="<s:property value="news.newImg"/>"></div>
			    		<div style="margin: 10px 0px 0px 10px">
			    			<h1 style="font-family: '宋体';font-size: 24px;">${news.newTitle }</h1>
				    		<br>
				    		<h3>${news.mid.stime } —— ${news.mid.otime }</h3>
				    		<hr>
				    		<div style="height: 350px;padding: 10px 0px 10px 0px;">
				    			<div><pre>${news.mid.mtitle }</pre></div>
				    		</div>
				    		<hr>
				    		<div style="margin: 10px 0px 0px 10px;line-height: 36px">
					    		<div style="font-size: 28px;">条款与细则</div>
					    		<div><pre>${news.mid.mdetails }</pre></div>
				    		</div>
			    		</div>
			    	</div>
		    	</s:if>
		    	<s:if test="#n.chose == 3">
		    		<div style="font-family: '宋体';background-color: #fff;">
		    			<div style="text-align: center;"><img style="width: 1180px;height: 360px;" alt="" src="<s:property value="news.newImg"/>"></div>
			    		<div style="margin: 10px 0px 0px 10px;">
			    			<s:set value="recruits" var="r"></s:set>
			    			<h1 style="font-family: '宋体';font-size: 32px;">${news.newTitle }</h1>
				    		<hr>
				    		<div class="nr1 clearfix" style="margin: 30px 0px 20px 50px;">
				    			<i></i>
				    			<h1 class="nrlh1"><span>简介</span></h1>
				    			<div class="nr_wrap">${news.mid.mtitle }</div>
				    		</div>
				    		<div class="nr1 clearfix" style="margin: 100px 0px 0px 50px;">
				    			<i></i>
				    			<h1 class="nrlh1"><span>招聘岗位</span></h1>
				    			<ul class="nr2ul">
				    				<s:iterator value="r">
				    					<li class="clearfix">
				    						<h1 class="nr2h1">
				    							<p class="nr2p"><s:property value="rname"/></p>
				    							<p class="nr2p"><s:property value="rnumber"/>名</p>
				    							<p class="nr2p">薪资：<s:property value="smoney"/>-<s:property value="omoney"/></p>
				    						</h1>
				    						<div class="nr2div">
				    							<pre class="divp"><s:property value="requiren"/></pre>
				    						</div>
				    					</li>
				    				</s:iterator>
				    			</ul>
				    		</div>
			    		</div>
			    	</div>
		    	</s:if>
		    </div>
	    </div>
			<!--页码部分--->
			<div id="pages">
			    <!-- <a href="1" >首页</a>
			                    <a href="#" class="before">上一页</a>
			    				<a href="1">1</a>
			    				<a href="2">2</a>
			    				<a href="3">3</a>
			    				<a href="#" class="next">下一页</a>
			    				<a href="#" >尾页</a> -->
			</div>
		 
		 
	  </section>
      <!---尾部--->
	  <footer id="c_footer"></footer>
	  <script src="js/jquery-1.11.3.js"></script>
	  <script src="js/intro.js"></script>
	  <script src="js/news.js"></script>
	  <script>
	  	function minute(newId){
			alert(newId);
			console.log(newId);
			var url = 'news/news_queryMinute?newId=' + newId;
			location = url;
		};
		/*引入头部*/
	  </script>
 </body>
</html>
