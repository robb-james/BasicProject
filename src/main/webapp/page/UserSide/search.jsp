<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品搜索</title>
    
	<link href="${ctx}/static/UserCSS/top.css" rel="stylesheet" /> 
	<link href="${ctx}/static/UserCSS/detail.css" rel="stylesheet" /> 
	<link href="${ctx}/static/UserCSS/footer.css" rel="stylesheet" /> 
	<link href="${ctx}/static/UserCSS/tuan.css" rel="stylesheet" /> 
	<link href="${ctx}/static/UserCSS/common.css" rel="stylesheet" />
	
	<script type="text/javascript" src="${ctx}/static/UserJS/js/public.js"></script> 
	<script type="text/javascript" src="${ctx}/static/UserJS/js/jquery.js"></script>
  </head>
  <body>
<%@ include file="jsps/top.jsp"  %>
  <div class="yershop_wrapper"> 
   <!-- logo --> 
<%@ include file="jsps/hader.jsp" %>
   <!-- /头部 --> 
   <!-- 导航条--> 
   <div class="menu-wrapper">
    
   <div class="nava"> 
    <div class="nav-all"> 
     <div class="all_class" id="all-class"> 
      <h2><span class="grid"><img src="images/grid.png" /></span><span>商品分类</span><b></b></h2> 
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
    <!-- Contents  --> 
    <div class="ml_content"> 
     <div class="goodlist-main"> 
      <div class="lists-position"> 
      <!-- 如果搜索的是大类则左侧显示小类集合 -->
       
       <div class="salesrank"> 
        <h5><span>销量排行</span></h5> 
          <div id="gun" style="height: 500px;overflow:hidden;">
		       <ul id="gun1">
		        <!-- 销量排行循环开始 -->
		      	<c:forEach items="${sel_xl }" var="sg">
		      	 <c:if test="${sg.heat == 2 || sg.heat ==1}">
		        <li>
		        <a class="picture" href="${ctx}/product/detail.html?pid=${sg.pid }">
		        <img src="${sg.pimage }" />
		        </a> 
		        <a class="title" href="${ctx}/product/detail.html?pid=${sg.pid }"> ${sg.pname }</a> 
		        <span>￥${sg.sellprice }</span> 
		        </li> 
		        </c:if>
		        </c:forEach>
		        <!-- 销量排行循环开始 --> 
		       </ul> 
		       <dl id="gun2"></dl>
		   </div>
       </div> 
      </div> 
      <div class="lists-area"> 
       <p class="serach-title" id="s">您的相关搜索结果</p>
       <ul class="ml_content_top">
        <li <c:if test="${param.order=='1' || param.order==null }">class="active"</c:if> ><a href="search?${type }=${s }&p=1&order=1" class="asc">热度<i></i></a></li>
        <li <c:if test="${param.order=='2' }">class="active"</c:if> ><a href="search?${type }=${s }&p=1&order=2" class="asc">最新<i></i></a></li>
        <li <c:if test="${param.order=='3' }">class="active"</c:if> ><a href="search?${type }=${s }&p=1&order=3" class="asc">价格<i></i></a></li>
        <li <c:if test="${param.order=='4' }">class="active"</c:if> ><a href="search?${type }=${s }&p=1&order=4" class="asc">销量<i></i></a></li>
       </ul> 
       <ul class="goodlist"> 
       <!-- 可以获得集合数量 -->
       <c:if test="${fn:length(sel_mhcx) == 0}">
          <span style="margin-left: 300px;">
          	<img src="images/s404.png" />抱歉！没有找到与您搜索的相关宝贝。
          </span>
        </c:if>
       <!-- 商品展示循环开始 -->
       	<c:forEach items="${sel_mhcx }" var="go" varStatus="status">
       	<li class="face" onmouseover="this.className='facehover'" onmouseout="this.className='face'"> 
        	<a href="${ctx}/product/detail.html?pid=${go.pid }" class="list-img"> 
        		<img src="${go.pimage }" />
        	</a> 
	        <p> 
	        	<a href="${ctx}/product/detail.html?pid=${go.pid }" class="t2"> ${go.pname }</a>
	        </p> 
	        <p>
	        	<span class="red">价格：￥${go.sellprice }</span>
	        </p> 
        </li> 
        </c:forEach>
        <!-- 商品展示循环结束 -->
       </ul> 
       <!-- 分页 --> 
       <%-- <c:if test="${page.totalCount !=0 }">
       <div class="page"> 
        <div> 
        	<c:if test="${page.pageNow !=1  }">
        		<a class="prev" href="${ctx}/shop/search.html?pageNow=${page.pageNow -1 }">上一页</a>
        	</c:if>

        	<c:if test="${page.pageNow != page.totalCount}">
        		<a class="next" href="${ctx}/shop/search.html?pageNow=${page.pageNow + 1}">下一页</a>
        	</c:if>
         	<span class="rows">共${page.totalCount} 条记录</span>
        </div> 
       </div>
       </c:if> --%>
       
      </div> 
     </div> 
    </div> 
   </div> 
   <!-- 主体 --> 
   <!-- 购物车js --> 
   <script>
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
		var str=obj.name;
		alert(str);
		var uexist="";
		//全选的实现 定义删的发送路径
		$.ajax({
		type:'post', //传送的方式,get/post
		url:'delShoppingCart.goods', //发送数据的地址
		data:{id:str},
		dataType: "json",
		success:function(data){
			var $obj = $(obj);
			$obj.parents("li").remove();
			if(data.sum=="0"){  
			  //判断购物车数量是否为0，为0则隐藏底部查看工具
			   $("div.sc_goods_foot").hide();
			   var html='<p class="sc_goods_none" >您的购物车还是空的，赶紧行动吧！</p>';
			   $("ul.sc_goods_ul").html(html);
			}else{
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

var speed=30; //数字越大速度越慢 
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
   <!-- /购物车js --> 
   <!-- 底部 --> 
   <!-- 底部--> 
   <script type="text/javascript" charset="utf-8" src="js/menudown.js"></script> 
  </div> 
 <%@ include file="jsps/footer.jsp" %> 
  </body>
</html>
