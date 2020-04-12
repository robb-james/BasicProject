<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String rightPage = (String)request.getAttribute("rightPage");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="${ctx}/static/UserCSS/top.css" rel="stylesheet" /> 
	<link href="${ctx}/static/UserCSS/detail.css" rel="stylesheet" /> 
	<link href="${ctx}/static/UserCSS/footer.css" rel="stylesheet" /> 
	<link href="${ctx}/static/UserCSS/css/tuan.css" rel="stylesheet" /> 
	<link href="${ctx}/static/UserCSS/common.css" rel="stylesheet" />
	
	<script type="text/javascript" src="${ctx}/static/UserJS/js/public.js"></script> 
	<script type="text/javascript" src="${ctx}/static/UserJS/js/jquery.js"></script>
	<script type="text/javascript" src="${ctx}/static/UserJS/js/layer/layer.js"></script>
	
	<style type="text/css">
	.layui-layer-btn .layui-layer-btn0 {
	    border-color: #f60;
	    background-color: #f40;
	    color: #fff;
	}
	</style>
<c:if test="${user_session.uname == null}">
	<script type="text/javascript">
		window.location.href = "${ctx}/shop/home.html";
	</script>
</c:if>	
  </head>
  
  <body>
 <%@ include file="jsps/top.jsp" %> 
<div class="yershop_wrapper">
<%@ include file="jsps/hader.jsp" %>

   <div class="menu-wrapper"> 
   <div class="nava"> 
    <div class="nav-all"> 
     <div class="all_class" id="all-class"> 
      <h2><span class="grid"><img src="images/grid.png" /></span><span>商品分类</span><b></b></h2> 
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
     <li> <a href="javascript:void(0)" target="_self">首页</a> </li>
     <li> <a href="javascript:void(0)" target="_blank">团购</a> </li>
     <li> <a href="javascript:void(0)" target="_self">抢购</a> </li>
     <li> <a href="javascript:void(0)" target="_self">预约</a> </li> 
    </ul> 
    </div>
   </div>
	<!-- /菜单 -->


	<!-- 主体 -->
	<div class="commom_wrapper">
<div class="main"><div class="main_center"><div class="center_left">
<!-- 左侧菜单 -->
	<h3><a rel="nofollow" href="javascript:vod(0)" class="home-me">我的会员中心</a></h3>
<h3><a rel="nofollow" class="home-me">订单中心</a></h3>
<dl>
<dd><a rel="nofollow" href="${ctx}/order/payall.html" <c:if test="${rightPage=='orderAll' || rightPage=='orderDetail' }">class="current"</c:if>>我的订单</a></dd>
<dd><a rel="nofollow" href="MyCollect.page" <c:if test="${rightPage=='MyCollect' }">class="current"</c:if>>我的收藏</a></dd>
</dl>

<h3><a rel="nofollow" class="home-me">个人信息</a></h3>

<dl class="last">

<dd><a href="userData.page" <c:if test="${rightPage=='userData' }">class="current"</c:if>>个人档案</a></dd>
<dd><a rel="nofollow" href="${ctx}/dizhi/jumpdd.html" <c:if test="${rightPage=='address' || rightPage=='addAddress' }">class="current"</c:if>>地址管理</a></dd>

<dd><a rel="nofollow" href="${ctx}/cart/select.html">我的购物车</a></dd>
<dd><a rel="nofollow" href="${ctx}/user/jumpxgmm.html" <c:if test="${rightPage=='changePassword' }">class="current"</c:if>>修改密码</a></dd>

</dl> <script>/* 左边菜单高亮 */
            url = window.location.pathname + window.location.search;
            url = url.replace(/(\/(p)\/\d+)|(&p=\d+)|(\/(id)\/\d+)|(&id=\d+)|(\/(group)\/\d+)|(&group=\d+)/, "");
			
            $("a[href='" + url + "']").addClass("current") ;
			</script>
   
<!-- 左侧菜单 -->

