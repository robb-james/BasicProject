var Public = Public || {};
Public.isIE6 = !window.XMLHttpRequest; // ie6
/*
 * 通用post请求，返回json url:请求地址， params：传递的参数{...}， callback：请求成功回调
 */
Public.ajaxPost = function(url, params, callback, error) {
	$.ajax({
		type : "POST",
		url : url,
		contentType : 'application/json',
		data : params,
		dataType : "json",
		success : function(data, status) {
			callback(data);
		},
		error : function(err) {
			error(err);
		}
	});
};
Public.ajaxGet = function(url, params, callback, error) {
	$.ajax({
		type : "GET",
		url : url,
		data : params,
		dataType : "json",
		success : function(data, status) {
			callback(data);
		},
		error : function(err) {
			error(err);
		}
	});
};
Public.open = function(url, cb) {
	var width = '750px',
		height = '550px';
	layer.open({
		type : 2,
		skin : 'layui-layer-rim', //加上边框
		area : [ width, height ], //宽高
		content : url,
		end : function(layero, index) {
			console.log(layer.callback);
			cb(layer.callback);
		},
		cancel : function(index, layero) {
			layer.callback = {};
		},
		callback : {},
	});
};



/**
 * 打开修改/编辑页
 **/
Public.edit = function(tar, url, rowId) {
	var width = '800px',
		height = '600px';
	layer.open({
		type : 2,
		skin : 'layui-layer-rim', //加上边框
		area : [ width, height ], //宽高
		content : url,
		end : function(layero, index) {
			console.log(layer.callback);
			if (layer.callback) {
				var callback = layer.callback;
				if (callback.status == 200) {
					if (rowId >= 0) {
						Public.updateRow(tar, rowId, callback.data);
					} else {
						Public.insertRow(tar, callback.data);
					}
				}
			}
		},
		cancel : function(index, layero) {
			layer.callback = {};
			layer.callback.status = 0;
		//return false;
		},
		callback : {},
	});
};

/**
 * 打开修改/编辑页 无刷新
 **/
Public.edit = function(tar, url) {
	var width = '800px',
		height = '600px';
	layer.open({
		type : 2,
		skin : 'layui-layer-rim', //加上边框
		area : [ width, height ], //宽高
		content : url,
		end : function(layero, index) {
			console.log(layer.callback);
			if (layer.callback) {
				var callback = layer.callback;
				if (callback.status == 200) {
					Public.refresh(tar,{});
				}
			}
		},
		cancel : function(index, layero) {
			layer.callback = {};
			layer.callback.status = 0;
		},
		callback : {},
	});
};


/**
 * 更新行
 **/
Public.updateRow = function(tar, rowId, data) {
	$(tar).bootstrapTable('updateRow', {
		index : rowId,
		row : data
	});
};
/**
 * 插入行 
 **/
Public.insertRow = function(tar, data) {
	$(tar).bootstrapTable('append', data);
};
/**
 * 删除行 
 **/
Public.deleteRow = function(tar, uid) {
	$(tar).bootstrapTable('removeByUniqueId', uid);
};
/**
 * 批量删除行 
 **/
Public.deleteRows = function(tar, uids) {
	$.each(uids, function() {
		$(tar).bootstrapTable('removeByUniqueId', this);
	});
};
/**
 * 刷新bootStrap 
 **/
Public.refresh = function(tar,param) {
	$(tar).bootstrapTable('refresh', param);
};
/**
 * 选中行数据 
 **/
Public.getSelectRowData = function(tar, uid) {
	return $(tar).bootstrapTable('getRowByUniqueId', uid);
};
/**
 * 所有选中行数据（过滤后） 
 **/
Public.getSelections = function(tar) {
	return $(tar).bootstrapTable('getSelections');
};
/**
 * 所有选中行数据（过滤前） 
 **/
Public.getAllSelections = function(tar) {
	return $(tar).bootstrapTable('getAllSelections');
};

Public.fitCarousel = function($tar) {
	var $v = $tar;
	var $p = $v.parent();
	var _vh = $v.height();
	var _vw = $v.width();
	var _ph = $p.height();
	var _pw = $p.width();
	$v.css("height",_vw+"px");
};
