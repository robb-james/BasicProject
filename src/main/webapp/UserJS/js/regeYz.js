
nameisyz = false; //用户名验证
sjhyz = false; //手机号验证
yzmisyz = false; //验证码验证
mmyz = false; //密码验证
rmmyz = false; //重复密码验证

window.onload=function(){
	yhmzz = /^(?![^a-zA-Z]+$)(?!\D+$).{6,15}$/; //用户名正则 
	//用户名失去焦点事件  验证用户名格式是否正确 及用户名是否可用
	uname.onblur=function(){
		var username=frm.uname.value; //昵称
		//验证用户名格式是否正确
		if(!yhmzz.exec(username)){
			regejc.innerHTML="<font color='red' size='-1'>格式有误</font>";
			uname.style.border="1px solid red";
			nameisyz = false;
			return;
		}
		
		//发送异步请求验证当前用户名是否可用
		$.ajax({
		type:'post',
		url:'user/checkname.html', //发送数据的地址
		data:{
			uname:username
		 },
		dataType: "json",
		success:function(data){
			if(data.msg=="ok"){
				regejc.innerHTML="<font color='green' size='-1'>ok</font>";
				uname.style.border="1px solid #C5C1C1";
				nameisyz = true;
			}else if(data.msg=="no"){
				regejc.innerHTML="<font color='red' size='-1'>no</font>";
				uname.style.border="1px solid red";
				nameisyz = false;
			}
		 }
		});
	};
	
	//手机号正则 
	sjhzz = /^1[3|5|7|8|][0-9]{9}$/; 
	//手机号失去焦点事件  验证手机号格式是否正确 及手机号是否可用
	phone.onblur=function(){
		var sjh=frm.phone.value; //手机号
		//验证手机号格式是否正确
		if(!sjhzz.exec(sjh)){
			shouji.innerHTML="<font color='red' size='-1'>格式有误</font>";
			phone.style.border="1px solid red";
			sjhyz = false;
			return;
		}
		
		//发送异步请求验证当前手机号是否可用
		$.ajax({
		type:'post',
		url:'user/checkphone.html', //发送数据的地址
		data:{
			phone:sjh
		 },
		dataType: "json",
		success:function(data){
			if(data.msg=="ok"){
				shouji.innerHTML="<font color='green' size='-1'>ok</font>";
				phone.style.border="1px solid #C5C1C1";
				sjhyz = true;
			}else if(data.msg=="no"){
				shouji.innerHTML="<font color='red' size='-1'>no</font>";
				phone.style.border="1px solid red";
				sjhyz = false;
			}
		 }
		});
	};
	
	//密码失去焦点事件
	tpassword1.onblur=function(){
		if(tpassword1.value!=""){
			mm.innerHTML="<font color='green' size='-1'>ok</font>";
			tpassword1.style.border="1px solid #C5C1C1";
			rmmyz = true;
		}else{
			mm.innerHTML="<font color='red' size='-1'>请输入密码</font>";
			tpassword1.style.border="1px solid red";
			rmmyz = false;
		}
	};
	
	//确认密码失去焦点事件
	tpassword2.onblur=function(){
		if(tpassword1.value==""){
			//请先填写上方密码
			mm2.innerHTML="<font color='red' size='-1'>请输入上方密码</font>";
			tpassword1.style.border="1px solid red";
			mmyz = false;
		}else{
			//验证两次密码是否一致
			if(tpassword1.value!=tpassword2.value){
				//两次密码输入不一致
				mm2.innerHTML="<font color='red' size='-1'>两次密码不一致</font>";
				tpassword2.style.border="1px solid red";
				mmyz = false;
			}else{
				mm2.innerHTML="<font color='green' size='-1'>ok</font>";
				tpassword2.style.border="1px solid #C5C1C1";
				mmyz = true;
			}
		}
	};
	
	//验证图像验证码
	yanzheng.onblur=function(){
		yz = yanzheng.value;
		$.ajax({
			type:'post',
			url:'user/checkyzm.html', //发送数据的地址
			 data:{
				 yanzheng:yz
			 },
			 dataType: "json",
			success:function(data){
				if(data.msg=="no"){
					tyzm.innerHTML="<font color='red' size='-1'>on</font>";
					yanzheng.style.border="1px solid red";
					changeImage();//验证码输入错误刷新图片
					yzmisyz = false;
				}else if(data.msg=="ok"){
					tyzm.innerHTML="<font color='green' size='-1'>ok</font>";
					yanzheng.style.border="1px solid #C5C1C1";
					yzmisyz = true;
				}
			}});
	};
};
 
//注册表单的submit处理事件
function bdtj(){
	if(nameisyz && yzmisyz && mmyz && rmmyz){
		//frm.submit(); //验证通过  提交
		var yh=$('#uname').val();
	    var sj=$('#phone').val();
	    var mm=$('#tpassword1').val();
	    var yz=$('#yanzheng').val();
	    var js=$('#rid').val();
	    
	   $.ajax({
		type:'post', //传送的方式,get/post
		url:'user/register.html', //发送数据的地址
		data:{
			uname:yh,phone:sj,rid:js,
			password:mm,yanzheng:yz,
		 },
		dataType: "json",
		success:function(data){
		if(data.msg=="ok"){
			 alert("恭喜您，账号注册成功啦！");
			 window.location.href="user/jumplogin.html";
		}else if(data.msg=="no"){
			alert("注册失败");
		}else{
			alert("信息填写有误！");
		};
		},error:function (XMLHttpRequest, ajaxOptions, thrownError) {
			alert("操作异常！"); 
		}
	  });
	}else{
		alert("请填写完整");
	}
}