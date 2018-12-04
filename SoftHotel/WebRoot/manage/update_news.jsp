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
    
    <title>My JSP 'add_news.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <title>大利来网络预订管理中心</title>
    <link rel="stylesheet" href="manage/css/pintuer.css">
    <link rel="stylesheet" href="manage/css/admin.css">
    <link rel="stylesheet" href="manage/css/base.css">
    <script src="manage/js/jquery-1.11.3.js"></script>
    <script src="manage/js/skip.js"></script>
    <script src="manage/js/new.js"></script>
    <!--<script src="js/management.js"></script>-->

</head>
<body style="background-color:#f2f9fd;"  >
<!--头部-->
<div id="header">

</div>
<script >
	var msg='${msg}';
	if(msg!=""){
		alert(msg);
	}
	function add(){
		
	}
	function addre1(){
		$('#add_div').append('');
	}
	function del(data){
		console.log(data);
		data.parentNode.removeChild(data);
	}
</script>
<!--内容容器-->
<div class="admin">
    <div id="view">
        <div class="panel admin-panel">
            <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>发布动态</strong></div>
            <div class="body-content">
                <form method="post" class="form-x" id="add_new" action="news/news_update" enctype="multipart/form-data">
                    <input type="hidden" id="newId" name="newId" value="${news.newId }" />
                    <div class="form-group">
                        <div class="label">
                            <label>标题：</label>
                        </div>
                        <div class="field">
                            <input type="text" class="input w50" value="${news.newTitle }" name="newTitle" data-validate="required:请输入标题"  />
                            <div class="tips"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="label">
                            <label>图片：</label>
                        </div>
                        <div class="field">
                        	<input type="hidden" id="newId" name="newImg" value="${news.newImg }" />
                            <input type="file" id="url1" name="myfile" class="input tips" style="width:25%; float:left;"  value=""/>
                            <div class="tipss">图片尺寸：340*170</div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="label">
                            <label>开始时间：</label>
                        </div>
                        <div class="field">
                            <input type="date" class="input w50" value="${news.mid.stime }" name="mid.stime" data-validate="" />
                            <div class="tips"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="label">
                            <label>结束时间：</label>
                        </div>
                        <div class="field">
                            <input type="date" class="input w50" value="${news.mid.otime }" name="mid.otime" data-validate="" />
                            <div class="tips"></div>
                        </div>
                    </div>
                    <input type="hidden" name="newType" value="店面活动" />
                    <!-- <div class="form-group">
                        <div class="label">
                            <label>分类标题：</label>
                        </div>
                        <div class="field">
                            <select name="newType" class="input w50" >
                                <option value="">请选择分类</option>
                                <option value="店面活动">店面活动</option>
                                <!-- <option value="招聘信息">招聘信息</option> -->
                            <!-- </select>
                            <div class="tips"></div>
                        </div>
                    </div> -->
                    <div class="form-group">
                        <div class="label">
                            <label>描述：</label>
                        </div>
                        <div class="field">
                            <textarea class="input" name="details" style=" height:43px;">${news.details }</textarea>
                            <div class="tipss">字数在100字以内</div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="label">
                            <label>详细描述：</label>
                        </div>
                        <div class="field">
                            <textarea class="input" name="mid.mtitle" style=" height:90px;">${news.mid.mtitle }</textarea>
                            <div class="tips"></div>
                        </div>
                    </div>
                    <div class="form-group">
                    	<div class="label">
                            <label>条款与细则：</label>
                        </div>
                        <div class="field">
                       		<textarea class="input" name="mid.mdetails" style=" height:43px;">${news.mid.mdetails }</textarea>
                        </div>
                    </div>

                    <div class="clear"></div>
                    <div class="form-group">
                        <div class="label">
                            <label></label>
                        </div>
                        <div class="field">
                            <input type="hidden" name="relTime" value=""/>
                            <button class="button bg-main icon-check-square-o" type="submit" id="insert_n"> 提交</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div style="text-align:center;">
</div>
</body>
</html>
