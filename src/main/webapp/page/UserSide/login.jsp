<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>用户登录</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="${ctx}/static/UserCSS/common.css" rel="stylesheet">
<link href="${ctx}/static/UserCSS/top.css" rel="stylesheet">
<link href="${ctx}/static/UserCSS/footer.css" rel="stylesheet">
<script type="text/javascript" src="${ctx}/static/UserJS/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/static/UserJS/js/public.js"></script>

<style type="text/css">
.denglu {
	border: medium none;
	background: none repeat scroll 0% 0% #FF4B01;
	font-size: 14px;
	color: #FFF;
	display: inline-block;
	cursor: pointer;
	border-radius: 3px;
	transition: all 0.3s ease-in-out 0s;
	width: 300px;
	height: 40px;
	line-height: 40px;
	color: #FFF;
	font-size: 18px;
	display: inline-block;
	overflow: hidden;
	text-align: center;
}
</style>

</head>

<body>
	<!-- 工具条 -->
	<!-- 顶部工具条 -->
	<div class="top">
		<div class="topbar">
			<span class="welcome" style="float:left;">欢迎光临宅客微购 ,请 <a
				href="${ctx}/user/jumplogin.html" class="red"> 登录</a>&nbsp; <a
				href="${ctx}/user/jumpzhuce.html"
				style="padding-left:0;padding-right:10px"> 免费注册 </a> </span> <span
				class="operate_nav"> <span id="account"
				style="background-color: rgb(245, 245, 245);"> <a
					rel="nofollow">我的账号&nbsp;</a><i id="icount"
					class="fa fa-angle-down"></i> </span>
				<ul id="dbox" class="top_lg_info_down" style="display: none;">
					<li><a rel="nofollow" href="userMain.page">个人中心</a></li>
				</ul> |</span> <span class="operate_nav"> <a rel="nofollow"
				href="${ctx}/user/jumplogin.html">我的订单</a> | </span> <span
				class="operate_nav"> <a href="${ctx}/cart/select.html"
				name="购物车" dd_name="购物车"> <i class="icon_card"></i>购物车<b
					id="cart_items_count"></b> </a> </span>
		</div>
	</div>
	<script type="text/javascript">
		//头部topbar会员中心显示与隐藏
		var Account = document.getElementById('account');
		var Downmenu = document.getElementById('dbox');
		var timer = null;//定义定时器变量
		//鼠标移入div1或div2都把定时器关闭了，不让他消失
		Account.onmouseover = Downmenu.onmouseover = function() {
			//改变箭头方向
			$("i#icount").attr("class", "fa fa-angle-up");

			//改变背景颜色
			Account.style.backgroundColor = '#fff';
			//显示下拉框
			$("#dbox").show();
			//关闭定时执行
			clearTimeout(timer);
		}

		//鼠标移出div1或div2都重新开定时器，让他延时消失
		Account.onmouseout = Downmenu.onmouseout = function() {
			$("i#icount").attr("class", "fa fa-angle-down");
			Account.style.backgroundColor = '#F5F5F5';
			//开定时器，每隔200微妙下拉框消失
			timer = setTimeout(function() {
				$("#dbox").hide();
			}, 200);
		}
	</script>
	<!-- 顶部工具条 结束 -->
	<!-- /工具条 -->
	<!-- 头部 -->
	<div class="wrapper-cart">
		<!-- 导航条 -->
		<div class="header-wrap">
			<a href="${ctx}/main/index" class="logo" title="宅客微购"> <img
				src="images/logo.png" alt="宅客微购" /> </a>
			<div class=""></div>
		</div>
		<!-- /头部 -->
		<!-- 主体 -->
		<div class="wrapper-order" style="margin-bottom: -120px;">
			<div class="mainwrap">
				<div class="think-form"
					style="background: #F1F1F1;border-radius:5px;">
					<div class="loginform">
						<a rel="nofollow" href="javascript:void(0)" class="img"> <img
							src="images/logo-3.jpg" width="400" height="300" /> </a>
					</div>
					<div class="login-other" style="margin-top: 50px;">
						<div class="control-group ">
							<div class="controls">
								<em class="user glyphicon glyphicon-user"></em> <input
									type="text" class="v_inp" id="phone" name="phone" maxlength="11"
									placeholder="请输入手机号码" /> 
									<label id="usernameYz"></label>
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<em class="user glyphicon glyphicon-lock"></em> <input
									type="password" class="v_inp" id="password"
									name="password" placeholder="请输入密码"  /> <label id="mm"></label>
								<c:remove var="loginFail" scope="session" />
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<input id="yanzheng" class="v_inp" placeholder="请输入验证码"
									name="yanzheng" type="text" style="width: 190px;float: left;">
								<a href="javascript:changeImage();"> <img
									src="${ctx}/main/verify"
									style="height: 28px;float: right;margin-right: 98px;"
									id="verifyCodeImage"> </a> <label id="tyzm"
									style="line-height: 28px;margin-left: 5px;"></label>
							</div>
						</div>
						<input name="reffer" type="hidden" value="" />
						<div class="control-group">
							<div class="controls">
								<button type="button" id="login_btn_cart" class="denglu"
									onclick="bdtj()">登 录</button>
							</div>

							<div style="margin-top: 10px;">
								<span>还没有账号？<a href="${ctx}/page/UserSide/register.jsp"
									style="color: red;">点击注册</a> </span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /主体 -->
			<!-- 底部 -->
			<!-- 底部-->
		</div>
	</div>
	<%@ include file="jsps/footer.jsp"%>
	<script type="text/javascript">
	/* 刷新验证码 */
	function genTimestamp() {
		var time = new Date();
		return time.getTime();
	}
	function changeImage() {
		$('#verifyCodeImage').attr('src','main/verify');
	};
	
	function bdtj(){
		var sj=$('#phone').val();
	    var mm=$('#password').val();
	    var yz=$('#yanzheng').val();
	   $.ajax({
		type:'post', //传送的方式,get/post
		url:'${ctx}/main/userlogin', //发送数据的地址
		data:{
			phone:sj,password:mm,code:yz
		 },
		dataType: "json",
		success:function(data){
		if(data.code==200){
			 window.location.href="${ctx}/main/index";
		}else if(data.code==500){
			alert("验证码错误！");
			changeImage();//验证码输入错误刷新图片
			$('#yanzheng').val(""); 
		}else if(data.code==400){
		    alert("用户名或密码错误！");
		}else{
		   alert("登录失败");
		};
		},error:function (XMLHttpRequest, ajaxOptions, thrownError) {
			alert("操作异常！"); 
		}
	  });
	}
	</script>
	<!-- /底部 -->
</body>
</html>
