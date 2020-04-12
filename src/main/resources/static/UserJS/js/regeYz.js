
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
		/*if(!yhmzz.exec(username)){
			regejc.innerHTML="<font color='red' size='-1'>格式有误</font>";
			uname.style.border="1px solid red";
			nameisyz = false;
			return;
		}*/
		
		//发送异步请求验证当前用户名是否可用
		$.ajax({
		type:'post',
		url:'main/checkname', //发送数据的地址
		data:{
			uname:username
		 },
		dataType: "json",
		success:function(data){
			if(data.code==400){
				regejc.innerHTML="<font color='green' size='-1'>ok</font>";
				uname.style.border="1px solid #C5C1C1";
				nameisyz = true;
			}else if(data.code==200){
				regejc.innerHTML="<font color='red' size='-1'>此昵称已存在</font>";
				uname.style.border="1px solid red";
				nameisyz = false;
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
	  //验证码
  
}