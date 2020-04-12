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
				<form id="updateForm" action="${basepath}/slide/update" id="form_sample_3"
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
<input type="hidden" name="hid" value="${slide.hid }" />
                         <div class="form-group">
							<label class="control-label col-md-3">图片 <span
								class="required"> * </span>
							</label>
							<div class="col-md-4">
								<div class="input-icon right">								
                                 <img src="${slide.hurl}" alt="" style="width: 100px;height: 100px" name="image" id="imgs1">
								<input type="file" name="myfiles" id="imgInput1">
								
								</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">图片简述 <span
								class="required"> * </span>
							</label>
							<div class="col-md-4">
								<div class="input-icon right">
									<input type="text" id="hname" name="hname" value="${slide.hname }"
										class="form-control" />
								</div>
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
	//选择图片
	$("#imgInput1").change(function() {
		$("#imgs1").attr("src", URL.createObjectURL($(this)[0].files[0]));
	});
	
	
	/* 点击取消返回到列表页面 */
	function back(){
		location.href="${basepath}/page/slide/slideList.jsp";
		
	}
	
	
</script>