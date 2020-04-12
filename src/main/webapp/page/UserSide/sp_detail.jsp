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

<title>商品详情</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="${ctx}/static/UserCSS/top.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx}/static/UserCSS/detail.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx}/static/UserCSS/footer.css" type="text/css"></link>

<script type="text/javascript" src="${ctx}/static/UserJS/js/public.js"></script>
<script type="text/javascript" src="${ctx}/static/UserJS/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/static/UserJS/js/layer/layer.js"></script>
<script type="text/javascript" src="${ctx}/static/UserJS/js/jisuan.js"></script>

</head>

<body>
	<!-- 顶部 -->
	<%@ include file="jsps/top.jsp"%>
	<!-- 顶部 -->
	<div class="yershop_wrapper">
			<!-- /头部 -->
			<%@ include file="jsps/hader.jsp"%>
			<!-- /头部 -->
			<!-- 菜单 -->
			<!-- 导航条-->
			<div class="menu-wrapper">
				<div class="nava">
					<div class="nav-all">
						<div class="all_class" id="all-class">
							<h2>
								<span class="grid"><img src="images/grid.png" /> </span><span>商品分类</span><b></b>
							</h2>
						</div>
						<div class="all-goods" style="display: none;" id="all-goods">
							<!-- 循环开始 -->
							<c:forEach items="${sel_big }" var="bigType">
								<div class="item">
									<div class="product">
										<h4>
											<a href="search?bid=${bigType.bid }&p=1">${bigType.bname
												}</a>
										</h4>
									</div>
									<div class="product-wrap pos">
										<!--子分类-->
										<div class="cf">
											<div class="fl wd252 pr20">

												<ul class="cf">
													<c:forEach items="${sel_fen}" var="smallType">
														<c:if test="${bigType.bid == smallType.bid}">
															<li><span> <a
																	href="search?sid=${smallType.cid }&p=1">${smallType.cname}</a>
															</span>
															</li>
														</c:if>
													</c:forEach>
												</ul>

											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<!-- 循环结束 -->
						</div>
					</div>
					<ul class="menu">
						<li><a href="${ctx }/main/index" target="_self">首页</a>
						</li>
						<li><a href="javascript:void(0)" target="_blank">团购</a>
						</li>
						<li><a href="javascript:void(0)" target="_self">抢购</a>
						</li>
						<li><a href="javascript:void(0)" target="_self">预约</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- /菜单 -->
			<!-- 主体 -->
			<div class="commom_wrapper">
				<div class="main">
					<div class="main_nav">
						<a rel="nofollow" href="${ctx}/shop/home.html"><i
							class="glyphicon glyphicon-home"></i>首页</a>&gt; <a
							href="${ctx}/shop/search.html?cid=${product.cid}">${xq.cname}</a>&gt;
						<p id="tit">
							<a class="red fwb" href="javascript:void(0)">${product.pname}</a>
						</p>
					</div>
					<div class="details">
						<div class="details_left">
							<!-- 商品描述-->
							<div class="details_left_top">

								<!-- jqzoom-->
								<div id="zoom">
									<div class="jqzoom" id="spec-n1">
										<img height="350" src="${product.pimage}" jqimg="${product.pimage}"
											width="350" />
									</div>
								</div>
								<!-- wwww over-->
								<!-- 商品参数-->
								<div class="dl_goods_info">
									<%-- <form action="${ctx}/cart/goumai.html" name="orderform" id="orform"
											method="post" onsubmit="return trySubmit()"> --%>
									
									<!-- 隐藏传递的参数 sta -->
									<input type="hidden" id="spmc" name="pname" value="${product.pname}">
									<input type="hidden" id="sptp" name="pname" value="${product.pimage}">		
									<!-- 隐藏传递的参数 end -->
									
									<h2 class="dginfo_h2">${product.pname}</h2>
									<p>
										价格：<span class="dginfo_price">￥<em class="price"
											id="resetprice">${product.sellprice}</em>
										</span>
									</p>

									<p>
										运费：<span id="yunfei">${product.freight}</span>
									</p>

									<ul class="dginfo_info">
										<li>市场价：￥<s>${product.cityprice}</s></li>
										<li>规格：${product.format}</li>
										<li class="dginfo_info_last"><span class="quantity" style="width: 100px;">库存：${product.stock}</span>
										</li>
										<li>
										<form action="${ctx}/cart/goumai.html" name="orderform" id="orform"
											method="post" onsubmit="return trySubmit()">
										  <input type="hidden" id="pid" name="pid" value="${product.pid }" />
											<p class="">
												<span class="quantity">数量：</span> 
												<span class="quantity-form"> 
												<a href="javascript:void(0)" class="jia" onclick="add()">+</a>
												<input type="text" class="goodnum" value="1" name="num" id="quantity" onblur="pandnum()" /> 
												<a onclick="reduce()" id="oneA" href="javascript:void(0)" class="jian">-</a> </span> 
											</p>
											</form>
										</li>
									</ul>

									<!-- buy-->
									<div class="addcart_box">
										<a rel="nofollow" href="javascript:void(0)" 
										onclick="order(83);return false;"
											class="dginfo_btn">立刻购买</a> 
										
										<a rel="nofollow"
											href="javascript:void(0)" onclick="buy()"
											class="dginfo_gwc dginfo_btn">加入购物车</a>
											
										<!-- 购物车计算浮动层 begin -->
										<div id="showIncludeCart" style="display:none;">
											<a class="buy_pop_close"
												onclick="jQuery('#showIncludeCart').hide();" title="关闭"></a>
											<div class="buy_icon"></div>
											<div class="buy_pop_top">
												<div class="title">此商品已成功放入购物车</div>
												<div class="font">
													购物车共 <font id="totalnum" class="red"></font> 件宝贝 <span>合计
														<font class="red" id="fee"></font> </span>
												</div>
												<div class="btn_continue">
													<div class="pop_btn_r">
														<a
															onclick="jQuery('#showIncludeCart').hide();return false;"
															href="javascript:vod(0);">继续购物</a>
													</div>
													<div class="btn_cart">
														<a href="index.cart">去购物车结算</a>
													</div>
												</div>
											</div>
										</div>
										<!-- 购物车计算浮动层 over -->
										
									</div>
									<!-- buy-->
									<p>
										<span>收藏产品：<a href="javascript:vod(0);"
											onclick="favor();return false;"><img title="收藏"
												src="images/icon_favorite_pro.jpg" /> </a> </span>
										&nbsp;&nbsp;&nbsp;&nbsp; <span>&nbsp;&nbsp;&nbsp;分享到：<a
											title="分享到新浪微博" target="_blank"
											href="http://service.weibo.com/share/share.php?title=${product.pname}（来自宅客微购）&url=<%=basePath%>goodsPageServlet?id=${product.pid}&pic=<%=basePath%>${product.pimage}"
											data-item="sina" class="J_vivo_share"> <img alt="新浪微博"
												src="images/icon_sina_weibo.jpg" app="b2c" /> </a> <a
											title="分享到腾讯微博" target="_blank"
											href="http://v.t.qq.com/share/share.php?title=${product.pname}（来自宅客微购）&url=<%=basePath%>goodsPageServlet?id=${product.pid}&pic=<%=basePath%>${product.pimage}"
											data-item="tencent" class="J_vivo_share"> <img alt="腾讯微博"
												src="images/icon_tencent_weibo.jpg" app="b2c" /> </a> <a
											target="_blank" title="分享到人人网"
											href="http://widget.renren.com/dialog/share?resourceUrl=<%=basePath%>goodsPageServlet?id=${product.pid}&amp;title=${product.pname}（来自宅客微购）&amp;pic=<%=basePath%>${product.pimage}"
											data-item="renren" class="J_vivo_share"> <img alt="人人网"
												src="images/icon_renrenwang.jpg" app="b2c" /> </a> </span>
									</p>
									<!-- </form> -->
								</div>
								<!-- 商品参数 结束-->

								<!-- 商品参数-->
								<div class="dl_goods_detail">

									<!-- 商品描述-->
									<div class="good-tabs">
										<a href="javascript:void(0)" id="detail_tab"
											name="__tab_detail_b2c" rel="header1" class="on selected">商品详情</a>
									</div>
									<div class="tab-line"></div>
									<div id="goods_content">${product.bewrite}</div>
								</div>
								<!-- 商品描述结束-->


							</div>
							<!-- 商品描述结束details_left_top-->
							

							<script src="${ctx}/static/UserJS/js/jqueryzoom-jcarousel.js" type="text/javascript"></script>
							<!-- js over-->
							<!-- jqzoom over-->

						</div>
						<div class="details_right">
							<div>猜您喜欢</div>
							<div id="gun" style="height:1030px;overflow:hidden;">
								<dl id="gun1">
									<c:forEach items="${sel_tl}" var="tl">
										<dd>
											<c:if test="${tl.heat == 1 || tl.heat == 2}">
												<a class="details_right_img" title="${tl.pname }"
													href="${ctx}/product/detail.html?pid=${tl.pid}"> <img
													src="${tl.pimage }" alt="${tl.pname }"
													style="display: inline-block;" /> </a>

												<a href="${ctx}/product/detail.html?pid=${tl.pid}"
													class="details_right_title" title="${tl.pname }">${tl.pname}</a>

												<span class="fwb mcm_title_price">￥<span class="red">${tl.sellprice}</span>
												</span>
											</c:if>
										</dd>
									</c:forEach>
								</dl>
								<dl id="gun2"></dl>
							</div>
						</div>
					</div>
				</div>
				<!-- jQuery 遮罩层 begin -->
				<div id="fullbg"></div>
				<!-- end jQuery 遮罩层 -->
				<!-- 对话框 -->
				<div id="dialog">
					<!-- Modal 对话框内容 -->
					<div id="myModal" class="modal">
						<div class="modal-header">
							<a class="close" onclick="closeBg();"><img
								src="images/close.png" /> </a>
							<h3 id="myModalLabel">用户登录</h3>
						</div>
						<div class="m_img">
							<a class="" href="javascript:void(0)"><img
								src="images/qq.png" />&nbsp;用QQ账号登录</a> <br /> <br /> <a class=""
								href="javascript:void(0)"><img src="images/weibo.png" />&nbsp;用微博账号登录</a>
						</div>
						<form class="form-horizontal" id="loginform" name="user"
							method="post">
							<div class="form_login">
								<input type="text" id="inputusername" name="phone"
									placeholder="手机号" maxlength="11" />
							</div>
							<div class="form_login">
								<input type="password" id="inputpassword" name="password"
									placeholder="密码" />
							</div>
							<div class="form_login">
								<input type="text" id="yanzheng" name="yanzheng"
									placeholder="验证码" style="width: 100px;float: left;" /> <a
									href="javascript:changeImage();"> <img
									src="${ctx}/main/verify"
									style="height: 28px;float: right;margin-right: 98px;width: 65px;"
									id="verifyCodeImage"> </a>
							</div>
							<span class="tips"></span>
							<div class="form_login">
								<a class="" id="login_btn">登录</a>
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



