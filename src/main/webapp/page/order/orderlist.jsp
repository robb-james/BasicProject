<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="../header.jsp" %>
<body>
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
	                                            	<label>订单编号:
		                                        			<input id="oid" class="form-control input-inline input-medium" placeholder="" aria-controls="sample_1">
		                                        		</label>
		                                        		<label style="margin-bottom:-12px;margin-left:55px">
		                                        			<span style="float:left;margin-top:15px">订单类型:</span>
		                                        		 	<select id="ostate" style="float:right;width:150px;margin-top: 10px;" class="form-control">
			                                        		    <option value="0">--选择商品类型--</option>
		                                                        <option value="1">待付款</option>
		                                                         <option value="2">待发货</option>
		                                                          <option value="3">已发货</option>
		                                                           <option value="4">交易取消</option>
		                                                            <option value="5">交易成功</option>
		                                                             <option value="6">货到付款</option>
			                                        		 </select>
	                                        			</label>
		                                        		<button id="searchMember" type="button" class="btn green">查询</button>
                                        			</div>
	                                        	</div>
                                            </form>
                                        </div>
                                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="member_1">
					                        <thead>
					                            <tr>
					                                <th>
					                                    <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
					                                        <input type="checkbox"  class="group-checkable" data-set="#member_1 .checkboxes" />
					                                        <span></span>
					                                    </label>
					                                </th>
					                              
					                                  <th>订单编号 </th>
					                                  <th>商品名称 </th>
					                                  <th>商品图片 </th>
					                                  <th>商品数量 </th>
					                                  <th>添加时间</th>
					                                  <th>订单状态</th>
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
			var oid = $("#oid").val();
			var ostate = $("#ostate").val();
			
			oTable.fnDestroy(false);
			oTable = initTable(oid,ostate,0);
		}); 
		//跳转指定页码
	    function pageclick(page){
	    	oTable.fnPageChange(page);
	    }
		function initTable (oid,ostate,is) {
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
			        "oid"    : oid,
					"ostate"  : ostate       
					
				},          	
				dataSrc: function (json) {
				var j = JSON.stringify(json);
				return json.data;
		    },
			
		    url : "${basepath}/order/findall",
		    type : "POST",
		    async : async
		  },
		    "aoColumns":[
				{"mDataProp":function(lineData){
		                var id = lineData.oid;
		                return '<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input type="checkbox" name="memberid" class="checkboxes" value="'+id+'"/></<label> <span></span>';
		            }},
		        { "mDataProp": "oid" },
		        { "mDataProp": "gname" },
		        { "mDataProp": function(lineData){
		        	return "<img src='"+lineData.gimage+"' style='width:50px;height:50px''/>";
		        }},
		        { "mDataProp": "num" },
		        { "mDataProp": "otime" },
		        { "mDataProp": function(lineData){
		        	var status=lineData.ostate;
		        	if(status==1){
		        		return "<span style='color:red'>待付款</span>";
		        	}else if(status==2){
		        		return "<span style='color:red'>待发货</span>";
		        	}else if(status==3){
		        		return "<span style='color:red'>已发货</span>";
		        	}else if(status==4){
		        		return "<span style='color:red'>交易取消</span>";
		        	}else if(status==5){
		        		return "<span style='color:red'>交易成功</span>";
		        	}else if(status==6){
		        		return "<span style='color:red'>货到付款</span>";
		        	}
		        }},
				{ 
				   "mDataProp": function(lineData){
					   var status=lineData.ostate;
						if(status==1){
			        		return "<span style='color:red'>待付款</span>";
			        	}else if(status==2){
			        		 return "<a  onclick='update("+lineData.oid+")' class='btn btn-icon-only yellow' title='编辑'>发货</a>";
			        	}else if(status==3){
			        		return "<span style='color:#f5059e'>待收货</span>";
			        	}else if(status==4){
			        		return "<span style='color:#1129de'>交易取消</span>";
			        	}else if(status==5){
			        		return "<span style='color:#11de81'>交易完成</span>";
			        	}else if(status==6){
			        		return "<span style='color:#deb311'>货到付款</span>";
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
	

		function update(oid){
			$.ajax({
				url:"${basepath}/order/update",
				type:"post",
				data:{"oid":oid},
				success:function(data){
					if(data.code === 200){
						var start = oTable.fnSettings()._iDisplayStart;
						var length = oTable.fnSettings()._iDisplayLength;
						oTable.fnDestroy(false);
						initTable(null,null,null,null,null,1);
						pageclick(start/length);
					}else{
						swal("发货失败");
					}
				}
			});
		}
	
</script>
</body>
</html>