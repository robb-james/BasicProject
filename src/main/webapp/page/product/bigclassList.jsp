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
	                                        			<button id="searchMember" type="button" class="btn green" onclick="comeadd()">新增类型</button>
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
					                              
					                                <th>名称 </th>
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
		var table = $('#member_1'); 
		var oTable ;
		oTable = initTable();		
		var i=0;
		$("#searchMember").click(function(){
			var sendUser = $("#sendUser").val();
			var messageType = $("#messageType").val();
			
			oTable.fnDestroy(false);
			oTable = initTable(sendUser,messageType,0);
		}); 
		//跳转指定页码
	    function pageclick(page){
	    	oTable.fnPageChange(page);
	    }
		function initTable (sendUser,messageType,is) {
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
			        "sendUser"    : sendUser,
					"messageType"  : messageType       
					
				},          	
				dataSrc: function (json) {
				var j = JSON.stringify(json);
				return json.data;
		    },
			
		    url : "${basepath}/big/findall",
		    type : "POST",
		    async : async
		  },
		  
		 /*  "fnDrawCallback": function(){
			 
	        }, */
		
		    "aoColumns":[
				{"mDataProp":function(lineData){
		                var id = lineData.bid;
		                return '<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input type="checkbox" name="memberid" class="checkboxes" value="'+id+'"/></<label> <span></span>';
		            }},
		      
		        { "mDataProp": "bname" },
		       
				{ 
				   "mDataProp": function(lineData){
					   return '<a href="${basepath}/big/getinfo?id='+lineData.bid+'" class="btn btn-icon-only yellow" title="编辑"><i  class="fa fa-file-o"></i></a>';
	               	 	}
				    } 
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
		        // Or you can use remote translation file
		        //"language": {
		        //   url: '//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Portuguese.json'
		        //},
		
		        // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
		        // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js). 
		        // So when dropdowns used the scrollable div should be removed. 
		        //"dom": "<'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",
		
		    
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
		/* function exportMember(state){
			$.ajax({
				url:"${basepath}/admin/member/exportAllMember",
				type:"post",
				data:{"state":state},
				success:function(data){
					if(data){
						
					}
				}
			});
		} */
	/* 禁用事件 */
		function del(id){
			swal({
			  title: '您确定要禁用吗?',
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
						url:"${basepath}/role/delete",
						type:"post",
						data:{"id":id,"status":1},
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
		function accpetAll(id){
			swal({
				  title: '您确定要起用吗?',
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
							url:"${basepath}/role/delete",
							type:"post",
							data:{"id":id,"status":0},
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
			location.href="${basepath}/page/product/addbigclass.jsp"	;	
		}
	
</script>
