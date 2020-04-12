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

<title>宅客微购</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="${ctx}/static/UserCSS/top.css" rel="stylesheet" />
<link href="${ctx}/static/UserCSS/common.css" rel="stylesheet" />
<link href="${ctx}/static/UserCSS/footer.css" rel="stylesheet" />
<link href="${ctx}/static/UserCSS/lunbo.css" rel="stylesheet" />

<!-- 轮播css -->
<script type="text/javascript" src="${ctx}/static/UserJS/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/static/UserJS/js/public.js"></script>

<script type="text/javascript" src="${ctx}/static/UserJS/js/jquery.lazyload.min.js"></script>

</head>

<body>
	<%@ include file="jsps/top.jsp"%>

	<div class="yershop_wrapper">

		<%@ include file="jsps/hader.jsp"%>
		<!-- /头部 -->

		<!-- 主体 -->
		<div class="common_wrapper">
			<!--container begin-->
			<div class="flexcontainer">
				<!--menu begin-->
				<div class="nav-wrap">
					<!--fenlei begin-->
					<div class="nava">
						<div class="goods">
							<div>
								<h2>
									<span class="grid"><img src="images/grid.png" /> </span> <span>商品分类</span><b></b>
								</h2>
							</div>

							<div class="all-goods" id="all-goods">
								<!-- 商品分类循环go -->
								<c:forEach items="${sel_big }" var="bigType">
									<div class="item">
										<div class="product">
											<h4>
												<a href="${ctx}/shop/search.html?bid=${bigType.bid }">${bigType.bname}</a>
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
																		href="${ctx}/shop/search.html?cid=${smallType.cid }">${smallType.cname}</a>
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
								<!-- 商品分类循环end -->
							</div>
						</div>

						<ul class="menu">
							<li><a href="javascript:void(0)" target="_self">首页</a></li>
							<li><a href="javascript:void(0)" target="_blank">团购</a></li>
							<li><a href="javascript:void(0)" target="_self">抢购</a></li>
							<li><a href="javascript:void(0)" target="_self">预约</a></li>
						</ul>
					</div>
					<script>
						$(".menu-list li").eq(0).css('background', '#474747');
					</script>
					<!--首页高亮-->
				</div>
				<!--menu over-->
				<!--pic begin-->
				<div class="screen">
					<div class="ck-slide">
						<ul class="ck-slide-wrapper">
							<c:forEach items="${sel_hd}" var="s">
								<li><a href="${s.hurl}" target="_blank"> <img
										src="${s.hurl}" alt="${s.hname}" /> </a></li>
							</c:forEach>
						</ul>
						<a href="javascript:void(0);" class="ctrl-slide ck-prev">上一张</a> <a
							href="javascript:void(0);" class="ctrl-slide ck-next">下一张</a>
						<div class="ck-slidebox">
							<div class="slideWrap">
								<ul class="dot-wrap">
									<li class="current"><em>1</em></li>
									<li><em>2</em></li>
									<li><em>3</em></li>
									<li><em>4</em></li>
									<li><em>5</em></li>
								</ul>
							</div>
						</div>
					</div>
					<script type="text/javascript" src="${ctx }/static/UserJS/js/slide.js"></script>
					<!-- 轮播js -->
					<script type="text/javascript">
						$('.ck-slide').ckSlide({
							dir : 'x', //左右滚动
							autoPlay : true
						});
					</script>
				</div>
			</div>
			
			<!-- 资讯栏 -->
			<div style="width:100%;height:60px;margin-bottom: 15px;margin-top: 15px;">
				<div style="width: 50%;height: 60px;float: left;">
				   <img alt="" src="images/1697.gif" width="100%" height="60px">
				</div>
				
				<div id="gun" style="overflow:hidden;width: 50%;height: 60px;float: right;background: #ddd;">
					<div id="gun1">
						<c:forEach items="${qt_news }" var="n">
							<c:if test="${n.checkno==1}">
								<ul style="margin-left: 10px;">
									<li style="padding-bottom: 5px;text-align: left;">
									   <a href="${ctx}/news/explain.html?nid=${n.nid}">${n.title }</a>
									</li>
								</ul>
							</c:if>
						</c:forEach>
					</div>
				  <div id="gun2"></div>
				</div>
				
			</div>
			<!-- 资讯栏 -->	
				
			<!-- 楼层循环go -->
			<c:forEach items="${sel_big }" var="bigType" varStatus="big">
				<div class="list">
					<h3>
						<span class="floor">${big.index+1 }F</span><span>${bigType.bname}</span>
					</h3>
					<div class="category">
						<div class="icon">
							<ul class="tag clearfix" data-tpc="3">
								<c:forEach items="${sel_fen}" var="sm">
									<c:if test="${bigType.bid == sm.bid}">
										<a target="_blank" title="${sm.cname }"
											href="${ctx}/shop/search.html?cid=${sm.cid }"> ${sm.cname }</a>
									</c:if>
								</c:forEach>
							</ul>
							<a href="${ctx}/shop/search.html?bid=${bigType.bid}" target="_blank"> 
							<img class="lazy" src="${bigType.bimage }"
								data-original="${bigType.bname }" /> </a>
						</div>
						<!--栏目推荐位调用结束-->

						<!--栏目文章调用开始-->
						<ul class="article" id="list_52">
							<!-- 循环展示商品go -->
								<c:forEach items="${sel_prod}" var="goods">
								<c:if test="${bigType.bid == goods.bid}">
								<li>
								
									<div class="pic" id="fangda">
										<a class="yershop_img" href="${ctx}/main/detail.html?pid=${goods.pid }"
											target="_blank" title="${goods.pname }"> 
											<img class="lazy" src="images/grey.png" data-original="${goods.pimage }" />
											<em></em>
										</a>
										
										<c:if test="${goods.heat==0}">
										  <img src="images/biaoqian/cuxiao.png" 
										  style="width: 100px;height: 100px;margin-top: -165px;"/>
										</c:if>
										<c:if test="${goods.heat==1}">
										  <img src="images/biaoqian/remai.png" 
										  style="width: 100px;height: 100px;margin-top: -165px;"/>
										</c:if>
										<c:if test="${goods.heat==2}">
										  <img src="images/biaoqian/tuijian.png" 
										  style="width: 100px;height: 100px;margin-top: -165px;"/>
										</c:if>
									</div>
									
									<div style="text-align: center;margin-right: 25px;">
										<a href="${ctx}/main/detail.html?pid=${goods.pid }" target="_blank"
											title="${goods.pname }">
											<span style="width: 180px;color: red;">${goods.pname }</span>
										</a>
									</div>
									
									<div style="font-size: 14px;text-align: center;">
										<s style="color: #0000FF;">价格:￥${goods.cityprice}</s> 
										<span style="color: red;">￥${goods.sellprice }</span>
									</div>
								</li>
							  </c:if>
							</c:forEach>
							<!-- 循环展示商品end -->
						</ul>
					</div>
					<!--栏目文章调用结束-->
				</div>
			</c:forEach>
			<!-- 楼层循环end -->
		</div>
		<!-- /主体 -->

		<!-- 底部-->
		<script type="text/javascript" charset="utf-8" src="${ctx}/static/UserJS/js/menudown.js"></script>
	</div>
	<%@ include file="jsps/footer.jsp"%>
	<!-- /底部 -->

	<!-- 购物车js -->
	<script>
		//购物车显示与隐藏
		var Shopcart = document.getElementById('shopping_cart');
		var Goodsmenu = document.getElementById('goods');
		var timerr = null;//定义定时器变量
		//鼠标移入div1或div2都把定时器关闭了，不让他消失
		Shopcart.onmouseover = Goodsmenu.onmouseover = function() {
			Goodsmenu.style.display = 'block';
			clearTimeout(timerr);
		};
		//鼠标移出div1或div2都重新开定时器，让他延时消失
		Shopcart.onmouseout = Goodsmenu.onmouseout = function() {
			//开定时器
			timerr = setTimeout(function() {
				Goodsmenu.style.display = 'none';
			}, 10);
		};

		//购物车动态删除
		function delcommon(event) {
			//获取事件源
			event = event ? event : window.event;
			var obj = event.srcElement ? event.srcElement : event.target;
			//这时obj就是触发事件的对象，可以使用它的各个属性 
			//还可以将obj转换成jquery对象，方便选用其他元素 
			str = obj.innerHTML.replace(/<\/?[^>]*>/g, ''); //去除HTML tag

			var $obj = $(obj);
			var str = $obj.parent().prev().html();
			if (obj.rel == "del") {
				var gId = obj.name;
				$.ajax({
							type : 'post', //传送的方式,get/post
							url : 'cart/delete.html', //发送数据的地址
							data : {
								gid : gId
							},
							dataType : "json",
							success : function(data) {
								if (data.msg == "ok") {
								var $obj = $(obj);
								$obj.parents("li").remove();
									//判断购物车数量是否为0，为0则隐藏底部查看工具
									$("div.sc_goods_foot").hide();
									var html = '<p class="sc_goods_none" >您的购物车还是空的，赶紧行动吧！</p>';
									$("ul.sc_goods_ul").html(html);
									window.location.href="shop/home.html";
								} else if(data.msg == "no"){
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
		//图片延时加载开启
		$('img.lazy').lazyload({
			effect : 'fadeIn'
		});

//资讯滚动
var speed=40; //数字越大速度越慢 
var demo=document.getElementById("gun");
var demo2=document.getElementById("gun2");
var demo1=document.getElementById("gun1");
demo2.innerHTML=demo1.innerHTML; //克隆demo1为demo2
function Marquee(){
 if(demo2.offsetTop-demo.scrollTop<=0)//当滚动至demo1与demo2交界时
  demo.scrollTop-=demo1.offsetHeight;//demo跳到最顶端 
 else{
  demo.scrollTop++;
 }
}
var MyMar=setInterval(Marquee,speed);//设置定时器
demo.onmouseover=function() {clearInterval(MyMar);};//鼠标移上时清除定时器达到滚动停止的目的
demo.onmouseout=function() {MyMar=setInterval(Marquee,speed);};//鼠标移开时重设定时器
	</script>
	<!-- 购物车js -->


</body>
</html>
