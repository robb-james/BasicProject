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
				<form id="updateForm" action="#" id="form_sample_3"
					class="form-horizontal form-bordered">
					<div class="form-body">
						<div class="alert alert-danger display-hide">
							<button class="close" data-close="alert"></button>
							You have some form errors. Please check below.
						</div>
						<div class="alert alert-success display-hide">
							<button class="close" data-close="alert"></button>
							Your form validation is successful!
						</div>
						<input type="hidden" value="${classify.cid}" id="cid" name="cid">
						<div class="form-group">
							<label class="control-label col-md-3">名称<span
								class="required"> * </span>
							</label>
							<div class="col-md-4">
								<input type="text" id="cname" name="cname" data-required="1"value="${classify.cname }"
									class="form-control" />
							</div>
						</div>
							<div class="form-group">
							<label class="control-label col-md-3">商品类型<span
								class="required"> * </span>
							</label>
							<div class="col-md-4">
								<select id="bid" name="bid" style="width: 180px; margin-top: 10px;" class="form-control">
									<option value="0">--请选择--</option>
									<c:forEach items="${bigclass}" var="big">
										<c:choose>
									<c:when test="${classify.bid==big.bid}">
									<option selected="selected" value="${big.bid }">${big.bname}</option>
									</c:when>
									<c:otherwise>
										<option value="${big.bid }">${big.bname}</option>
										</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</div>
						</div>
	<div class="form-group">
							<label class="control-label col-md-3">描述<span
								class="required"> * </span>
							</label>
							<div class="col-md-4">
								<input type="text" id="cremark" name="cremark" data-required="1"value="${classify.cremark }"
									class="form-control" />
							</div>
						</div>
						<div class="form-actions">
							<div class="row">
								<div class="col-md-offset-3 col-md-9">
									<button type="button" id ="addsubmit" onclick="update()" class="btn green">提交</button>
								</div>
							</div>
						</div>
					
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="../footer.jsp"%>
<script type="text/javascript">

	function update(){
	
		var name = $("#cname").val();
	
		if(name == "" || name==null){
			swal("名称不能为空");
		}else{
		
			$.ajax({
				url:"${basepath}/classify/update",
				type:"post",
				data:$("#updateForm").serialize(),
				success:function(data){
					if(data.code === 200){
						swal("添加成功");
		        window.location.href = "<%=request.getContextPath() %>/page/product/classifyList.jsp";
						
					}else{
						swal("添加失败");
					}
				}
			});
		}
	}
	
</script>