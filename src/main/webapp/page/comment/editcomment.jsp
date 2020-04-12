<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>编辑用户信息</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="${ctx }/static/layui/css/layui.css" media="all" />
<script>  
        var ctx = "${ctx}";  
    </script> 
<style type="text/css">
.layui-form-item .layui-inline {
	width: 33.333%;
	float: left;
	margin-right: 0;
}

@media ( max-width :1240px) {
	.layui-form-item .layui-inline {
		width: 100%;
		float: none;
	}
}
</style>
</head>
<body class="childrenBody">
	<form class="layui-form" style="width: 80%;">
		<!-- 管理员id -->
		<input type="hidden" name="uid" value="${user.uid }" id="uid"/>
		<div class="layui-form-item">
			<label class="layui-form-label">用户名称</label>
			<div class="layui-input-block">
				<input type="text" name="eMail" id="eMail" class="layui-input userName"
					lay-verify="email" placeholder="请输入邮箱" value="${comment.uname }">
			</div>
		<div class="layui-form-item">
			<label class="layui-form-label">商品名称</label>
			<div class="layui-input-block">
				<input type="text" id="nickname" class="layui-input userName"
					lay-verify="required" name="nickname" value="${comment.pname }">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">商品评分</label>
			<div class="layui-input-block">
				<input type="text" id="nickname" class="layui-input userName"
					lay-verify="required" name="nickname" value="${comment.score }">
			</div>
		</div>
		</div>
			<div class="layui-form-item">
			<label class="layui-form-label">评论内容</label>
			<div class="layui-input-block">
				<textarea rows="10" cols="40">${comment.content}</textarea>
			</div>
		</div> 

	</form>
	<script type="text/javascript" src="${ctx }/static/layui/layui.js"></script>

</body>
</html>