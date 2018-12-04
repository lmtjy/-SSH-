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

<script type="text/javascript">
function fen(page){
	var url='foods/foods_queryDishByPage?page='+page;
	location=url;
}

var msg='${msg}';
if(msg!=""){
	alert(msg);	
}

function deletefoods(id) {
	if(confirm("确定要删除吗？")){
		
	$.post("foods/foods_delete",{"foods.fid":id},function(data){
		if(data){
			alert("删除成功！！！")
		}else{
			alert("删除失败！！！")
		}
		location.reload();
	});
	
	}
	
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
        <form method="post" action="">
            <div class="panel admin-panel">
                <div class="panel-head"><strong class="icon-reorder"> 全部菜单</strong></div>
                <div class="padding border-bottom">
                    <ul class="search">
                        <li>
                            <button type="button"  class="button border-green" id="checkall" ng-click="checkAll()"><span class="icon-check"></span> 全选</button>
                            <button type="submit" class="button border-red" ng-click="DelSelect()"><span class="icon-trash-o"></span> 批量删除</button>
                        </li>
                        <li class="rt">
                            <a href="manage/add_dish.jsp"  class="button border-green " id="add" >添加菜单</a>
                        </li>
                    </ul>
                </div>
                <table class="table table-hover text-center" id="all_dish">
                    <thead>
                        <tr >
                            <th width="120">ID</th>
                            <th>海报</th>
                            <th width="120">菜品名称</th>
                            <th>详情</th>
                            <!--<th >分类</th>-->
                            <th width="120">单价</th>
                            <th width="120">数量</th>
                            <th>操作</th>
                        </tr>
                    </thead>

                    <tbody>
                    <s:iterator value="list">
                    <tr >
                        <td><input type="checkbox" name="id[]" data-nid="<s:property value="fid"/>" value="<s:property value="fid"/>" />
                            <s:property value="fid"/></td>
                        <td class="fImg"><img src="<s:property value="fimg"/>" alt=""/></td>
                        <td>
                            <textarea><s:property value="fname"/></textarea>
                        </td>
                        <td><div text-align:center>
                            <textarea cols="13" rows="7"><s:property value="fintr"/></textarea>
                        </div>
                        </td>
                        <td><s:property value="fprice"/></td>
                        <td><s:property value="fcount"/></td>
                        <td><div class="button-group" style="text-align:center;">
                        <a class="button border-green" href="foods/foods_update?foods.fid=<s:property value="fid"/>" >
                             <span class="icon-trash-o"></span> 修改</a>
                        <a class="button border-red" href="javascript:void(0)" onclick="deletefoods(<s:property value="fid"/>)">
                             <span class="icon-trash-o"></span> 删除</a>
						</div></td>
                    </tr>
                    </s:iterator>
                    </tbody>
                     <tfoot>
                         <tr>
                             <td colspan="8">
                                 <div class="pagelist">
                                     <!-- <a href="">上一页</a> -->
                                     <!--<div class="page">-->
                                         <!--&lt;!&ndash;<a class="current" ng-click="newPage(1,'000');">1</a>&ndash;&gt;-->
                                         <!--&lt;!&ndash;<a href="" ng-click="newPage(2,'000')" >2</a>&ndash;&gt;-->
                                         <!--&lt;!&ndash;<a href="" ng-click="newPage(3,'000')">3</a> &ndash;&gt;-->
                                     <!--</div>-->

                                     <!--<a href="">下一页</a>-->
                                     <!--<a href="">尾页</a>-->
                                                                                        当前页:${page} 
                              <a  href="foods/foods_queryDishByPage?page=1">首页</a> 
                              <a  class="before" href="foods/foods_queryDishByPage?page=${shang}">上一页</a> 
                              <a  class="next" href="foods/foods_queryDishByPage?page=${xia}">下一页</a>
				              <a href="foods/foods_queryDishByPage?page=${pagecount}">尾页</a> 总页数:${pagecount}
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

