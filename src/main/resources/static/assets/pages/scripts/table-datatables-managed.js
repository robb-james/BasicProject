var TableDatatablesManaged = function () {

	  var initTable1 = function () {

	        var table = $('#sample_1');

	        // begin first table
	        table.dataTable({
				  "bServerSide": true,
	            //"sAjaxSource": "listuser",
	            "bProcessing": true,
	         
	            "bFilter": true,//过滤功能
	            "bSort": false,//排序功能 
		         
	            
				"ajax" : { 
				data :{
	            'nameweqe' : "fgdasfghdfgh",
				"ghh":"gggg"         
				},          	
				dataSrc: function (json) {
				var j = JSON.stringify(json);
			//	alert(j);//用来判断其他信息。
				return json.data;
	        },
			
	        url : "http://localhost:8080/admin/member/list",
	        type : "POST"
	      },
	  

	        "aoColumns":[
				{"mDataProp":function(lineData){
	                    var id = lineData.memberid;
	                    return '<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input type="checkbox" name="first_name" class="checkboxes" value="'+id+'"/></<label> <span></span>';
	                }},
	            { "mDataProp": "memberno" },
	            { "mDataProp": "realname" },
	            { "mDataProp": "resellerno" },
	            { "mDataProp": "recommenderid" },
	            { "mDataProp": "bonuspaytype" },
	            { "mDataProp": "activedatetime" },
	            { "mDataProp": "userlevel" },
	            { "mDataProp": "billtype" },
	            { "mDataProp": "status" },
	            { "mDataProp": "balance" },
	            { "mDataProp": "period" },
	            { "mDataProp": "islock" },
	            { "mDataProp": "bonusreconsume" },
	            { "mDataProp": "bonusnotused" },
	            { "mDataProp": "bonus" },
	            { "mDataProp": "recommenderall" },
	            { "mDataProp": "recommendercount" },
				{ 
				   "mDataProp": function(lineData){
					 return '<div class="btn-group">'+
	                             '<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions'+
	                                '<i class="fa fa-angle-down"></i>'+
	                              '</button>'+
	                               '<ul class="dropdown-menu pull-left" role="menu">'+
	                                     '<li>'+
	                                     '<a href="javascript:;">'+
	                                      '<i class="icon-docs"></i> New Post </a>'+
	                                      '</li>'+
	                                      '<li>'+
	                                      '<a href="javascript:;">'+
	                                      '<i class="icon-tag"></i> New Comment </a>'+
	                                      '</li>'+
	                                      '<li>'+
	                                      '<a href="javascript:;">'+
	                                      '<i class="icon-user"></i> New User </a>'+
	                                      '</li>'+
	                                      '<li class="divider"> </li>'+
	                                        '<li>'+
	                                         '<a href="javascript:;">'+
	                                        '<i class="icon-flag"></i> Comments'+
	                                        '<span class="badge badge-success">4</span>'+
	                                        '</a>'+
	                                     '</li>'+
	                                 '</ul>'+
	                          ' </div>';
					 
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
	            // Or you can use remote translation file
	            //"language": {
	            //   url: '//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Portuguese.json'
	            //},

	            // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
	            // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js). 
	            // So when dropdowns used the scrollable div should be removed. 
	            //"dom": "<'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",

	        
	            "lengthMenu": [
	                [5, 15, 20, -1],
	                [5, 15, 20, "All"] // change per page values here
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

        var tableWrapper = jQuery('#sample_1_wrapper');

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
    }

    var initTable1_2 = function () {

        var table = $('#sample_1_2');

        // begin first table
        table.dataTable({

            // Internationalisation. For more info refer to http://datatables.net/manual/i18n
            "language": {
                "aria": {
                    "sortAscending": ": activate to sort column ascending",
                    "sortDescending": ": activate to sort column descending"
                },
                "emptyTable": "No data available in table",
                "info": "Showing _START_ to _END_ of _TOTAL_ records",
                "infoEmpty": "No records found",
                "infoFiltered": "(filtered1 from _MAX_ total records)",
                "lengthMenu": "Show _MENU_",
                "search": "Search:",
                "zeroRecords": "No matching records found",
                "paginate": {
                    "previous":"Prev",
                    "next": "Next",
                    "last": "Last",
                    "first": "First"
                }
            },

            // Or you can use remote translation file
            //"language": {
            //   url: '//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Portuguese.json'
            //},

            // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
            // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js). 
            // So when dropdowns used the scrollable div should be removed. 
            //"dom": "<'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",

            "bStateSave": false, // save datatable state(pagination, sort, etc) in cookie.

            "lengthMenu": [
                [5, 15, 20, -1],
                [5, 15, 20, "All"] // change per page values here
            ],

            // set the initial value
            "pageLength": 5,            
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
            ], // set first column as a default sort by asc

            initComplete: function () {

                // username column
                this.api().column(1).every(function(){
                    var column = this;
                    var select = $('<select class="form-control input-sm"><option value="">Select</option></select>')
                        .appendTo( $(column.footer()).empty() )
                        .on( 'change', function () {
                            var val = $.fn.dataTable.util.escapeRegex(
                                $(this).val()
                            );     
                            column
                                .search( val ? '^'+val+'$' : '', true, false )
                                .draw();
                        } );
     
                    column.data().unique().sort().each( function ( d, j ) {
                        select.append( '<option value="'+d+'">'+d+'</option>' )
                    } );
                });

            }
        });

        var tableWrapper = jQuery('#sample_1_2_wrapper');

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
    }

    var initTable2 = function () {

        var table = $('#sample_2');

        table.dataTable({

            // Internationalisation. For more info refer to http://datatables.net/manual/i18n
            "language": {
                "aria": {
                    "sortAscending": ": activate to sort column ascending",
                    "sortDescending": ": activate to sort column descending"
                },
                "emptyTable": "No data available in table",
                "info": "Showing _START_ to _END_ of _TOTAL_ records",
                "infoEmpty": "No records found",
                "infoFiltered": "(filtered1 from _MAX_ total records)",
                "lengthMenu": "Show _MENU_",
                "search": "Search:",
                "zeroRecords": "No matching records found",
                "paginate": {
                    "previous":"Prev",
                    "next": "Next",
                    "last": "Last",
                    "first": "First"
                }
            },

            // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
            // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js). 
            // So when dropdowns used the scrollable div should be removed. 
            //"dom": "<'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",

            "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.
            "pagingType": "bootstrap_extended",

            "lengthMenu": [
                [5, 15, 20, -1],
                [5, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "pageLength": 5,
            "columnDefs": [{  // set default column settings
                'orderable': false,
                'targets': [0]
            }, {
                "searchable": false,
                "targets": [0]
            }],
            "order": [
                [1, "asc"]
            ] // set first column as a default sort by asc
        });

        var tableWrapper = jQuery('#sample_2_wrapper');

        table.find('.group-checkable').change(function () {
            var set = jQuery(this).attr("data-set");
            var checked = jQuery(this).is(":checked");
            jQuery(set).each(function () {
                if (checked) {
                    $(this).prop("checked", true);
                } else {
                    $(this).prop("checked", false);
                }
            });
        });
    }

    var initTable3 = function () {

        var table = $('#sample_3');

        // begin: third table
        table.dataTable({

            // Internationalisation. For more info refer to http://datatables.net/manual/i18n
            "language": {
                "aria": {
                    "sortAscending": ": activate to sort column ascending",
                    "sortDescending": ": activate to sort column descending"
                },
                "emptyTable": "No data available in table",
                "info": "Showing _START_ to _END_ of _TOTAL_ records",
                "infoEmpty": "No records found",
                "infoFiltered": "(filtered1 from _MAX_ total records)",
                "lengthMenu": "Show _MENU_",
                "search": "Search:",
                "zeroRecords": "No matching records found",
                "paginate": {
                    "previous":"Prev",
                    "next": "Next",
                    "last": "Last",
                    "first": "First"
                }
            },
            
            // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
            // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js). 
            // So when dropdowns used the scrollable div should be removed. 
            //"dom": "<'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",

            "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.
            
            "lengthMenu": [
                [6, 15, 20, -1],
                [6, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "pageLength": 6,
            "columnDefs": [{  // set default column settings
                'orderable': false,
                'targets': [0]
            }, {
                "searchable": false,
                "targets": [0]
            }],
            "order": [
                [1, "asc"]
            ] // set first column as a default sort by asc
        });

        var tableWrapper = jQuery('#sample_3_wrapper');

        table.find('.group-checkable').change(function () {
            var set = jQuery(this).attr("data-set");
            var checked = jQuery(this).is(":checked");
            jQuery(set).each(function () {
                if (checked) {
                    $(this).prop("checked", true);
                } else {
                    $(this).prop("checked", false);
                }
            });
        });
    }

    var initTable4 = function () {

        var table = $('#sample_4');

        // begin: third table
        table.dataTable({

            // Internationalisation. For more info refer to http://datatables.net/manual/i18n
            "language": {
                "aria": {
                    "sortAscending": ": activate to sort column ascending",
                    "sortDescending": ": activate to sort column descending"
                },
                "emptyTable": "No data available in table",
                "info": "Showing _START_ to _END_ of _TOTAL_ records",
                "infoEmpty": "No records found",
                "infoFiltered": "(filtered1 from _MAX_ total records)",
                "lengthMenu": "Show _MENU_",
                "search": "Search:",
                "zeroRecords": "No matching records found",
                "paginate": {
                    "previous":"Prev",
                    "next": "Next",
                    "last": "Last",
                    "first": "First"
                }
            },

            
            // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
            // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js). 
            // So when dropdowns used the scrollable div should be removed. 
            //"dom": "<'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",

            "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.
            
            "lengthMenu": [
                [6, 15, 20, -1],
                [6, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "pageLength": 6,
            "columnDefs": [{  // set default column settings
                'orderable': false,
                'targets': [0]
            }, {
                "searchable": false,
                "targets": [0]
            }],
            "order": [
                [1, "asc"]
            ] // set first column as a default sort by asc
        });

        var tableWrapper = jQuery('#sample_4_wrapper');

        table.find('.group-checkable').change(function () {
            var set = jQuery(this).attr("data-set");
            var checked = jQuery(this).is(":checked");
            jQuery(set).each(function () {
                if (checked) {
                    $(this).prop("checked", true);
                } else {
                    $(this).prop("checked", false);
                }
            });
        });
    }

    var initTable5 = function () {

        var table = $('#sample_5');

        // begin: third table
        table.dataTable({

            // Internationalisation. For more info refer to http://datatables.net/manual/i18n
            "language": {
                "aria": {
                    "sortAscending": ": activate to sort column ascending",
                    "sortDescending": ": activate to sort column descending"
                },
                "emptyTable": "No data available in table",
                "info": "Showing _START_ to _END_ of _TOTAL_ records",
                "infoEmpty": "No records found",
                "infoFiltered": "(filtered1 from _MAX_ total records)",
                "lengthMenu": "Show _MENU_",
                "search": "Search:",
                "zeroRecords": "No matching records found",
                "paginate": {
                    "previous":"Prev",
                    "next": "Next",
                    "last": "Last",
                    "first": "First"
                }
            },

            "footerCallback": function ( row, data, start, end, display ) {
                var api = this.api(), data;
     
                // Remove the formatting to get integer data for summation
                var intVal = function ( i ) {
                    return typeof i === 'string' ?
                        i.replace(/[\$,]/g, '')*1 :
                        typeof i === 'number' ?
                            i : 0;
                };
     
                // Total over all pages
                total = api
                    .column( 3 )
                    .data()
                    .reduce( function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0 );
     
                // Total over this page
                pageTotal = api
                    .column( 3, { page: 'current'} )
                    .data()
                    .reduce( function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0 );
     
                // Update footer
                $( api.column( 3 ).footer() ).html(
                    '$'+pageTotal +' ( $'+ total +' total)'
                );
            },
            
            // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
            // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js). 
            // So when dropdowns used the scrollable div should be removed. 
            //"dom": "<'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",

            "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.
            
            "lengthMenu": [
                [6, 15, 20, -1],
                [6, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "pageLength": 6,
            "columnDefs": [{  // set default column settings
                'orderable': false,
                'targets': [0]
            }, {
                "searchable": false,
                "targets": [0]
            }],
            "order": [
                [1, "asc"]
            ] // set first column as a default sort by asc
        });

        var tableWrapper = jQuery('#sample_5_wrapper');

        table.find('.group-checkable').change(function () {
            var set = jQuery(this).attr("data-set");
            var checked = jQuery(this).is(":checked");
            jQuery(set).each(function () {
                if (checked) {
                    $(this).prop("checked", true);
                } else {
                    $(this).prop("checked", false);
                }
            });
        });
    }

    return {

        //main function to initiate the module
        init: function () {
            if (!jQuery().dataTable) {
                return;
            }

            initTable1();
            initTable1_2();

            initTable2();
            initTable3();
            initTable4();
            initTable5();
        }

    };

}();

if (App.isAngularJsApp() === false) { 
    jQuery(document).ready(function() {
        TableDatatablesManaged.init();
    });
}