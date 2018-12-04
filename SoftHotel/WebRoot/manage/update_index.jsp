<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add_dish.jsp' starting page</title>
    
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
    <script src="manage/js/dish.js"></script>
    <!--<script src="js/management.js"></script>-->

</head>
<body style="background-color:#f2f9fd;"  >
<!--头部-->
<div id="header">

</div>
<script >

</script>
<!--内容容器-->
<div class="admin">
    <div id="view">
        <div class="panel admin-panel">
            <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改客房信息</strong></div>
            <div class="body-content">
                <form method="post" class="form-x" action="roommanage/room_${room!=null?'updateRe':'addRe' }" enctype="multipart/form-data">
                 <c:if test="${room.rid!=0}">
                 <div class="form-group">
                        <div class="field">
                            <input type="hidden" name="rid2" value="${room.rid}"/>
                            <div class="tips"></div>
                        </div>
                    </div>
                    </c:if>
                    <div class="form-group">
                        <div class="label">
                            <label>客房号</label>
                        </div>
                        <div class="field">
                            <input type="text" class="input w50" value="${room.roomNum }" name="room.roomNum"  />
                            <div class="tips"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="label">
                            <label>客房缩略图：</label>
                        </div>
                        <div class="field">
                        <img src="${room.rpic}"/>
                        <input type="hidden" name="room.rpic" value="${newrpic}"/>
                            <input type="file" id="url1" name="myfile" class="input tips" style="width:25%; float:left;"  value="${room.rpic}"  data-toggle="hover" data-place="right" data-image="" />
                            <div class="tipss"></div>
                        </div>
                    </div>
                     <div class="form-group">
                        <div class="label">
                            <label>客房大图：</label>
                        </div>
                        <div class="field">
                         <input type="hidden" name="room.lpic" value="${newlpic}"/>
                        <img src="${room.lpic}"/>
                            <input type="file" id="url1" name="myfile2" class="input tips" style="width:25%; float:left;"  value="${room.lpic}"  data-toggle="hover" data-place="right" data-image="" />
                            <div class="tipss"></div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="label">
                            <label>价格</label>
                        </div>
                        <div class="field">
                            <input type="text" class="input w50" value="${room.regPrice}" name="room.regPrice" />
                            <div class="tips"></div>
                        </div>
                    </div>
                    <if condition="$iscid eq 1">
                        <div class="form-group">
                            <div class="label">
                                <label>客房分类</label>
                            </div>
                            <div class="field">
                             <input type="text" class="input w50" value="${room.houseType }" name="room.houseType" />
                                <div class="tips"></div>
                            </div>
                        </div>
                    </if>

                
                    <div class="clear"></div>
                    <div class="form-group">
                        <div class="label">
                            <label></label>
                        </div>
                        <div class="field">
                            <input type="hidden" name="fcount" value="0"/>
                            <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
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


