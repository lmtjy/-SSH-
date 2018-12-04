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
	var a='${count}';
	if(msg!=""){
		alert(msg);
	}
	function add(){
		a ++;
		console.log(a);
		var s = '<div id="div'+a+'"><hr>';
		s += '<div class="form-group">';
        s += '<div class="label">';
        s += '<label>岗位：</label>';
        s += '</div>';
        s += '<div class="field">';
        s += '<input type="text" class="input w50" value="" name="recruits['+a+'].rname" data-validate="required:请输入标题" />';
        s += '<button class="button" type="button" onclick="del(div'+a+')">×</button>';
        s += '<div class="tips"></div>';
        s += '</div>';
        s += '</div>';
        s += '<div class="form-group">';
        s += '<div class="label">';
        s += '<label>人数：</label>';
        s += '</div>';
        s += '<div class="field">';
        s += '<input type="text" class="input w50" value="" name="recruits['+a+'].rnumber" />';
        s += '<div class="tips"></div>';
        s += '</div>';
        s += '</div>';
        s += '<div class="form-group">';
        s += '<div class="label">';
        s += '<label>薪资：</label>';
        s += '</div>';
        s += '<div class="field">';
        s += '<input type="text" class="input w50" value="" name="recruits['+a+'].smoney" />';
        s += '<div class="w50" style="width: 20px;height: 42px;line-height: 38px;"><span>---</span></div>';
        s += '<input type="text" class="input w50" value="" name="recruits['+a+'].omoney" />';
        s += '<div class="tips"></div>';
        s += '</div></div>';
        s += '<div class="form-group">';
        s += '<div class="label">';
        s += '<label>要求：</label>';
        s += '</div>';
        s += '<div class="field">';
        s += '<textarea class="input" name="recruits['+a+'].requiren" style="height:90px;"></textarea>';
        s += '<div class="tips"></div>';
        s += '</div></div></div>';
		$('#add_div').append(s);
	}
	function addre1(){
		$('#add_div').append('');
	}
	function del(data){
		//var box = document.getElementById(data);
		data.parentNode.removeChild(data);
	}
