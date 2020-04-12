<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="page-content-wrapper">
	<!-- BEGIN CONTENT BODY -->
	<div class="page-content">
		<!-- <div class="portlet-title">
				<div class="caption">
					<i class="icon-settings font-dark"></i> <span
						class="caption-subject font-dark sbold uppercase">Advance
						Validation</span>
				</div>
				<div class="actions">
					<div class="btn-group btn-group-devided" data-toggle="buttons">
						<label
							class="btn btn-transparent dark btn-outline btn-circle btn-sm active">
							<input type="radio" name="options" class="toggle" id="option1">Actions
						</label> <label
							class="btn btn-transparent dark btn-outline btn-circle btn-sm">
							<input type="radio" name="options" class="toggle" id="option2">Settings
						</label>
					</div>
				</div>
			</div> -->
		<div class="portlet light portlet-fit portlet-form bordered">
			<div class="portlet-body form">
				<!-- BEGIN FORM-->
				<form id="updateForm" action="${basepath}/goods/insert" id="form_sample_3"
				method="post" enctype="multipart/form-data"	class="form-horizontal form-bordered">
					<div class="form-body">
						<div class="alert alert-danger display-hide">
							<button class="close" data-close="alert"></button>
							You have some form errors. Please check below.
						</div>
						<div class="alert alert-success display-hide">
							<button class="close" data-close="alert"></button>
							Your form validation is successful!
						</div>

                         <div class="form-group">
							<label class="control-label col-md-3">商品图片 <span
								class="required"> * </span>
							</label>
							<div class="col-md-4">
								<div class="input-icon right">
								
                                 <img src="" alt="" style="width: 100px;height: 100px" name="image" id="imgs1">
								<input type="file" name="myfiles" id="imgInput1">
								
								</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">商品名称 <span
								class="required"> * </span>
							</label>
							<div class="col-md-4">
								<div class="input-icon right">

									<input type="text" id="pname" name="pname"
										class="form-control" />
								</div>

							</div>
						</div>
							<div class="form-group">

							<label class="control-label col-md-3">商品售价 <span
								class="required"> * </span>
							</label>
							<div class="col-md-4">
								<div class="input-icon right">

									<input type="text" id="sellprice" name="sellprice"
										class="form-control" />
								</div>

							</div>
						</div>							<div class="form-group">

							<label class="control-label col-md-3">商品市场价 <span
								class="required"> * </span>
							</label>
							<div class="col-md-4">
								<div class="input-icon right">

									<input type="text" id="cityprice" name="cityprice"
										class="form-control" />
								</div>

							</div>
						</div>
													<div class="form-group">

							<label class="control-label col-md-3">商品 热度<span
								class="required"> * </span>
							</label>
							<div class="col-md-4">
								<div class="input-icon right">

									<input type="text" id="heat" name="heat"
										class="form-control" />
								</div>

							</div>
						</div>
													<div class="form-group">

							<label class="control-label col-md-3">商品尺寸<span
								class="required"> * </span>
							</label>
							<div class="col-md-4">
								<div class="input-icon right">

									<input type="text" id="format" name="format"
										class="form-control" />
								</div>

							</div>
						</div>
													<div class="form-group">

							<label class="control-label col-md-3">商品运费 <span
								class="required"> * </span>
							</label>
							<div class="col-md-4">
								<div class="input-icon right">

									<input type="text" id="freight" name="freight"
										class="form-control" />
								</div>

							</div>
						</div>
													<div class="form-group">

							<label class="control-label col-md-3">商品描述 <span
								class="required"> * </span>
							</label>
							<div class="col-md-4">
								<div class="input-icon right">

									<input type="text" id="bewrite" name="bewrite"
										class="form-control" />
								</div>

							</div>
						</div>
						
						<div class="form-group">

							<label class="control-label col-md-3">库存数量 <span
								class="required"> * </span>
							</label>
							<div class="col-md-4">
								<div class="input-icon right">
									<input
										type="text" id="stock" name="stock"
										class="form-control" />
								</div>

							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-3">商品大类型<span
								class="required"> * </span>
							</label>
							<div class="col-md-4" id="select">
								<select id="bid" name="bid" onchange="getclass()" style="width: 180px; margin-top: 10px;" class="form-control">
									<option value="0">--请选择--</option>
									<c:forEach items="${big}" var="big">
										<option value="${big.bid }">${big.bname}</option>
									</c:forEach>
								</select>


							</div>
							<!-- <a style="color:red;text-decoration: none;" onclick="add()">+扩展分类</a> -->
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">商品小类型<span
								class="required"> * </span>
							</label>
							<div class="col-md-4">
								<select id="cid" name="cid" style="width: 180px; margin-top: 10px;" class="form-control">
									<option value="0">--请选择--</option>
									
								</select>
							</div>
						</div>
						<div class="form-actions">
							<div class="row">
								<div class="col-md-offset-3 col-md-9">
									<button type="submit" id="addsubmit" 
										class="btn green">提交</button>
									<button type="button" class="btn default" onclick="back()">取消</button>
								</div>
							</div>
						</div>
				</form>
				<!-- END FORM-->
			</div>
		</div>
	</div>
