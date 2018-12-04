/**
 * Created by HNJD-001 on 2016/11/29.
 */
$.ajax({
  url:'room/myorder_myOrder',
  data:{uname:sessionStorage['loginName']},
  success:function(data){
	var str = $(data).html(); 
	data = JSON.parse(str);
	//alert(data["food"]+"---"+data["room"]);
    var html="";
    var total=0;
    if(data["foodList"]){
      $.each(data["foodList"],function(i,dish){
        html+=`
                <tr>
              <td>
                <img src="${dish.fimg}">
              </td>
              <td>${dish.fname}</td>
              <td>￥${dish.fprice}</td>
              <td>${dish.count}</td>
                <td>￥${dish.fprice*dish.count}</td>
            </tr>
                `;
        total+=dish.fprice*dish.count;
      });
    }
    if(data["roomList"]){
      $.each(data["roomList"],function(i,room){
        html+=`
                <tr>
              <td><img src="${room.rpic}"></td>
              <td>${room.houseType}</td>
              <td>￥${room.proPrice}</td>
              <td>${room.count}</td>
              <td>￥${room.proPrice*room.count}</td>
            </tr>
                `;
        total+=room.proPrice*room.count
      });
    }
    $(".total").children("span").html("￥"+total);
    $("table tbody").html(html);
    $("input[name='price']").prop("value",total);
    //精简购物车详情数组，编码为JSON字符串，赋值给input隐藏域用于表单
    $.each(data.food,function(i,f){
      delete(f.fname);  //只保留productId和count,type
      delete(f.fprice);
      delete(f.fimg);
      delete(f.checked);
    });
    $.each(data.room,function(i,r){
      delete(r.houseType);  //只保留productId和count,type
      delete(r.proPrice);
      delete(r.rPic);
      delete(r.checked);
    });
    //var foodList = JSON.stringify(data.food); //把JS的数组编码为JSON字符串
   // var roomList = JSON.stringify(data.room);
   // $('input[name="foodList"]').val(foodList);
   // $('input[name="roomList"]').val(roomList);
  }

});
$(".btn_sumit").click(function(){
  $('input[name="uname"]').val(sessionStorage['loginName']);
  var order=$("#form_order").serialize();
  $.ajax({
    url:"room/myorder_confirmOrder",
    data:order,
    type:"POST",
    success:function(data){
    		var str = $(data).html(); 
    		data = JSON.parse(str);
            $("div.malog").show();
            if(data!=null){
              $("div.succ").show();
               $("div.malog .orderNum").html(data);
               var i=5;
				 var timer=setInterval(function(){
					 i--;
					 $(".malog .num").html(i);
					 if(i==0){
						 location.href="room/myorder_toMyorder";
						 clearInterval(timer);
					 }
				 },1000);
            }else{
              $("div.malog .message").html("其他数据类型错误！");
            }
    }
  })
})
