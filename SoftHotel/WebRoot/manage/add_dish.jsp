<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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

<script type="text/javascript">
  function addfoods(){
	  $.post("foods/foods_add",$("#addfood").serialize(),
			  function(data){
		           if(data){
			            alert("添加成功!");
		           }else(data){
			            alert("添加失败!");
		           }
		           location='foods/foods_queryDishByPage';
	           });
  }
  var msg='${msg}';
	if(msg!=""){
		alert(msg);	
	}
</script>
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
            <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>${foods!=null?'修改':'添加' }新菜单</strong></div>
            <div class="body-content">
                <form method="post" class="form-x" action="foods/foods_${foods!=null?'toupdate':'add' }" enctype="multipart/form-data" id="addfood">
                   <c:if test="${foods.fid!=0 }"> <input type="hidden" value="${foods.fid }" name="foods.fid"/>
                   </c:if>
                    <div class="form-group">
                        <div class="label">
                            <label>菜品名称</label>
                        </div>
                        <div class="field">
                            <input type="text" class="input w50" value="${foods.fname }" name="foods.fname" data-validate="required:请输入标题" />
                            <div class="tips"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="label">
                            <label>图片：</label>
                        </div>
                        <div class="field">
                        <img alt="" src="${foods.fimg }">
                            <input type="file" id="url1" name="myfile" class="input tips" style="width:25%; float:left;"  value=""  data-toggle="hover" data-place="right" data-image="" />
                            <div class="tipss">图片尺寸：287*364</div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="label">
                            <label>价格</label>
                        </div>
                        <div class="field">
                            <input type="text" class="input w50" value="${foods.fprice }" name="foods.fprice" />
                            <div class="tips"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="label">
                            <label>数量</label>
                        </div>
                        <div class="field">
                            <input type="text" class="input w50" value="${foods.fcount }" name="foods.fcount" />
                            <div class="tips"></div>
                        </div>
                    </div>
                    <if condition="$iscid eq 1">
                        <div class="form-group">
                            <div class="label">
                                <label>菜品分类：</label>
                            </div>
                            <div class="field">
                                <select name="foods.type" class="input w50">
                                    <option value="${foods.type }">请选择分类</option>
                                    <option value="002">披萨</option>
                                    <option value="003">西式扒类</option>
                                    <option value="006">小食</option>
                                    <option value="007">饮品</option>
                                    <option value="008">沙拉</option>
                                    <option value="009">套餐</option>
                                </select>
                                <div class="tips"></div>
                            </div>
                        </div>
                    </if>

                    <div class="form-group">
                        <div class="label">
                            <label>菜品详情：</label>
                        </div>
                        <div class="field">
                            <textarea class="input" name="foods.fintr"  style=" height:90px;">
                            ${foods.fintr }
                            </textarea>
                            <div class="tips"></div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="form-group">
                        <div class="label">
                            <label></label>
                        </div>
                        <div class="field">
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


