
function bdtj(){
	var sj=$('#phone').val();
    var mm=$('#password').val();
    var yz=$('#yanzheng').val();
   $.ajax({
	type:'post', //传送的方式,get/post
	url:'user/login.html', //发送数据的地址
	data:{
		phone:sj,password:mm,yanzheng:yz
	 },
	dataType: "json",
	success:function(data){
	if(data.msg=="ok"){
		 window.location.href="shop/home.html";
	}else if(data.msg=="cuo"){
		alert("验证码错误！");
		changeImage();//验证码输入错误刷新图片
		$('#yanzheng').val(""); 
	}else if(data.msg=="no"){
	    alert("用户名或密码错误！");
	}else{
	   alert("登录失败");
	};
	},error:function (XMLHttpRequest, ajaxOptions, thrownError) {
		alert("操作异常！"); 
	}
  });
}