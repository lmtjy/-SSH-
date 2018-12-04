<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dish.jsp' starting page</title>
    
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
        <form method="post" action="">
            <div class="panel admin-panel">
                <div class="panel-head"><strong class="icon-reorder"> 全部客房</strong></div>
                <div class="padding border-bottom">
                    <ul class="search">
                        <li class="rt">
                            <a href="roommanage/room_add"  class="button border-green " id="add" >添加客房</a>
                        </li>
                    </ul>
                </div>
                
                <table class="table table-hover text-center" id="all_dish">
                    <thead>
                        <tr >
                            <th width="120">ID</th>
                            <th>客房号</th>
                            <th>客房图片</th>
                            <th width="120">客房类型</th>
                            <th>客房状态</th>
                            <!--<th >分类</th>-->
                            <th width="25%">客房价格</th>
                            <th>操作</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${roomList}" var="r">
                    <tr >
                        <td><input type="checkbox" name="id[]" data-nid="{{r.rid}}" value="1" />
                            ${r.rid}</td>
                        <td>
                        ${r.roomNum}
                        </td>
                        <td class="fImg">
                        <img src="${r.rpic}" alt=""/>
                        </td>
                        <td>
                           ${r.houseType }
                        </td>
                        <c:if test="${r.cancel==1}">
                        <td>
                          空闲中
                        </td>
                        </c:if>
                          <c:if test="${r.cancel==2}">
                        <td>
                          预定中
                        </td>
                        </c:if>
                          <c:if test="${r.cancel==3}">
                        <td>
                           使用中
                        </td>
                        </c:if>
                        
                        <td>${r.regPrice }</td>
                       
                        <td><div class="button-group"> <a class="button border-green" href="roommanage/room_update?rid=${r.rid }"><span class="glyphicon glyphicon-cog"></span> 修改客房</a> </div></td>
                    </tr>
                    </c:forEach>
                    </tbody>
                     <tfoot>
                         <tr>
                             <td colspan="8">
                                 <div class="pagelist">
                                 <span>总页数:${pagecount}||当前页:${page}</span>
                                 <a href="roommanage/room_query?page=1">首页</a>
                                     <a href="roommanage/room_query?page=${prev}">上一页</a>
                                   <!--   <div class="page">
                                        <a  href="roommanage/room_query?page=1" class="current"  ng-click="newPage(1)" >1</a>
                                         <a href="roommanage/room_query?page=2" ng-click="newPage(2)" >2</a>
                                         <a href="roommanage/room_query?page=3" ng-click="newPage(3)">3</a> 
                                     </div>
 -->
                                     <a href="roommanage/room_query?page=${next}">下一页</a>
                                     <a href="roommanage/room_query?page=${pagecount}">尾页</a>
                                 </div></td>
                         </tr>
                     </tfoot>

                </table>
            </div>
        </form>
        <script type="text/javascript">

            function del(id){
                if(confirm("您确定要删除吗?")){

                }
            }

            $("#checkall").click(function(){
                $("input[name='id[]']").each(function(){
                    if (this.checked) {
                        this.checked = false;
                    }
                    else {
                        this.checked = true;
                    }
                });
            })

            function DelSelect(){
                var Checkbox=false;
                $("input[name='id[]']").each(function(){
                    if (this.checked==true) {
                        Checkbox=true;
                    }
                });
                if (Checkbox){
                    var t=confirm("您确认要删除选中的内容吗？");
                    if (t==false) return false;
                }
                else{
                    alert("请选择您要删除的内容!");
                    return false;
                }
            }
        </script>
        <div class="delect_suc button bg-gray malog">
            <span class="icon-check"></span>删除成功
        </div>
    </div>
</div>
<div style="text-align:center;">
</div>
</body>
</html>