<script type="text/javascript">
$(function() {
	$(".jqzoom").jqueryzoom({
		xzoom : 400,
		yzoom : 400,
		offset : 10,
		position : "right",
		preload : 1,
		lens : 1
	});

});

// 关闭灰色 jQuery 遮罩
function closeBg() {
	$("#fullbg,#dialog").hide();
}

//立即购买
function order(i){
var uexist="${user_session.nickname}";
	if(uexist){
		document.orderform.submit();
	}else{
		showBg();
	}
}

//失去焦点判断数量是否合法
function pandnum() {
	var num = $(".goodnum").val();
	if (num > "${product.stock}") {
		$(".goodnum").val("${product.stock}");
	} else if (num < 1) {
		$(".goodnum").val(1); //设置默认值为1
	}
}
//增加数量
function add() {
	var num = $(".goodnum").val();
	num++;
	if (num > "${product.stock}") {
		$(".goodnum").val("${product.stock}");
	} else {
		$(".goodnum").val(num);
	}
	sss();
}

//减少数量
function reduce() {
	var num = $(".goodnum").val();
	if (num > 1) {
		num--;
		$(".goodnum").val(num);
	}
	sss();
}

//登录后刷新页面，载入数据
$("#login_btn").click(
		function() {
			var yourname = $('#inputusername').val();
			var yourword = $('#inputpassword').val();
			var youryzm = $('#yanzheng').val();
			$.ajax({
				type : 'post', //传送的方式,get/post
				url : 'user/login.html', //发送数据的地址
				data : {
					phone : yourname,
					password : yourword,
					yanzheng : youryzm
				},
				dataType : "json",
				success : function(data) {
					if (data.msg == "ok") {
						$(".tips").html(data.info);
						window.location.reload();
					} else if (data.msg == "cuo") {
						alert("验证码错误！");
						changeImage();//验证码输入错误刷新图片
						$('#yanzheng').val("");
					} else if (data.msg == "no") {
						alert("用户名或密码错误！");
					} else {
						$(".tips").html(data.info);
					}
				},
				error : function(event, XMLHttpRequest,
						ajaxOptions, thrownError) {
					alert(XMLHttpRequest + thrownError);
				}
			});
		});
		function favor() {
			var uid = "${user_session.uid}";
			var pid=$("#pid").val();                                                       
			alert(uid)
			if (uid!='') {
				$.ajax({
					type : 'post', // 传送的方式,get/post
					url : 'main/addcollection', // 发送数据的地址
					data : {
						uid : uid,
						pid:pid
					},
					dataType : "json",
					success : function(data) {
						layer.alert(data.msg, {
							icon : 1
						});
					},
					error : function(event, XMLHttpRequest, ajaxOptions, thrownError) {
						alert(XMLHttpRequest + thrownError);
					}
				});
			} else {
				showBg();
			}

		}
		// 显示灰色 jQuery 遮罩层