</div><!-- 个人中心 初始状态 start -->

<c:if test="${rightPage=='orderAll' }">
<%-- <%@include file="jsps/userMain/orderAll.jsp" %> --%>

<div class="center_right" id="MemberCenterCtrl" style="display: block;">
<div class="order_namelist">
<span><a href="${ctx}/order/payall.html" class="red">所有订单</a></span>
<span><a href="${ctx}/order/payment.html" class="red">待支付订单</a></span>
<span><a href="${ctx}/order/delivery.html" class="red">待发货订单</a></span>
<span><a href="${ctx}/order/receipt.html" class="red">待确认订单</a></span>
</div>
	
<form action="#" method="post" name="delform">
        
	  <div class="good-canshu">
		  <span class="good-name">商品名称</span>
		  <span class="good-price">售价</span>
		  <span class="good-num">数量</span> 
		  <span class="good-action">商品操作</span>
		  <span class="good-total">总金额(元)</span>
		  <span class="good-status">交易状态</span>
		  <span class="deal-action">交易操作</span>
	  </div>

		<!-- 订单循环开始 -->
		<c:forEach items="${ssList}" var="ordrList">
          <div class="single" onmouseover="this.className='singlehover'" onmouseout="this.className='single'">
			 <div class="order-detail">订单号：<span>${ordrList.oid }</span>&nbsp;&nbsp;&nbsp;下单时间：<span>
				 <fmt:formatDate value="${ordrList.otime }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</span>
			 </div>
         <!-- 列表详情区域开始 -->  
         
		  <div class="goodlist-wrap">   
		  <!-- 左边商品区域开始 -->  
		  <div class="three-area">
		  
		  <!-- 订单商品循环go -->
			  <div class="cos">
			  <span class="c1"><a href="${ctx}/product/detail.html?pid=${ordrList.pid }" class="dl"> 
			  <img src="${ordrList.gimage }" width="70" height="70"></a>
			  <span class="dd"><a href="${ctx}/product/detail.html?pid=${ordrList.pid }" class="dd"> ${ordrList.gname }</a></span>
			 <span class="dd"></span>
			  </span>
			  <span class="c2">￥${ordrList.gprice }</span>
			  <span class="c2">${ordrList.num }</span> 
			    <span class="c2">  无</span>
			  </div>
		  <!-- 订单商品循环end --> 
		  
		  </div>
		  <!-- 左边商品结束 -->  
		  
		  
 		<div class="total-area"><p>￥${ordrList.ototal }</p><p>(货到付邮)</p> 
		    </div>
		     <div class="deal-area">
			<p class="red"> 
			 <c:choose>
			 	<c:when test="${ordrList.ostate==6 }">货到付款</c:when>
			 	<c:when test="${ordrList.ostate==1 }">等待付款</c:when>
			 	<c:when test="${ordrList.ostate==2 }">等待发货</c:when>
			 	<c:when test="${ordrList.ostate==3 }">已发货</c:when>
			 	<c:when test="${ordrList.ostate==4 }">交易关闭</c:when>
			 	<c:when test="${ordrList.ostate==5 }">交易成功</c:when>
			 </c:choose>
			 </p>
			<p><a href="${ctx}/order/xiangxi.html?oid=${ordrList.oid }">订单详情</a></p>
			  </div>
			   <div class="act-area"> 
			   <c:if test="${ordrList.ostate==1 }">
				  <p><a class="confirm" href="javascript:void(0);" onclick="quxiao('${ordrList.oid }')">取消订单</a> </p>		
				  <p><a class="confirm" href="${ctx}/cart/select.html">前去支付</a> </p>
			  </c:if>
			  
			  <c:if test="${ordrList.ostate==2 }">
			  	<p><a class="confirm" href="javascript:void(0);" onclick="quxiao('${ordrList.oid }')">取消订单</a> </p>
			  </c:if>
			  
			  <c:if test="${ordrList.ostate==3 }">
			  	<p><a class="confirm" href="javascript:void(0);" onclick="shouhuo('${ordrList.oid }')">确定收货</a> </p>
			  </c:if>
			  
		    </div> 
		  </div>
       <!-- 列表详情区域结束 -->
	   </div>
	   </c:forEach>
	   <!-- 订单循环结束 -->
	   
	 </form>
	 
	   <script type="text/javascript">
	   	var msg = "您真的确定要取消订单吗？";
	   	var sh = "您是否要确定收货？";
	   	//取消订单
	   	function quxiao(oid){
			$.ajax({
			type : 'post',
			url : 'order/cancel.html', // 发送数据的地址
			data : {
				oid : oid
			},
			dataType : "json",
			success : function(data) {
			if (confirm(msg)==true){
			   if (data.msg == "ok") {
					alert("订单取消成功！");
					window.location.href = "order/payall.html";
				} else if (data.msg == "no") {
					alert("订单取消失败！");
					window.location.href = "order/payall.html";
				}
				return true;
			}else{
				return false;
			}
				
			},
			error : function(event, XMLHttpRequest, ajaxOptions, thrownError) {
				alert(XMLHttpRequest + thrownError);
			}
		});
		}
		//确认收货
		function shouhuo(oid){
			$.ajax({
			type : 'post',
			url : 'order/shouhuo.html', // 发送数据的地址
			data : {
				oid : oid
			},
			dataType : "json",
			success : function(data) {
			if (confirm(sh)==true){
			   if (data.msg == "ok") {
					alert("确认收货成功！\n\n欢迎下次光临");
					window.location.href = "order/payall.html";
				} else if (data.msg == "no") {
					alert("订单取消失败！");
					window.location.href = "order/payall.html";
				}
				return true;
			}else{
				return false;
			}
				
			},
			error : function(event, XMLHttpRequest, ajaxOptions, thrownError) {
				alert(XMLHttpRequest + thrownError);
			}
		});
		}
	   	</script>
	   
   <!-- 分页 --> 
       <c:if test="${PageDate.count!=0 }">
       <div class="page"> 
        <div> 
        	<c:if test="${p!=1  }">
        		<a class="prev" href="userMain.page?type=${type }&p=${p-1 }">上一页</a>
        	</c:if>
        	<c:forEach begin="1" end="${PageDate.pagetotal }" varStatus="sta">
        		<c:if test="${p==sta.count }">
        			<span class="current">${p }</span>
        		</c:if>
        		<c:if test="${p!=sta.count }">
        			<a class="num" href="userMain.page?type=${type }&p=${sta.count }">${sta.count }</a>
        		</c:if>
        	</c:forEach>
        	<c:if test="${p!=PageDate.pagetotal}">
        		<a class="next" href="userMain.page?type=${type }&p=${p+1 }">下一页</a>
        	</c:if>
         	<span class="rows">共${page.totalPageCount } 条记录</span>
        </div>
       </div>
       </c:if>
