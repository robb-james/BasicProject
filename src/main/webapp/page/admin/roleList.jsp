<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ include file="/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>文章列表</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
<meta http-equiv="expires" content="Wed, 26 Feb 1997 08:21:57 GMT">
<link rel="stylesheet" href="${ctx }/static/layui/css/layui.css" media="all" />
<link rel="stylesheet" href="${ctx }/static/css/font_eolqem241z66flxr.css"
	media="all" />
<link rel="stylesheet" href="${ctx }/static/css/list.css" media="all" />
<script>
	var ctx = "${ctx}";
</script>
</head>
<body class="childrenBody">
	<blockquote class="layui-elem-quote list_search">
		<shiro:hasPermission name="sys:role:save">
			<div class="layui-inline">
				<a class="layui-btn layui-btn-normal roleAdd_btn"><i
					class="layui-icon">&#xe608;</i> 添加角色</a>
			</div>
		</shiro:hasPermission>
		<shiro:hasPermission name="sys:role:delete">
			<div class="layui-inline">
				<a class="layui-btn layui-btn-danger batchDel"
					data-type="delCheckData"><i class="layui-icon">&#xe640;</i>批量删除</a>
			</div>
		</shiro:hasPermission>
	</blockquote>
	<!-- 数据表格 -->
	<table id="roleList" class="roleList" lay-filter="roleList"></table>
	<script type="text/javascript" src="${ctx }/static/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx }/static/js/roleList.js"></script>
	<script type="text/html" id="barEdit">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>
</body>
</html>