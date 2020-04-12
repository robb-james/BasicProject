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
<title>用户注册</title>
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
<script type="text/javascript" src="${ctx}/static/UserJS/js/regeYz.js"></script>

<style type="text/css">
.zhuce {
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
.btn { 
		    border: 0;
		    width:110px;
		    height:30px;  
		    line-height: 36px; 
		    float:left;
		    color: white;
		    background-color: #08c;
		    text-align: center;
		    text-decoration: none;
		}
</style>
</head>
<body>
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
	<!-- 顶部工具条 结束 -->
	<!-- /工具条 -->
	<!-- 头部 -->
	<div class="wrapper-cart">
		<!-- 导航条 -->
		<div class="header-wrap">
			<a href="${ctx}/shop/home.html" class="logo" title="宅客微购"> <img
				src="images/logo.png" alt="宅客微购"> </a>
			<div class=""></div>
		</div>
		<!-- /头部 -->

		<!-- 主体 -->
		<div class="wrapper-order" style="margin-bottom: -120px;">
			<section>
			<div class="mainwrap">
				<div class="think-form"
					style="background: #F1F1F1;border-radius:5px;">
					<div class="loginform">
						<a rel="nofollow" href="javascript:void(0)" class="img"> <img
							src="images/logo-3.jpg" height="300" width="400"> </a>
					</div>
					<div class="login-other" style="margin-top: 30px;">
						<form name="frm" class="form-horizontal" role="form" method="post">
							<input type="hidden" id="rid" name="rid" value="2"/>
							<div class="control-group">
								<div class="controls">
									<em class="user glyphicon glyphicon-user"></em> <input
										id="uname" class="v_inp" placeholder="请输入用户名" name="uname"
										type="text"> <label id="regejc"></label>
								</div>
							</div>
							
							<div class="control-group">
								<div class="controls">
									<em class="user glyphicon glyphicon-user"></em> <input
										id="phone" class="v_inp" placeholder="请输入手机号" name="phone"
										type="text" maxlength="11"> <label id="shouji"></label>
								</div>
							</div>

							<div class="control-group">
								<div class="controls">
									<input id="tpassword1" class="v_inp" placeholder="请输入密码"
										name="password" type="password"> <label id="mm"></label>
								</div>
							</div>

							<div class="control-group">
								<div class="controls">
									<input id="tpassword2" class="v_inp" placeholder="请再次输入密码"
										name="repassword" type="password"> <label id="mm2"></label>
								</div>
							</div>
							<div class="control-group">
								<div class="controls">
						<input id="yanzheng" class="v_inp" placeholder="请输入验证码" name="yanzheng" type="text" style="width: 190px;float: left;">
                          <input type="button" class="btn" id="code"  onclick="codeButton()" value="获取验证码" />
                          
                          <label id="tyzm" style="line-height: 28px;margin-left: 5px;"></label>
								</div>
							
							</div>

							<div class="control-group">
								<div class="controls">
									<button type="button" class="zhuce" onclick="bdtj()">注 册</button>
								</div>
								<div style="margin-top: 10px;">
									<span>已有帐号？<a href="${ctx}/user/jumplogin.html"
										style="color: red;">点击登录</a>
									</span>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			</section>
		</div>
		<!-- /主体 -->
		<!-- 底部 -->
		<!-- 底部-->
	</div>
	<%@ include file="jsps/footer.jsp"%>
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
	var checkCode = "";
	var mm = /^1[3|5|7|8|][0-9]{9}$/;
	function codeButton() {
		var phone = $("#phone").val();

		if (phone == null || phone == "") {
			alert("请输入手机号！！！");
			return;
		}
		//验证手机号格式是否正确
		if (!mm.exec(phone)) {
			alert("请输入正确的手机号");
			return;
		}
		//发送异步请求验证当前手机号是否可用
		$.ajax({
					type : 'post',
					url : 'main/checkphone', //发送数据的地址
					data : {
						phone : phone
					},
					dataType : "json",
					success : function(data) {
						
						if (data.code == 400) {
							$.ajax({
								url : "main/sendcodeNub?phone=" + phone,
								type : "post",
								success : function(text) {
									if (text != null && text != "") {
										checkCode = text.detail;
										alert("已发送");
									} else {
										alert("获取失败，请重新获取")
									}
								}
							});
							var code = $("#code");
							code.attr("disabled", "disabled");
							setTimeout(function() {
								code.css("opacity", "0.8");
							}, 1000)
							var time = 60;
							var set = setInterval(function() {
								code.val("(" + --time + ")秒后重新获取");
							}, 1000);
							setTimeout(
									function() {
										code.attr("disabled", false).val(
												"重新获取验证码");
										clearInterval(set);
									}, 60000);
						} else if (data.code == 200) {
							shouji.innerHTML = "<font color='red' size='-1'>此手机号已存在</font>";
							phone.style.border = "1px solid red";
							return;
						}
					}
				});
	}
	//注册表单的submit处理事件
	function bdtj() {
		//frm.submit(); //验证通过  提交
		var yh = $('#uname').val();
		var sj = $('#phone').val();
		var mm = $('#tpassword1').val();
		var js = $('#rid').val();
		var num = $("#yanzheng").val();
		if (num != checkCode) {
			alert("请输入正确的验证码")
			return;
		}
		$.ajax({
			type : 'post', //传送的方式,get/post
			url : 'main/register', //发送数据的地址
			data : {
				nickname : yh,
				phone : sj,
				type : js,
				password : mm
			},
			dataType : "json",
			success : function(data) {
				if (data.code == 200) {
					alert("恭喜您，账号注册成功啦！");
					window.location.href = "${ctx}  /main/login";
				} else if (data.code == 400) {
					alert("注册失败");
				} else {
					alert("信息填写有误！");
				}
			}
		});

	}
	</script>
	
	
</body>
</html>