function showBg() {
	$("#dialog").fadeIn();
	var bh = $("body").height();
	var bw = $("body").width();
	$("#fullbg").css({
		height : bh,
		width : bw,
		display : "block"
	});

}
</script>
			</div>
			<!-- /主体 -->
			<!-- 购物车js -->
			<script type="text/javascript">
				//购物车显示与隐藏
				var Shopcart = document.getElementById('shopping_cart');
				var Goodsmenu = document.getElementById('goods');
				var timerr = null;//定义定时器变量
				//鼠标移入div1或div2都把定时器关闭了，不让他消失
				Shopcart.onmouseover = Goodsmenu.onmouseover = function() {
					Goodsmenu.style.display = 'block';
					clearTimeout(timerr);
				}
				//鼠标移出div1或div2都重新开定时器，让他延时消失
				Shopcart.onmouseout = Goodsmenu.onmouseout = function() {
					//开定时器
					timerr = setTimeout(function() {
						Goodsmenu.style.display = 'none';
					}, 10);
				}

				//购物车动态删除
				function delcommon(event) {
					//获取事件源
					event = event ? event : window.event;
					var obj = event.srcElement ? event.srcElement
							: event.target;
					//这时obj就是触发事件的对象，可以使用它的各个属性 
					//还可以将obj转换成jquery对象，方便选用其他元素 
					str = obj.innerHTML.replace(/<\/?[^>]*>/g, ''); //去除HTML tag
					var $obj = $(obj);
					var id = $obj.parent().prev().html();
					if (obj.rel == "del") {
						var str = obj.name;
						//全选的实现 定义删的发送路径		
						$
								.ajax({
									type : 'post', //传送的方式,get/post
									url : 'delShoppingCart.goods', //发送数据的地址
									data : {
										id : id
									},
									dataType : "json",
									success : function(data) {
										var $obj = $(obj);
										$obj.parents("li").remove();
										if (data.sum == "0") {
											//判断购物车数量是否为0，为0则隐藏底部查看工具
											$("div.sc_goods_foot").hide();
											var html = '<p class="sc_goods_none" >您的购物车还是空的，赶紧行动吧！</p>';
											$("ul.sc_goods_ul").html(html);
										} else {
											$("div.sc_goods_foot").show();
										}
									},
									error : function(event, XMLHttpRequest,
											ajaxOptions, thrownError) {
										alert(XMLHttpRequest + thrownError);
									}
								});
					}
				}
				//购物车删除结束

				var speed = 30; //数字越大速度越慢 
				var demo = document.getElementById("gun");
				var demo2 = document.getElementById("gun2");
				var demo1 = document.getElementById("gun1");
				demo2.innerHTML = demo1.innerHTML; //克隆demo1为demo2
				function Marquee() {
					if (demo2.offsetTop - demo.scrollTop <= 0)//当滚动至demo1与demo2交界时
						demo.scrollTop -= demo1.offsetHeight;//demo跳到最顶端 
					else {
						demo.scrollTop++;
					}
				}
				var MyMar = setInterval(Marquee, speed);//设置定时器
				demo.onmouseover = function() {
					clearInterval(MyMar);
				};//鼠标移上时清除定时器达到滚动停止的目的
				demo.onmouseout = function() {
					MyMar = setInterval(Marquee, speed);
				};//鼠标移开时重设定时器
			</script>
			<!-- /购物车js -->
			<!-- 底部 -->
			<!-- 底部-->
			<script type="text/javascript" charset="utf-8" src="${ctx}/static/UserJS/js/menudown.js"></script>
	</div>
	<%@ include file="jsps/footer.jsp"%>
	<!-- /底部 -->
</body>

</html>
