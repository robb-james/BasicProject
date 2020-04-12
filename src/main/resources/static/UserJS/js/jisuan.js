//全选的实现
$(".check-all").click(function() {
	$(".ids").prop("checked", this.checked);
});
$(".ids").click(function() {
	var option = $(".ids");
	option.each(function(i) {
		if (!this.checked) {
			$(".check-all").prop("checked", false);
			return false;
		} else {
			$(".check-all").prop("checked", true);
		}
	});
});

function trySubmit() {
	if (this.submitFlag == 1) {
		alert('数据已经提交，请勿再次提交。');
		return false;
	} else {
		this.submitFlag = 1;
		return true;
	}
}

// 计算金额
$(function() {
	var to = 0;
	var dj = $("#resetprice").text();//商品单价
	var num = $("#quantity").val();//数量数量
	var yf = $("#yunfei").text();//运费
	to += dj * num + parseInt(yf);
	$("#total").text(to);
});

function sss() {
	var to = 0;
	var text = $("#resetprice").text();
	var num = $("#quantity").val();
	var yf = $("#yunfei").text();

	// alert("单价："+text + "数量："+ num+"运费："+yf);

	to += text * num + parseInt(yf);
	$("#total").text(to);
}

// 收藏


// 加入购物车
function buy() {
	var spid = $('#pid').val();
	var shuliang = $('#quantity').val();
	$.ajax({
		type : 'post', // 传送的方式,get/post
		url : 'cart/add.html', // 发送数据的地址
		data : {
			pid : spid,
			num : shuliang
		},
		dataType : "json",
		success : function(data) {
			if (data.msg == "ok") {
				if (confirm('加入购物车成功！是否查看购物车？')) {
					window.location.href = "cart/select.html";
					return true;
				} else {
					return false;
				}
			} else if (data.msg == "no") {
				alert("对不起！亲，请您先登录！");
				window.location.href = "user/jumplogin.html";
			} else {
				alert("加入购物车失败");
			}
			;
		},
		error : function(XMLHttpRequest, ajaxOptions, thrownError) {
			alert("操作异常！");
		}
	});
}

