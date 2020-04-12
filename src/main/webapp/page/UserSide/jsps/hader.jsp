<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>

<div class="header">
	<a href="${ctx}/shop/home.html" class="logo" title="宅客微购"><img src="images/logo.png" alt="宅客微购" /></a>
	<div class="header_center">
		<div class="search">
			<form action="${ctx}/shop/search.html" name="Searchform" method="post">
				<p>
					<input type="text" name="mingchen" placeholder="输入您想要的商品"
						class="search" /><a rel="nofollow" href="javascript:vod(0)"
						class="search_btn"></a>
				</p>
				<input type="hidden" name="p" value="1" />
			</form>
		</div>
		<div class="tag">
			热门搜索： 
			<a href="${ctx}/main/detail.html?pid=1">牛仔裤</a>
			<a href="${ctx}/main/detail.html?pid=2">迷你小白裙</a>
			<a href="${ctx}/main/detail.html?pid=3">洗头水</a>
			<a href="${ctx}/main/detail.html?pid=6">百香果</a>
			<a href="${ctx}/main/detail.html?pid=7">iPhoneX</a>
			<a href="${ctx}/main/detail.html?pid=8">吹风机</a>
		</div>
	</div>
	
	<div class="top_right">
	  <c:if test="${user_session.nickname == null}">
	    <a  href="${ctx}/page/UserSide/store.jsp" class="shopping_cart" style="float: left;">商家注册</a>
	  </c:if>	  
	    
		<a rel="nofollow" href="${ctx}/cart/select.html" class="shopping_cart" id="shopping_cart"
			style="display:">购物车<span id="docerCartBtn" class="yellow"></span></a>
		
		<div id="goods" class="sc_goods" style="display:none;">
			<ul class="sc_goods_ul">
				<!-- 查询购物车 -->
				  <c:forEach items="${gwc}" var="g">
					<li>
						<dl>
							<dt class="mini-img">
								<a href="product/detail.html?pid=${g.gid }"><img
									src="${g.pimage }" height="40" width="40" /></a>
							</dt>
							<dd>
								<span class="mini_title"><a
									href="product/detail.html?pid=${g.pid}">${g.pname }</a></span> <span
									class="mini-cart-count red"> ￥ ${g.sellprice }<em
									class="${g.gid }">*${g.num }</em></span>
							</dd>
							<dd>
								<span class="mini-cart-info"></span> <span
									class="mini-cart-del"><a name="${g.gid }" rel="del"
									onclick="delcommon(event);return false;">删除</a></span>
							</dd>
						</dl>
					</li>
				</c:forEach>
				<c:if test="${fn:length(gwc)==0}">
					<p class="sc_goods_none">您的购物车还是空的，赶紧行动吧！</p>
				</c:if>
			</ul>
			<div class="sc_goods_foot" <c:if test="${fn:length(gwc)==0 }">style="display:none;"</c:if>>
				<a rel="nofollow" href="${ctx}/cart/select.html" class="my_shopping_cart_btn">查看我的购物车</a>
			</div>
		</div>
	</div>
</div>