</div>

</c:if>

<c:if test="${rightPage=='orderDetail' }">
<%-- <%@include file="jsps/userMain/orderDetail.jsp" %> --%>

<div class="center_right">
	<span class="red" style="display: block;padding:15px;font-size:17px;">订单详情查看</span>
	<table style="" id="table" class="detailtable" width="100%">
        <tbody width="990px">
		   
           <c:forEach items="${xiangxi }" var="item">
           <tr width="100%">
                <th width="50%">订单号：${item.oid }</th>
                <th width="50%" colspan="2">下单时间：${item.otime }</th> 
           </tr>
           <tr>
                <td>
					<span class="img_1 img1">
						<a href="${ctx}/product/detail.html?pid=${item.pid }">
							<img src="${item.gimage }" width="70" height="70">
							<span class="img_1_h">${item.gname }</span>
						</a>
					</span>
				</td>
                <td align="center">单价：${item.gprice }  元</td>
                <td align="center">数量： ${item.num } 件</td> 
           </tr>
           		 
		 <tr><td colspan="4" align="right">金额：<span class="red">${item.gtotal }</span>元</td></tr>	
		 <tr><td colspan="5" align="left">收货地址：
		 <span class="red">${item.province}</span>
		 <span class="red">${item.city}</span>
		 <span class="red">${item.area}</span>
		 <span class="red">${item.dizhi}</span>
		 </td></tr>  
		 <tr width="100%">
		   <th width="50%">联系电话：<span class="red">${item.dianhua}</span></th>
		   <th width="50%">联系姓名：<span class="red">${item.username}</span></th>
		 </tr>
		 <tr><td colspan="5" align="left">留言信息：<span class="red">${item.oboard }</span></td></tr>  
          </c:forEach>
        </tbody>
    </table>	  
