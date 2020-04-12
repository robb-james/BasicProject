<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
                <div class="page-content-wrapper">
                    <!-- BEGIN CONTENT BODY -->
                    <div class="page-content">
                        <div class="row">
                            <div class="col-md-12">
                                <!-- BEGIN EXAMPLE TABLE PORTLET-->
                                <div class="portlet light bordered">
                                    <div class="portlet-body" style="padding-top:0px">
                                    	<div class="portlet-body" style="padding-top:0px">
                                        <div class="portlet-body form " style="padding-top:0px">
                                        <form role="form" class="form-horizontal form-bordered" method="post">
                                            	<div class="form-body">
	                                            	<div class="form-group">
	                                            	<label>商品名称:
		                                        			<input id="pname" class="form-control input-inline input-medium" placeholder="" aria-controls="sample_1">
		                                        		</label>
		                                        		<label style="margin-bottom:-12px;margin-left:55px">
		                                        			<span style="float:left;margin-top:15px">商品类型:</span>
		                                        		 	<select id="bid" style="float:right;width:150px;margin-top: 10px;" class="form-control">
			                                        		    <option value="">--选择商品类型--</option>
		                                                       
			                                        		 </select>
	                                        			</label>
		                                        		<button id="searchMember" type="button" class="btn green">查询</button>
	                                        			<button id="searchMember" type="button" class="btn green" onclick="comeadd()">添加商品</button>
                                        			</div>
	                                        	</div>
                                            </form>
                                        </div>
                                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="member_1">
					                        <thead>
					                            <tr>
					                                <th>
					                                    <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
					                                        <input type="checkbox" class="group-checkable" data-set="#member_1 .checkboxes" />
					                                        <span></span>
					                                    </label>
					                                </th>
					                              
					                                  <th>商品名称 </th>
					                                   <th>商品图片 </th>
					                                  <th>商品类型 </th>
					                                  <th>商品价格 </th>
					                                  <th>商品数量 </th>
					                                  <th>添加时间</th>
					                                  <th>商品状态</th>
					                               	<th style="width: 289px"> 操作 </th>
					                            </tr>
					                        </thead>
					                  </table>
                                    </div>
                                </div>
                                <!-- END EXAMPLE TABLE PORTLET-->
                            </div>
                        </div>
                    </div>
                    <!-- END CONTENT BODY -->
                </div>
<%@ include file="../footer.jsp" %>
<script type="text/javascript">

