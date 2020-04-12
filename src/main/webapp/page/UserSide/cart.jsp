<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<title>购物车</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="${ctx}/static/UserCSS/top.css" rel="stylesheet" />
<link href="${ctx}/static/UserCSS/footer.css" rel="stylesheet" />
<link href="${ctx}/static/UserCSS/common.css" rel="stylesheet" />

<script type="text/javascript" src="${ctx}/static/UserJS/js/public.js"></script>
<script type="text/javascript" src="${ctx}/static/UserJS/js/jquery-1.5.1.js"></script>

<c:if test="${user_session.uname == null}">
	<script type="text/javascript">
		window.location.href = "${ctx}/shop/home.html";
	</script>
</c:if>

</head>

<body>
	<%@ include file="jsps/top.jsp"%>

	<div class="wrapper-cart">
		<!-- 导航条 -->
		<div class="header-wrap">
			<a href="${ctx}/shop/home.html" class="logo" title="宅客微购"><img
				src="localhost:8080/static/images/logo.png" alt=""> </a>

			<div class="shopping_cart_procedure">
				<span>1、我的购物车</span><span> 2、填写订单</span><span
					style="width:175px; padding:0;">3、完成订单</span>
			</div>
		</div>
		<!-- /头部 -->

		<!-- 主体 -->
		<div class="wrapper-order">
			<div class="cartname">全部商品&nbsp;&nbsp;</div>
			<form action="tijiao" method="post" name="myform" id="form">

				<c:if test="${fn:length(carts)==0 }">
					<div class="shopcart_main_none">
						<div class="shopcart_main_none_img"></div>
						<div class="shopcart_main_none_main">
							<p>你的购物车还是空的哦赶紧行动吧!</p>
							<a href="${ctx}/shop/home.html">马上购物</a>
						</div>
					</div>
				</c:if>
				<c:if test="${fn:length(carts)!=0 }">
					<table id="table" class="gridtable">
						<thead>
							<tr>
								<th class="row-selected" width="80px"><input id="selectAll"
									class="checkbox check-all" checked="checked" type="checkbox">全选</th>
								<th width="150px">商品图片</th>
								<th width="300px">商品名称</th>
								<th width="100px">单价</th>
								<th width="100px">运费</th>
								<th width="100px">数量</th>
								<th width="100px">操作</th>
							</tr>
						</thead>
						<tbody>
							<!-- 购物车循环go -->
							<c:forEach items="${carts }" var="g">
								<!-- 库存 -->
								<input type="hidden" id="kucun" value="${g.stock}" />
								<tr class="cart_bottom" id="ceng${g.gid }">
									<td><input class="row-selected" value="${g.gid }"
										type="checkbox" name="checkboxBtn" checked="checked" />
									</td>
									<td><span> <a
											href="${ctx}/product/detail.html?pid=${g.pid }"> <img
												src="${g.pimage }" width="80" height="70"
												style="margin-left: 35px;"> </a> </span></td>

									<td align="center"><a
										href="product/detail.html?pid=${g.pid }"> <span>${g.pname
												}</span> </a>
									</td>
									<!-- 单价 -->
									<td align="center" id="${g.gid }Subtotal">${g.sellprice }</td>
									<!-- 运费 1060221021 -->
									<td align="center" id="${g.gid }yunfei">${g.freight }</td>
									
									<td align="center">
										<div class="quantity-form">
											<a class="jia" gid="${g.gid }">+</a>
											<!-- 加一件商品 -->
											<input type="text" class="goodnum" readonly="readonly"
												id="${g.gid }num" name="num[]" value="${g.num }"> <a
												class="jian" gid="${g.gid }">-</a>
											<!-- 减一件商品 -->
										</div></td>

									<td align="center"><a class="del"
										onclick="delgwc('${g.gid }')" id="${g.gid }">删除</a>&nbsp;</td>
								</tr>
							</c:forEach>
							<!-- 购物车循环end -->
						</tbody>
					</table>
					
					<div class="gwcfy">
					   <div class="gwzuo">
					      <span style="float: left;margin-left: 20px;">总计（含运费）：</span>
					      <span style="float: left;"><span class="price">¥</span><em class="price" id="total">0.00</em></span>
					      <span style="float: left;"><a id="jiesuan" class="jxgouwu" href="javascript:">去结算</a></span>
					      <span style="float: left;"><a class="jxgouwu" href="${ctx}/shop/home.html">继续购物</a></span>
					   </div>
					   
				 	   <div class="gwyou">
				 	   
				 	      <c:choose>
				 	       <c:when test="${page.pageNow == 1}">
					   	     <a href="${ctx}/cart/select.html?pageNow=${page.pageNow}">
					         <span class="gw_fy disabled">首页</span></a>
					       </c:when>
					       
					       <c:otherwise>
					         <a href="${ctx}/cart/select.html?pageNow=1">
					         <span class="gw_fy">首页</span></a>
					       </c:otherwise>
					      </c:choose>
					      
						<c:choose>  
							<c:when test="${page.pageNow - 1 > 0}">  
								<!--  当前页数大于0，显示上一页 -->
								<a href="${ctx}/cart/select.html?pageNow=${page.pageNow - 1}">
							    <span class="gw_fy">上一页</span></a>  
							</c:when>  
							
							<c:when test="${page.pageNow - 1 <= 0}"> 
								<!--  当前页数小于等于0，按钮无法点击 --> 
								<a href="${ctx}/cart/select.html?pageNow=1">
								<span class="gw_fy disabled">上一页 </span></a>  
						    </c:when>  
						</c:choose>
			
						<!-- 当前页数、总页数 -->
						<span class="sass">
							<font>${page.pageNow}</font>/${page.totalPageCount}
						</span>
						<!-- 当前页数、总页数 -->
			
						<c:choose>  
							<c:when test="${page.pageNow==page.totalPageCount || page.totalPageCount==0}">  
								<!--  当前页数等于总页数，按钮无法点击 -->
								<a href="${ctx}/cart/select.html?pageNow=${page.pageNow}">
								<span class="gw_fy disabled">下一页</span></a>  
							</c:when>  
							
							<c:when test="${page.pageNow + 1 < page.totalPageCount}">  
								<a href="${ctx}/cart/select.html?pageNow=${page.pageNow + 1}">
								<span class="gw_fy">下一页</span></a>  
							</c:when> 
							 
							<c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
								<a href="${ctx}/cart/select.html?pageNow=${page.totalPageCount}">
								<span class="gw_fy">下一页</span></a>  
							</c:when>  
						</c:choose> 
			
						<c:choose>  
							<c:when test="${page.pageNow == page.totalPageCount || page.totalPageCount==0}">  
								<!-- 当前页数等于总页数，按钮无法点击 -->
								<a href="${ctx}/cart/select.html?pageNow=${page.pageNow}">
								<span class="gw_fy disabled">尾页</span></a> 
							</c:when>  
							
							<c:otherwise>  
								<a href="${ctx}/cart/select.html?pageNow=${page.totalPageCount}">
								<span class="gw_fy">尾页</span></a>  
							</c:otherwise>  
						</c:choose> 
					   </div>
					</div>
				</c:if>
			</form>

			<!-- jQuery 遮罩层 begin -->
			<div id="fullbg"></div>
			<!-- end jQuery 遮罩层 -->

			<!-- 对话框 -->
			<div id="dialog">
				<!-- Modal 对话框内容 -->
				<div id="myModal" class="modal">

					<div class="modal-header">
						<a class="close" onclick="closeBg();"><img
							src="localhost:8080/static/images/close.png"> </a>
						<h3 id="myModalLabel">用户登录</h3>
					</div>
					<div class="m_img">
						<a class="" href="javascript:void(0)"><img src="localhost:8080/static/images/qq.png">&nbsp;用QQ账号登录</a><br>
						<br> <a class="" href="javascript:void(0)"><img
							src="localhost:8080/static/images/weibo.png">&nbsp;用微博账号登录</a>
					</div>
					<form class="form-horizontal" id="loginform" name="user"
						method="post">

						<div class="form_login">
							<input type="text" id="inputusername" name="phone"
								placeholder="手机号" maxlength="11">
						</div>

						<div class="form_login">
							<input class="v_yerhop" type="password" id="inputpassword"
								name="password" placeholder="密码">
						</div>

						<div class="form_login">
							<input type="text" id="yanzheng" name="yanzheng"
								placeholder="验证码" style="width: 100px;float: left;" /> <a
								href="javascript:changeImage();"> <img
								src="${ctx}/user/verify.html"
								style="height: 28px;float: right;margin-right: 98px;width: 65px;"
								id="verifyCodeImage"> </a>
						</div>

						<span class="tips"></span>
						<div class="form_login">
							<a id="login_btn">登录</a>
						</div>

						<div class="control-group">
							<p>
								<span class="pull-right"><span>还没有账号? <a
										href="${ctx}/user/jumpzhuce.html" class="now">立即注册</a> </span> </span>
							</p>
						</div>
					</form>
				</div>
				<!-- Modal 对话框内容 -->
			</div>
			<!-- 对话框 结束-->
			<!-- jQuery 遮罩层上方的对话框 -->

		</div>
		<!-- /主体 -->
		<!-- 底部 -->
		<!-- 底部-->
		<script type="text/javascript" charset="utf-8" src="${ctx}/static/UserJS/js/menudown.js"></script>
		<script type="text/javascript" src="${ctx}/static/UserJS/js/cart.js"></script>

	</div>
	<%@ include file="jsps/footer.jsp"%>
	<!-- 隐藏的提交表单 -->
	<form id="jieSuanForm" action="${ctx}/cart/tijiao.html" method="post">
		<input type="hidden" name="cartItemIds" id="cartItemIds" /> 
		<input type="hidden" name="total" id="hiddenTotal" /> 
		<input type="hidden" name="method" value="loadCartItems" />
	</form>
	<!-- /底部 -->
</body>

</html>
