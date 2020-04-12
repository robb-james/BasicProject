<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>登录--后台管理</title>
    <link rel="icon" href="favicon.ico">
    <link rel="stylesheet" href="${ctx }/static/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${ctx }/static/css/login.css" media="all" />
    <link rel="stylesheet" href="${ctx }/static/css/loginmain.css" media="all" />
    
    <script>  
        var ctx = "${ctx}";  
    </script>
    <script type="text/javascript">
        if(window !=top){
            top.location.href=location.href;
        }
    </script>
</head>
<body>


<div  class="video_mask"></div>
<div class="login">
    <h1>登录</h1>
    <form class="layui-form" id="form">
        <div class="layui-form-item">
            <input class="layui-input" name="username" placeholder="手机号" lay-verify="required" type="text" autocomplete="off">
        </div>
        <div class="layui-form-item">
            <input class="layui-input" name="password" placeholder="密码"   lay-verify="required" type="password" autocomplete="off">
        </div>
        <div class="layui-form-item form_code">
            <input class="layui-input" style="width: 140px;" name="vcode" placeholder="验证码" lay-verify="required" type="text" autocomplete="off" maxlength="4">
            <div class="code"><img id="captcha" src="${ctx }/sys/vcode" width="100" height="36" onclick="refreshCode(this)"></div>
        </div>
       <div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" lay-submit="" lay-filter="login" id="btn">登 录</button>
						</div>
		</div>
      <!--   <button class="login100-form-btn" lay-submit="" lay-filter="login" id="btn">登录</button> -->
    </form>
</div>
<script type="text/javascript" src="${ctx }/static/layui/layui.js"></script>
<script type="text/javascript" src="${ctx }/static/js/login.js"></script>
</body>
</html>