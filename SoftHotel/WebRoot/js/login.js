/***登陆界面***/
   $("#check_box").on("click","input",function(e){
        var $target=$(e.target);
		if($target.hasClass("method_normal")){
		    $target.parent().siblings("#normal").show();
            $target.parent().siblings("#phone_login").hide();
		}else if($target.hasClass("method_phone")){
		    $target.parent().siblings("#phone_login").show();
            $target.parent().siblings("#normal").hide();
		}
   });
   $("#bt_login").click(function(){
	   var uname=$("#normal [name='uname']").val();
	   //alert(uname);
	 
	   var val=code;	
	   //alert(val);
	   var upwd=$("#normal [name='upwd']").val();//用户名的密码
	   var phone=$("#phone_login [name='phone']").val();	 
	   var pwd=$("#phone_login [name='pwd']").val();//手机号的验证码
	   var t1=document.getElementById("t1").value;     
	   if(uname!=""&& uname!=null&&t1!=""&& t1!=null){ 
		   if(t1==''||t1==null){
		    	 $("#validate").html("请输入验证码"); 
		        return ;
		         }	else if(val!=t1){
		        	 //alert("aaaaaa");
		        	 $("#validate").html("验证码错误"); 
		        	 window.onload();
		        	 return ;
		         }
	   $.ajax({
	        url:'login_denglu',
			data:{uname:uname,upwd:upwd},
			success:function(data){
				var str = $(data).html(); 
				data = JSON.parse(str);
				if(data==1){							
					location='login_index';
				}else{
					alert("登录失败,请重新登录");
					location="login_denglu";
				}
				}	
	   });  
	   }
	  
	     if(phone!=""||phone!=null && pwd!=""||pwd!=null ){ 
	    	 if(phone==''||phone==null){
	    		  $("#phone_validate").html("请输入手机号码");
			        return ;
			         }	
	    	  if(pwd==''||pwd==null){
	    		  $("#phone_validate").html("请输入验证码");
			        return ;
			         }	
	    	  
	    	// alert("進入phone");
	    	 // alert(pwd);
		   $.ajax({
		        url:'login_phonepwd',
				data:{uphone:phone,upwd:pwd},
				success:function(data){
					//alert(data);
					var str = $(data).html(); 
					data = JSON.parse(str);
					if(data==1){
						//alert("成功");
						location='login_index';
					}else{
						alert("登录失败,请重新登录");
						location="login_denglu";
					}
					}	
		   });   }
	  
   });  
   $(function(){ 
		//发送短信验证码
	   var pwd=$("#phone_login [name='pwd']").val();
		$(".sendVerifyCode").on("click", function(){			
			var $mobile = $("input[name=phone]");
			var data = {};
			data.mobile = $.trim($mobile.val());
			if(data.mobile == ''){
				$("#phone_validate").html("请输入手机号码");
				//alert('请输入手机号码');
				return;
			}
			var reg = /^1\d{10}$/;
			if(!reg.test(data.mobile)){
				$("#phone_validate").html("请输入合法的手机号码");
				//alert('请输入合法的手机号码');
				return ;
			}
			$.ajax({
		        url: "login_sendMassage",
		        async : true,
		        type: "post",
		        dataType: "text",
		        data: data,
		        success: function (data) {			        	
		        	if(data == 'success'){
		        		countdownHandler();
		        		return ;
		        	}
		        	alert(data);
		        }
	    	});
		});
		
		//短信验证码倒计时
		var countdownHandler = function(){
			var $button = $(".sendVerifyCode");
			var number = 60;
			var countdown = function(){
				if (number == 0) {
					$button.attr("disabled",false);
					$button.html("发送验证码");
		            number = 60;
		            return;
		        } else {
		        	$button.attr("disabled",true);
		        	$button.html(number + "秒 重新发送");
		        	number--;	        	
		        }
				setTimeout(countdown,1000);
			};
			setTimeout(countdown,1000);
		};
	});
   
   
   //记住我7天
   $(function(){
		if ($.cookie("rmbuser") == "true") { 			
//			$("#rmbuser").attr("checked", true); 
			$("#uname1").val($.cookie("uname")); 
			$("#upwd1").val($.cookie("upwd")); 
			$("#rmbuser").attr('checked','true');			
		} 
		
	}); 
	 
	var count=1;
	//保存用户信息 
	function saveuserinfo() { 
		count=count+1;
		if(count%2==1) { 
			$.cookie("rmbuser", "false", { expires: -1 }); 
			$.cookie("uname", '', { expires: -1 }); 
			$.cookie("upwd", '', { expires: -1 }); 		
		} 
		else { 
			//alert($("#rmbuser").attr("checked"));
			var username = $("#uname1").val(); 
			var password = $("#upwd1").val(); 
			$.cookie("rmbuser", "true", { expires: 7 }); // 存储一个带7天期限的 cookie 
			$.cookie("uname", username, { expires: 7 }); // 存储一个带7天期限的 cookie 
			$.cookie("upwd", password, { expires: 7 }); // 存储一个带7天期限的 cookie 
			
		} 
	}

