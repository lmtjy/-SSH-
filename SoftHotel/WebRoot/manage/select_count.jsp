<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
    <script src="manage/js/echarts.min.js"></script>
</head>
<body style="background-color:#f2f9fd;"  >
<!--头部-->
<div id="header">

</div>

<!--内容容器-->
<div class="admin">
    <div id="view">
        <div class="panel admin-panel">
            <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>销量统计</strong></div>
            <div class="body-content">
                   <button class="button border-green " onclick="showPic(2)">客房销量</button>
                   <button class="button  border-red" onclick="showPic(1)">餐饮销量</button>
            </div>
            <div id="room" style="height:400px;">

            </div>
            <script>
            function showPic(type){
                $.ajax({
                    url: 'orders/order_sum',
                    data: {},
                    success: function (msg) {
                    	msg=$(msg).html();
                    	msg=$.parseJSON(msg);
                    	console.log(msg);
               
                   
                        var myChart = echarts.init(document.getElementById('room'));
                        var xList=[];
                        for(var i=0;i<msg.length;i++){
                            xList.push("【"+msg[i].houseType +"】")
                        }
                        console.log(xList)
                        var  seriesdata=[];
                        for(var i=0;i<msg.length;i++){
                            var item={
                                value:msg[i].bookNum,
                                title:msg[i].houseType
                            }
                            seriesdata.push(item);
                        }
                        var title='';
                        if(type==1){
                            title='餐饮销量统计';
                        }else{
                            title='客房销量统计';
                        }
                        var option = {
                            color: ['#3398DB'],
                            title: {
                                text: title
                            },
                            grid: {
                                left: '3%',
                                right: '4%',
                                bottom: '3%',
                                containLabel: true
                            },
                            tooltip: {
                                trigger: 'axis',
                                axisPointer : {            // 坐标轴指示器，坐标轴触发
                                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                                }
                            },
                            legend: {
                                data:['销量']
                            },
                            xAxis: {
                                data: xList
                            },
                            yAxis: {},
                            series: [{
                                name: '预定数量',
                                type: 'bar',
                                data:seriesdata
                            }]
                        };

                        // 使用刚指定的配置项和数据显示图表。
                        myChart.setOption(option);
                    }
                });
            }
                $(document).ready(function() {

                    showPic(2);
                });
              
            </script>
        </div>
    </div>
</div>
<div style="text-align:center;">

</div>
<script>
    $(document).ready(function(){
         setnav("销量统计");
        console.log($("#add_admin"));
        $("#add_admin").click(function(){
            console.log($("#admin_form").serialize());
            var str=$("#admin_form").serialize();
            $.ajax({
                url:"data/add_admin.php",
                data:str,
                success:function(data){
                    if(data.msg="succ"){
                        alert("添加成功");
                    }else if(data.msg="err"){
                        alert("添加失败");
                    }
                }
            })
        })
    })
</script>
</body>
</html>