$(function(){
	$.ajax({
		url:"${basepath}/big/findall",
		type:"post",
		success:function(res){
			 for(var o in res.data){  
			var  mm="<option value='"+res.data[o].bid+"'>"+res.data[o].bname+"</option>"
			    $("#bid").append(mm);
			  }  

		}
	});
	
	
	
})



		var table = $('#member_1'); 
		var oTable ;
		oTable = initTable();		
		var i=0;
		$("#searchMember").click(function(){
			var gname = $("#gname").val();
			var bid = $("#bid").val();
			
			oTable.fnDestroy(false);
			oTable = initTable(gname,bid,0);
		}); 
		//跳转指定页码
	    function pageclick(page){
	    	oTable.fnPageChange(page);
	    }
		function initTable (gname,bid,is) {
			var async;
			if(is==1){//条件查询时为同步
				async = false;
			}else{//首次加载,为异步请求
				async = true;	
			}
		    // begin first table
		    oTable=table.dataTable({
				 "bServerSide": true,
			     //"sAjaxSource": "listuser",
			     "bProcessing": true,
		        "bFilter": true,//过滤功能
		        "bSort": false,//排序功能 
				"ajax" : { 
				data :{
			        "gname"    : gname,
					"bid"  : bid       
					
				},          	
				dataSrc: function (json) {
				var j = JSON.stringify(json);
				return json.data;
		    },
			
		    url : "${basepath}/goods/findUserByPage",
		    type : "POST",
		    async : async
		  },
		    "aoColumns":[
				{"mDataProp":function(lineData){
		                var id = lineData.pid;
		                return '<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input type="checkbox" name="memberid" class="checkboxes" value="'+id+'"/></<label> <span></span>';
		            }},
		      
		        { "mDataProp": "pname" },
		        { "mDataProp": function(lineData){
		        	return "<img src='"+lineData.pimage+"' style='width:50px;height:50px''/>";
		        }},
		        { "mDataProp": "bname" },
		        { "mDataProp": "sellprice" },
		        { "mDataProp": "stock" },
		        { "mDataProp": "time" },
		        { "mDataProp": function(lineData){
		        	  var status=lineData.state;
		        		if(status==1){
		        			 return '<span class="label label-sm label-success">已上架</span>';
			        	}else{
			        		
			        		 return '<span class="label label-sm label-danger">已下架</span>';
			        	}
		        	
		        } },
		        
				{ 
				   "mDataProp": function(lineData){
					   var status=lineData.state;
				  
					  if(status==1){
							return '<button type="button" onclick="update(\''+lineData.pid+'\',2)" class="btn btn-danger">下架</button><a href="${basepath}/goods/getinfo?pid='+lineData.pid+'" class="btn btn-icon-only yellow" title="编辑"><i  class="fa fa-file-o"></i></a><a onclick="del(\''+lineData.pid+'\')" class="btn btn-icon-only blue" title="删除"><i class="fa fa-times" ></i></a>';
					  }else{
	               	 	return '<button type="button" onclick="update(\''+lineData.pid+'\',1)" class="btn btn-success">上架</button><a href="${basepath}/goods/getinfo?pid='+lineData.pid+'" class="btn btn-icon-only yellow" title="编辑"><i  class="fa fa-file-o"></i></a><a onclick="del(\''+lineData.pid+'\')" class="btn btn-icon-only blue" title="删除"><i class="fa fa-times" ></i></a>';
					  }
				    } 
				 },
		      //  { "data": "salary" }
		    ]
			,
		        // Internationalisation. For more info refer to http://datatables.net/manual/i18n
		        "language": {
		            "aria": {
		                "sortAscending": ": 以升序排列此列",
		                "sortDescending": ": 以降序排列此列"
		            },
		            "emptyTable": "没有可用数据",
		            "info": "显示 _START_ 到 _END_ / _TOTAL_ 条",
		            "infoEmpty": "无数据",
		            //"infoFiltered": "(filtered1 from _MAX_ total records)",
		            "lengthMenu": "显示 _MENU_",
		            "search": "搜索:",
		            "zeroRecords": "没有发现匹配的数据",
		            "paginate": {
		                "previous":"上一页",
		                "next": "下一页",
		                "last": "最后一页",
		                "first": "第一页"
		            }
		        },
		    searching : false,
		        
		    
		        "lengthMenu": [
		            [5, 15, 20, 50],
		            [5, 15, 20, 50] // change per page values here
		        ],
		        // set the initial value
		        "pageLength": 15,            
		        "pagingType": "bootstrap_full_number",
		        "columnDefs": [
		            {  // set default column settings
		                'orderable': false,
		                'targets': [0]
		            }, 
		            {
		                "searchable": false,
		                "targets": [0]
		            },
		            {
		                "className": "dt-right", 
		                //"targets": [2]
		            }
		        ],
		        "order": [
		            [1, "asc"]
		        ] // set first column as a default sort by asc
		    });
		
			var tableWrapper = jQuery('#member_1_wrapper');
		
			table.find('.group-checkable').change(function () {
			    var set = jQuery(this).attr("data-set");
			    var checked = jQuery(this).is(":checked");
			    jQuery(set).each(function () {
			        if (checked) {
			            $(this).prop("checked", true);
			            $(this).parents('tr').addClass("active");
			        } else {
			            $(this).prop("checked", false);
			            $(this).parents('tr').removeClass("active");
			        }
			    });
			});
		
			table.on('change', 'tbody tr .checkboxes', function () {
			    $(this).parents('tr').toggleClass("active");
			});
			return oTable;
		}
	/* 删除事件 */
		function del(id){
			swal({
			  title: '您确定要删除吗?',
			  type: 'warning',
			  allowOutsideClick: 'true',
			  showConfirmButton: 'true',
			  showCancelButton: 'true',
			  confirmButtonClass: 'btn-danger',
			  cancelButtonClass: 'btn-info',
			  confirmButtonText: '取消',
			  cancelButtonText: '确定',
			},
			function(isConfirm){
		        if (isConfirm){
		        	swal.close();
		        } else {
		        	$.ajax({
						url:"${basepath}/goods/delete",
						type:"post",
						data:{"pid":id},
						success:function(data){
							if(data.code === 200){
								var start = oTable.fnSettings()._iDisplayStart;
								var length = oTable.fnSettings()._iDisplayLength;
								oTable.fnDestroy(false);
								initTable(null,null,null,null,null,1);
								pageclick(start/length);
							}else{
								swal("删除失败");
							}
						}
					});
		        }
			});
		}
	/* 下架商品 */
		function update(id,status){
			swal({
			  title: '您确定要上架此商品吗?',
			  type: 'warning',
			  allowOutsideClick: 'true',
			  showConfirmButton: 'true',
			  showCancelButton: 'true',
			  confirmButtonClass: 'btn-danger',
			  cancelButtonClass: 'btn-info',
			  confirmButtonText: '取消',
			  cancelButtonText: '确定',
			},
			function(isConfirm){
		        if (isConfirm){
		        	swal.close();
		        } else {
		        	$.ajax({
						url:"${basepath}/goods/updatestate",
						type:"post",
						data:{"pid":id,"state":status},
						success:function(data){
							if(data.code === 200){
								var start = oTable.fnSettings()._iDisplayStart;
								var length = oTable.fnSettings()._iDisplayLength;
								oTable.fnDestroy(false);
								initTable(null,null,null,null,null,1);
								pageclick(start/length);
							}else{
								swal("删除失败");
							}
						}
					});
		        }
			});
		}
	
	
	
	
		function comeadd(){
			location.href="${basepath}/goods/goadd";	
		}
	
</script>
