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
	<link href="css/index.css" type="text/css" rel="Stylesheet"/>
	
 </head>
 <body>
      <!---头部-->
	   <div id="c_header"></div>
	  <!---中间部分--->
      <section id="ab_section">
	     <!--店面展示--->
	     <div id="bg_shows">
		      
		 </div>
		 <!--活动页面-->
		 <div id="act_shows">
		    <!--新闻页面
		    <div class="show">
		    </div>-->
	    </div>
		    <div class="">
		    	<div class="new_content">
		    	<div class="new_offer">
		    		<div class="new_title new_title_regular">最新资讯</div>
		    		<div class="picScroll-left">
		    		<div style="height: 30px;width: 1200px">
		    			<div class="n_next" role="button" ><a href="javascript:void(0)" onclick="nextnew()">&gt;</a></div>
			    		<div id="newpage" class="new_pagination new_title_bold">
			    			<div id="npage">1/${count }</div>
			    		</div>
			    		<div class="prev n_prev" role="button" ><a href="javascript:void(0)" onclick="prevnew()">&lt;</a></div>
		    		</div>
		    		<div class="new_wrap new_container">
		    			<div class="new_con" id="new_div" style="transition-duration: 0ms; transform: translate3d(35px,0px,0px);">
			    			<s:set value="newlist" var="nl"></s:set>
			    			<s:iterator value="newlist">
			    			
			    			<div class="" data-swiper-slide-index="0" style="width: 405px;">
								<div class="new_item">
									<a onclick="minute(<s:property value="newId"/>)">
										<div class="new_img">
											<img class="new_img" src="<s:property value="newImg"/>" /><!--  -->
											<div class="new_gc new_text_regular">会员专享</div>
										</div>
									</a>
									<div class="new_offer_title new_title_regular" ><s:property value="newTitle"/></div>
									<div class="new_offer_desc"><s:property value="details"/></div>
									<a onclick="minute(<s:property value="newId"/>)">
										<div class="new_text_medium new_offer_more">查看详情</div>
									</a>
								</div>
							</div>
							</s:iterator>
							
							
							
						</div>
		    		</div>
		    		</div>
		    	</div>
		    	</div>
			</div>
			<div class="new_sl_section">
				<div class="new_content">
					<div class="new_all_offer">
						<div class="new_title new_title_regular">探索所有资讯</div>
						<div class="new_all_offer_con">
							<s:set value="titlelist" var="tl"></s:set>
			    			<s:iterator value="titlelist">
							
							<div class="new_all_offer_item">
								<div class="new_gc new_text_regular">会员专享</div>
								<a onclick="chakan('<s:property value="newTitle"/>')">
									<div class="new_img_wrap">
										<img class="new_img" src="<s:property value="newImg"/>" />
									</div>
								</a>
								<div class="new_offer_title new_title_regular"><s:property value="newTitle"/></div>
								<div class="new_offer_desc"><s:property value="details"/></div>
								<a onclick="chakan('<s:property value="newTitle"/>')">
									<div class="new_more new_text_medium">查看所有活动 (<s:property value="pagecount"/>)</div>
								</a>
							</div>
							</s:iterator>
							
							
						</div>
					</div>
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
	  	/*$(function() {

			$(".tabs").slide({
				trigger : "click"
			});

		});
	  	jQuery(".picScroll-left").slide({
	  		mainCell:".bd ul",
	  		defaultIndex:1,
	  		autoPate:true,
	  		effect:"left",
	  		vis:3
  		});*/
  		function chakan(newTitle){
  			console.log(newTitle);
  			var url = 'news/news_queryMinute?newType=' + newTitle;
  			location = url;
  		}
  		function minute(newId){
  			var url = 'news/news_queryMinute?newId=' + newId;
  			location = url;
  		}
  		var np=1;
  		var count='${count}';
		function nextnew(){
			var div = document.getElementById("new_div");
			$("#np").val(np);
			if(np==1){
				div.style.transform = "translate3d(-1180px,0px,0px)";
				np= np+1;
			}else if(np==2){
				div.style.transform = "translate3d(-2395px,0px,0px)";
				np= np+1;
			}else if(np==3){
				np=2;
				prevnew();
			};
			var data=document.getElementById("npage");
			data.parentNode.removeChild(data);
			var s = '<div id="npage">'+np+'/3</div>';
			$('#newpage').append(s);
			//35,-1180,-2395(1215)
		};
  		function prevnew(){
  			var div = document.getElementById("new_div");
  			$("#np").val(np);
  			if(np==1){
  				np=2;
  				nextnew();
  			}else if(np==2){
				div.style.transform = "translate3d(35px,0px,0px)";
				np= np-1;
  			}else if(np==3){
  				div.style.transform = "translate3d(-1180px,0px,0px)";
				np= np-1;
  			};
  			var data=document.getElementById("npage");
			data.parentNode.removeChild(data);
			var s = '<div id="npage">'+np+'/3</div>';
			$('#newpage').append(s);
  		};
		/*引入头部*/
	  </script>
	  <script src="js/index.js"></script>
 </body>
</html>
