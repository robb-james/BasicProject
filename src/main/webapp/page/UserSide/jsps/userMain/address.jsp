<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>

<c:if test="${user_session.uname == null}">
	<script type="text/javascript">
		window.location.href = "${ctx}/shop/home.html";
	</script>
</c:if>

<div class="center_right" style="display: block;">

	<div class="red" style="clear:both; overflow:hidden; padding:10px;">收货地址管理（选中表示为默认）</div>
	<form method="post" class="person-add" name="form" action="">
		<ul style="margin-left:40px;" class="list">
			<c:forEach items="${dizhi }" var="address">
				<li id="d${address.did }">
					<span><input type="radio" id="did" name="did" value="${address.did }" <c:if test="${address.morendizhi==1 }">checked="checked"</c:if>></span>
					${address.province } ${address.city } ${address.area }${address.dizhi } 收货人：${address.username }  手机号：${address.dianhua }
				</li>
			</c:forEach>
			<li>
				<input type="button" class="btn-xiugai redd"  checked="checked" id="isdefault" value="设置默认" onclick="shezhi();">&nbsp;
				<input type="button" class="btn-xiugai blue" value="删除" onclick="shanchu();">&nbsp;
				<a href="${ctx}/dizhi/jumpadd.html" class="btn-xiugai orange">增加</a>
			</li>
			<br/>
		</ul>
	</form>
	<script type="text/javascript">
		//设置默认
		function shezhi() {
		    //判断是否是默认地址 
		    if (document.getElementById("isdefault").checked) {
		       var info="1"; //是默认
		    }else {
		      var info="0"; //不是默认
		    }
    
			var mr = $('input:radio[name="did"]:checked').val();
			//判断新地址是否选中,获取地址id
			if (mr == null) {
				alert("请选择一个地址!");return false;
			}else{
				$.ajax({
					type : 'post', //传送的方式,get/post
					url : 'dizhi/shezhi.html', //发送数据的地址
					data : {
						morendizhi : info,
						did : mr
					},
					dataType : "json",
					success : function(data) {
						if(data.msg == "ok"){
							layer.alert("设置成功！",{icon:1},function(index){
							    layer.close(index);
								location.href='dizhi/jumpdd.html';
							});
							
						}else if(data.msg == "no"){
							layer.alert("设置失败！",{icon:1},function(index){
							    layer.close(index);
								location.href='dizhi/jumpdd.html';
							});
						}
					}, error : function(event, XMLHttpRequest, ajaxOptions, thrownError) {
						alert("操作异常！");
				     }
			    });
			}}
				
		//删除地址
		function shanchu() {
			var sc = $('input:radio[name="did"]:checked').val();
			//判断新地址是否选中,获取地址id
			if (sc == null) {
				alert("请选择一个地址!");return false;
		   }else{
			$.ajax({
					type : 'post', //传送的方式,get/post
					url : 'dizhi/shanchu.html', //发送数据的地址
					data : {
						morendizhi : sc
					},
					dataType : "json",
					success : function(data) {
						if(data.msg == "ok"){
							 layer.alert("删除成功！",{icon:1},function(index){
							    layer.close(index);
								location.href='dizhi/jumpdd.html';
							});
							}else if(data.msg == "no"){
							  layer.alert("删除失败！",{icon:2});
						 }
					}, error : function(event, XMLHttpRequest, ajaxOptions, thrownError) {
						alert("操作异常！");
				     }
				});
			}
		}
	</script>
	<!-- 个人中心 初始状态 end -->
</div>