</script>
<!--内容容器-->
<div class="admin">
    <div id="view">
        <div class="panel admin-panel">
            <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>发布动态</strong></div>
            <div class="body-content">
                <form method="post" class="form-x" id="add_new" action="news/news_add" enctype="multipart/form-data">
                    <s:set value="news" var="n"></s:set>
                    <input type="hidden" id="chose" name="chose" value="${news.chose }" />
                    <s:if test="#n.chose == 3">
                    	<s:set value="list"></s:set>
                   		<s:set value="recruits"></s:set>
                    	<s:iterator value="list">
                    	<input type="hidden" name="newId" value="<s:property value="newId"/>" />
                    	<input type="hidden" name="newTitle" value="<s:property value="newTitle"/>" />
                    	<input type="hidden" name="details" value="<s:property value="details"/>" />
                    	<input type="hidden" name="newImg" value="<s:property value="newImg"/>" />
                    	<input type="hidden" name="newType" value="<s:property value="newType"/>" />
                    	<div class="form-group">
	                        <div class="label">
	                            <label>简介：</label>
	                        </div>
	                        <div class="field">
	                            <textarea class="input" name="mid.mtitle" style=" height:90px;"><s:property value="mid.mtitle"/></textarea>
	                            <div class="tips"></div>
	                        </div>
	                    </div>
	                    </s:iterator>
	                    <div class="form-group">
	                    	<div style="margin-left: 100px">
			                    <button class="button" type="button" onclick="add()">添加岗位</button>
                    		</div>
                    	</div>
                    	<div id="add_div">
                    		<s:iterator value="recruits">
                    		<div id="divs<s:property value="new_rid"/>">
                    		<%-- <input type="hidden" name="new_rid" value="<s:property value="new_rid"/>" /> --%>
	                    	<div class="form-group">
		                        <div class="label">
		                            <label>岗位：</label>
		                        </div>
		                        <div class="field">
		                            <input type="text" class="input w50" value="<s:property value="rname"/>" name="recruits[<s:property value="new_rid"/>].rname" />
		                            <button class="button" type="button" onclick="del(divs<s:property value="new_rid"/>)">×</button>
		                            <div class="tips"><label style="color: red;">岗位不能为空</label></div>
		                        </div>
	                        </div>
	                        <div class="form-group">
		                        <div class="label">
		                            <label>人数：</label>
		                        </div>
		                        <div class="field">
		                            <input type="text" class="input w50" value="<s:property value="rnumber"/>" name="recruits[<s:property value="new_rid"/>].rnumber" />
		                            <div class="tips"></div>
		                        </div>
	                        </div>
	                        <div class="form-group">
		                        <div class="label">
		                            <label>薪资：</label>
		                        </div>
		                        <div class="field">
		                            <input type="text" class="input w50" value="<s:property value="smoney"/>" name="recruits[<s:property value="new_rid"/>].smoney"/>
		                            <div class="w50" style="width: 20px;height: 42px;line-height: 38px;"><span>---</span></div>
		                            <input type="text" class="input w50" value="<s:property value="omoney"/>" name="recruits[<s:property value="new_rid"/>].omoney" />
		                        </div>
	                        </div>
	                        <div class="form-group">
		                        <div class="label">
		                            <label>要求：</label>
		                        </div>
		                        <div class="field">
		                            <textarea class="input" name="recruits[<s:property value="new_rid"/>].requiren" style="height:90px;"><s:property value="requiren"/></textarea>
		                            <div class="tips"></div>
		                        </div>
	                        </div>
	                        </div>
	                        </s:iterator>
	                    </div>
                    </s:if>
                    <s:if test="#n.chose != 3">
	                    <div class="form-group">
	                        <div class="label">
	                            <label>标题：</label>
	                        </div>
	                        <div class="field">
	                            <input type="text" class="input w50" value="" name="newTitle" data-validate="required:请输入标题" />
	                            <div class="tips"></div>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <div class="label">
	                            <label>图片：</label>
	                        </div>
	                        <div class="field">
	                            <input type="file" id="url1" name="myfile" class="input tips" style="width:25%; float:left;"  value=""  data-toggle="hover" data-place="right" data-image="" />
	                            <div class="tipss">图片尺寸：340*170</div>
	                        </div>
	                    </div>
	                    <s:if test="#n.chose == 2">
	                    <div class="form-group">
	                        <div class="label">
	                            <label>开始时间：</label>
	                        </div>
	                        <div class="field">
	                            <input type="date" class="input w50" value="" name="mid.stime" data-validate="" />
	                            <div class="tips"></div>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <div class="label">
	                            <label>结束时间：</label>
	                        </div>
	                        <div class="field">
	                            <input type="date" class="input w50" value="" name="mid.otime" data-validate="" />
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
	                    </s:if>
	                    <div class="form-group">
	                        <div class="label">
	                            <label>描述：</label>
	                        </div>
	                        <div class="field">
	                            <textarea class="input" name="details" style=" height:43px;"></textarea>
	                            <div class="tipss">字数在100字以内</div>
	                        </div>
	                    </div>
	                    <s:if test="#n.chose == 2">
	                    <s:if test=""></s:if>
	                    <div class="form-group">
	                        <div class="label">
	                            <label>详细描述：</label>
	                        </div>
	                        <div class="field">
	                            <textarea class="input" name="mid.mtitle" style=" height:90px;"></textarea>
	                            <div class="tips"></div>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                    	<div class="label">
	                            <label>条款与细则：</label>
	                        </div>
	                        <div class="field">
                        		<textarea class="input" name="mid.mdetails" style=" height:43px;"></textarea>
	                        </div>
	                    </div>
	                    </s:if>
                    </s:if>

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
