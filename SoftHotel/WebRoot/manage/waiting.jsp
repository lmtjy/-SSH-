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
    
   <title>大利来网络预订管理中心</title>
    
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
    <script src="manage/js/wait.js"></script>
    <!--<script src="js/management.js"></script>-->

</head>
<body style="background-color:#f2f9fd;"  >
<!--头部-->
<div id="header">

</div>
<style>

</style>
<script type="text/javascript">
$(function () {
    var status = ${tstatus};
    if(status==1){
    
    	$("#tuifang").removeAttr('href');
    	$("#tuifang").attr("disabled",true);
    }
});
</script>
<!--内容容器-->
<div class="admin">
    <div id="view">
        <form method="post" action="">
            <div class="panel admin-panel">
                <div class="panel-head"><strong class="icon-reorder">餐饮订单</strong></div>
          
                <table class="table table-hover text-center" id="order_wait">
                    <thead>
                    <tr >
                        <th width="50">订单ID</th>
                        <th>姓名</th>
                        <th>订单编号</th>
                        <th>预定时间</th>
                        <th>结房时间</th>
                        <th>房间类型</th>
                        <th>房间单价</th>  
                         <th>操作</th>
                           
                       
                    </tr>
                    </thead>

						<tbody>
						<c:forEach items="${roominfos}" var="r">
							<tr style="width:800px;">
							
								<td><input type="checkbox" name="id[]"
									data-nid="{{food.fid}}" value="1" />${r.oid }</td>

								<td>${r.tname}</td>
								<td>${r.orderNum}</td>
							    
							    <td>${r.stime}</td>
							    <td>${r.ltime }</td>
							    <td>${r.rid.houseType}</td>
							    <td>${r.rid.regPrice}</td>
							    
							    <td><div class="button-group">
										<a  id="tuifang" href="orders/order_delete?oid=${r.oid}" class="button border-red"
											><span class="icon-trash-o"></span>
										退房</a>
									</div>
					
									</td>
							    </tr>
							    </c:forEach>
							  
							
						</tbody>

                </table>
            </div>
        </form>
            <form method="post" action="">
            <div class="panel admin-panel">
                <div class="panel-head"><strong class="icon-reorder">食物订单</strong></div>
                <table class="table table-hover text-center" id="order_wait"
                 style="width:700px;float:left;">
                    <thead>
                    <tr>
                        <th>菜品名称</th>
                        <th>菜品价格</th>
                        <th>菜品图片</th>
                        <th>菜品类型</th>

                    </tr>
                    </thead>

						<tbody>
						<c:forEach items="${foodorderlist}" var="f">
							<tr>
								<td>${f.fname}</td>
								<td>${f.fprice}</td>
								<td>
							     <div class="field">
                               <img src="${f.fimg}"  style="height:96px;"/>
                               </div>
                              </td>
							    <td>${f.type}</td> 
							    </tr>
							   </c:forEach> 
							
						</tbody>

                </table>
                 <table class="table table-hover text-center" style="width:300px;">                        
                    <thead>
                    <tr>
                         <th style="wdith:100px;">菜品数量</th>
                         <th>操作</th>
                    </tr>
                    </thead>
						<tbody>
						<c:forEach items="${foodorders}" var="fo">
							<tr>
								<td style="height:114px;">${fo.count}</td>
							    </tr>
							   </c:forEach> 
							
						</tbody>

                </table>
            </div>
        </form>
        	
        <script >

            function del(id){
                if(sessionStorage['aType']==1){
                    if(confirm("您确定要删除吗?")){
                        $.ajax({
                            url:"data/delete_order.php",
                            data:{oid:id},
                            success:function(data){
                                if(data.msg="succ"){
                                    alert("删除成功");
                                    wait(1);
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
        <div class="malog">
            <div class="info">
                <!--客房订单-->
                <div class="form-group">
                    <a href="save_booking.html"  class="button button-block bg-green text-center" id="save_booking" >处理客房订单</a>

                </div>
                <div class="form-group">
                    <a href="save_dish.html"  class="button button-block bg-red text-center" id="save_dish" >处理餐饮订单</a>
                </div>
                <!--<h2>添加入住表</h2>-->
                <!--<div class="form-group">-->
                    <!--<label for="name">姓名</label>-->
                    <!--<input type="text" id="name" name="name" class=" input input-big border-red"/>-->
                <!--</div>-->
                <!--<div class="form_group">-->
                    <!--<label for="room">房间号</label>-->
                    <!--<select class="form-control room_list" id="room">-->
                        <!--<option>请选择---</option>-->
                    <!--</select>-->
                <!--</div>-->
                <!--<div class="form_group">-->
                    <!--<label ></label>-->
                    <!--<input type="button" name="btn_ton" value="提交" class="button button-block bg-green"/>-->
                <!--</div>-->
            </div>
        </div>
    </div>
</div>

<div style="text-align:center;">
</div>
</body>
</html>