</div>

</c:if>

<c:if test="${rightPage=='MyCollect' }">
<%@include file="jsps/userMain/collect.jsp" %>
</c:if>

<c:if test="${rightPage=='userData' }">
<%@include file="jsps/userData.jsp" %>
</c:if>

<c:if test="${rightPage=='address' }">
<%@include file="jsps/userMain/address.jsp" %>
</c:if>

<c:if test="${rightPage=='addAddress' }">
<%@include file="jsps/userMain/addAddress.jsp" %>
</c:if>

<c:if test="${rightPage=='changePassword' }">
<%@include file="jsps/userMain/changePassword.jsp" %>
</c:if>

</div>
 </div>
	<!-- 主体 -->

  <!-- 购物车js --> 
   <script type="text/javascript">
	//购物车显示与隐藏
	 var Shopcart= document.getElementById('shopping_cart');
     var Goodsmenu= document.getElementById('goods');
            var timerr = null;//定义定时器变量
            //鼠标移入div1或div2都把定时器关闭了，不让他消失
            Shopcart.onmouseover =Goodsmenu.onmouseover = function (){
                Goodsmenu.style.display = 'block';
                clearTimeout(timerr);
            };
            //鼠标移出div1或div2都重新开定时器，让他延时消失
            Shopcart.onmouseout =Goodsmenu.onmouseout = function (){
                //开定时器
                timerr= setTimeout(function () { 
                    Goodsmenu.style.display = 'none'; }, 10);
            };
			
	//购物车动态删除
	function delcommon(event){ 
		//获取事件源
		event = event ? event : window.event; 
		var obj = event.srcElement ? event.srcElement : event.target; 
		//这时obj就是触发事件的对象，可以使用它的各个属性 
		//还可以将obj转换成jquery对象，方便选用其他元素 
		str = obj.innerHTML.replace(/<\/?[^>]*>/g,''); //去除HTML tag
		
			var $obj = $(obj);
			var str=$obj.parent().prev().html();
			if(obj.rel=="del"){
			 var id=obj.name;
				//全选的实现 定义删的发送路径			
				$.ajax({
					type:'post', //传送的方式,get/post
					url:'delShoppingCart.goods', //发送数据的地址
					data:{id:id},
					dataType: "json",
					success:function(data){
						var $obj = $(obj);
						$obj.parents("li").remove();
						if(data.sum=="0"){  
						//判断购物车数量是否为0，为0则隐藏底部查看工具
							$("div.sc_goods_foot").hide();
						   	var html='<p class="sc_goods_none" >您的购物车还是空的，赶紧行动吧！</p>';
						    $("ul.sc_goods_ul").html(html);
						}
						else{
						    $("div.sc_goods_foot").show();
						}
					
					},
					error:function (event, XMLHttpRequest, ajaxOptions, thrownError) {
						alert(XMLHttpRequest+thrownError); 
					}
				 });
			}
			
			} 
		//购物车删除结束


	
</script> 
   <!-- /购物车js --> 

	<!-- 底部 -->
	
    <!-- 底部-->
   <script type="text/javascript" charset="utf-8" src="js/menudown.js"></script> 

</div></div>
 <%@ include file="jsps/footer.jsp" %> 
  </body>
</html>