</div>
<%@ include file="../footer.jsp"%>
<script type="text/javascript">


/* 获取小类型 */
    function getclass(){
    	var bid=$('#bid option:selected').val();
    	$.ajax({
    		type:'post',
    		url:"${basepath}/goods/getsmall",
    		data:{"bid":bid},
    		success:function(res){
    			$("#cid").empty();
    			for(var i in res){
    				var  mm="<option value='"+res[i].cid+"'>"+res[i].cname+"</option>"
    			    $("#cid").append(mm);
    			}
    		}
    	})
    }
/* 添加元素 */
function add(){
	var mm='<select id="bid" name="bid" onchange="getclass()" style="width: 180px; margin-top: 10px;" class="form-control">'+
		'<option value="0">--请选择--</option>'+
		'<c:forEach items="${bigclass}" var="big">'+
			'<option value="${big.bid }">${big.bname}</option>'+
		'</c:forEach></select><a id="remove"style="color:red" float:left; onclick="remove()">--移除</a>';
	$("#select").append(mm);
}
/* 移除元素 */
function remove(){
	$("#remove").prev().remove();//移除最后一个元素
	$("#remove").remove();//移除元素
}















/* 进行数据的添加 */
	function updateuser(){
	var pname=$("#pname").val();
	var bid=$("#bid").val();
	var cid=$("#cid").val();
    var cityprice=$("#cityprice").val();
    var sellprice=$("#sellprice").val();
    var heat=$("#heat").val();
    var bewrite=$("#bewrite").val();
    var stock=$("#stock").val();
    var format=$("#format").val();
    var freight=$("#freight").val();
			$.ajax({
				url:"${basepath}/goods/insert",
				type:"post",
				mimeType:"multipart/form-data",
				 contentType:undefined,
	             processData:true,
				data:{"pname":pname,"bid":bid,"cid":cid,"cityprice":cityprice,"sellprice":sellprice,"heat":heat,"bewrite":bewrite,"stock":stock,"format":format,"freight":freight,"image":document.getElementById("imgInput1").files},
				success:function(data){
					if(data.code === 200){
						swal("添加成功");
		          window.location.href = "<%=request.getContextPath() %>/admin/product/goodsList.jsp";	
					}else if(data.code ===500){
						swal(data.msg);
					}else{
						swal("添加失败");
					}
				}
			});
	}
	//选择图片
	$("#imgInput1").change(function() {
					$("#imgs1").attr("src", URL.createObjectURL($(this)[0].files[0]));
	});
	
	
	
	
	/* 点击取消返回到列表页面 */
	function back(){
		location.href="${basepath}/page/product/goodsList.jsp";
		
	}
	
	
</script>