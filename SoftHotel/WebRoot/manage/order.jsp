<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     <title>中软国际大酒店后台管理</title>
    
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
    <script src="manage/js/order.js"></script>
    <!--<script src="js/management.js"></script>-->
    <script type="text/javascript">
 
    </script>

</head>
<body style="background-color:#f2f9fd;"  >
<!--头部-->
<div id="header">

</div>
<!--内容容器-->
<div class="admin">
    <div id="view">
        <form method="post" action="">
            <div class="panel admin-panel">
                <div class="panel-head"><strong class="icon-reorder"> 全部菜单</strong></div>
                <div class="padding border-bottom">
                    <ul class="search">
                    

                    </ul>
                </div>
                <table class="table table-hover text-center" id="order">
                    <thead>
                    <tr >
                        <th width="120">订单ID</th>
                        <th>宾客姓名</th>
                        <th>电话号码</th>
                        <th>编号</th>
                        <th>总金额</th>
                        <th>订单状态</th>
                        <th>订单备注</th>
                        <th>下单时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${hotelorders}" var="h">
                    <tr>
                    <td>
                      ${ h.oid}
                    </td>
                       <td>
                     ${ h.orderName}
                    </td>
                       <td>
                      ${ h.phone}
                    </td>
                       <td>
                     ${h.orderNum}
                    </td>
                       <td>
                       ${h.price}
                    </td>
                    <c:if test="${h.status==1 }">
                        <td>
                                          已支付
                    </td>
                    </c:if>
                          <c:if test="${h.status==0 }">
                        <td>
                                          未支付
                    </td>
                    </c:if>
                   
                       <td>
                      ${h.massage}
                    </td>
                    <td>
                    ${h.ltime }
                    </td>
                    <c:if test="${h.status==1 }">
                       <td>
                    	<div class="button-group">
										<a class="button border-green" href="orders/order_showinfo?oid=${h.oid}&status=${h.status}"></span>
											查看详情</a>
									</div>
                    </td>
                    </c:if>
                      <c:if test="${h.status==0 }">
                       <td>
                    	<div class="button-group">
										<a class="button border-green" href="orders/order_showinfo?oid=${h.oid}"></span>
											查看详情</a>
									</div>
                    </td>
                    </c:if>
                    </tr>
                    </c:forEach>
                 
                    </tbody>
               

                </table>
            </div>
        </form>
        <script type="text/javascript">

            function del(id){
                if(sessionStorage['aType']==1){
                    if(confirm("您确定要删除吗?")){
                        console.log(id);
                        $.ajax({
                            url:"data/delete_order.php",
                            data:{oid:id},
                            success:function(data){
                                if(data.msg="succ"){
                                    alert("删除成功");
                                    order(1);
                                }else if(data.msg="err"){
                                    alert("删除成功");
                                }
                            }
                        })

                    }
                }else{
                    alert("您没有权限删除订单");
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
    </div>
</div>
<div style="text-align:center;">
</div>
</body>
</html>



