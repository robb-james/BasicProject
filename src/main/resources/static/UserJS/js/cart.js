//登录后刷新页面，载入数据
$("#login_btn").click(function() {
	var yourname = $('#inputusername').val();
	var yourword = $('#inputpassword').val();
	var youryzm = $('#yanzheng').val();

	$.ajax({
		type : 'post', // 传送的方式,get/post
		url : 'user/login.html', // 发送数据的地址
		data : {
			phone : yourname,
			password : yourword,
			yanzheng : youryzm
		},
		dataType : "json",
		success : function(data) {
			if (data.msg == "ok") {
				$(".tips").html(data.info);
				window.location.reload();
				$("#uid").val(data.uid);
			} else if (data.msg == "cuo") {
				alert("验证码错误！");
				changeImage();// 验证码输入错误刷新图片
				$('#yanzheng').val("");
			} else if (data.msg == "no") {
				alert("用户名或密码错误！");
			} else {
				$(".tips").html(data.info);
			}
		},
		error : function(event, XMLHttpRequest, ajaxOptions, thrownError) {
			alert(XMLHttpRequest + thrownError);
		}
	});
});

$(function() {
	$("#jiesuan").click(checklogin); // 添加点击事件
	showTotal();// 计算总计
	/*
	 * 给全选添加click事件
	 */
	$("#selectAll").click(function() {
		/*
		 * 1. 获取全选的状态
		 */
		var bool = $("#selectAll").attr("checked");
		/*
		 * 2. 让所有条目的复选框与全选的状态同步
		 */
		setItemCheckBox(bool);
		/*
		 * 3. 让结算按钮与全选同步
		 */
		setJieSuan(bool);
		/*
		 * 4. 重新计算总计
		 */
		showTotal();
	});
	/*
	 * 给所有条目的复选框添加click事件
	 */
	$(":checkbox[name=checkboxBtn]").click(function() {
		var all = $(":checkbox[name=checkboxBtn]").length;// 所有条目的个数
		var select = $(":checkbox[name=checkboxBtn][checked=true]").length;// 获取所有被选择条目的个数

		if (all == select) {// 全都选中了
			$("#selectAll").attr("checked", true);// 勾选全选复选框
			setJieSuan(true);// 让结算按钮有效
		} else if (select == 0) {// 谁都没有选中
			$("#selectAll").attr("checked", false);// 取消全选
			setJieSuan(false);// 让结算失效
		} else {
			$("#selectAll").attr("checked", false);// 取消全选
			setJieSuan(true);// 让结算有效
		}
		showTotal();// 重新计算总计
	});

	// 给加号添加click事件
	$(".jia").click(
	function() {
		// 获取cartItemId
		var id = $(this).attr("gid");
		// 获取输入框中的数量
		var num = $("#" + id + "num").val();
		// 获取库存数量
		var kc = $("#kucun").val();
		// 判断当前数量是否等于库存数量
		if (num == kc) {
			alert("抱歉！商品没货啦！");
		} else {
			if (num == 10) {
				// 最低为1
				alert("每个用户最多只能限购10件！");
			} else {
				// 加一个数量
				$.ajax({
					type : 'post', // 传送的方式,get/post
					url : 'cart/addnum.html', // 发送数据的地址
					data : {
						gid : id,
						num : num
					},
					dataType : "json",
					success : function(data) {
						if (data.msg == "ok") {
							$("#" + id + "num").val(Number(num) + 1);
							showTotal();
						} else if (data.msg == "no") {
							alert("添加失败！");
						}
					},
					error : function(event, XMLHttpRequest,
							ajaxOptions, thrownError) {
						alert(XMLHttpRequest + thrownError);
					}
				});
			}
		}
	});

	/*
	 * 给减号添加click事件
	 */
	$(".jian").click(
	function() {
		// 获取cartItemId
		var id = $(this).attr("gid");
		// 获取输入框中的数量
		var num = $("#" + id + "num").val();
		// 判断当前数量是否为1，如果为1,那就不是修改数量了，而是要删除了。
		if (num == 1) {
			// 最低为1
			alert("商品数量不能小于“1”");
		} else {
			// 减一个数量
			$.ajax({
				type : 'post', // 传送的方式,get/post
				url : 'cart/jiannum.html', // 发送数据的地址
				data : {
					gid : id,
					num : num
				},
				dataType : "json",
				success : function(data) {
					if (data.msg == "ok") {
						$("#" + id + "num").val(Number(num) - 1);
						showTotal();
					} else if (data.msg == "no") {
						alert("商品数量减少失败！");
					}
				},
				error : function(event, XMLHttpRequest, ajaxOptions,
						thrownError) {
					alert(XMLHttpRequest + thrownError);
				}
			});
		}
	});
});

function round(num, dec) {
	var strNum = num + '';/* 把要转换的小数转换成字符串 */
	var index = strNum.indexOf("."); /* 获取小数点的位置 */
	if (index < 0) {
		return num;/* 如果没有小数点，那么无需四舍五入，返回这个整数 */
	}
	var n = strNum.length - index - 1;/* 获取当前浮点数，小数点后的位数 */
	if (dec < n) {
		/* 把小数点向后移动要保留的位数，把需要保留的小数部分变成整数部分，只留下不需要保留的部分为小数 */
		var e = Math.pow(10, dec);
		num = num * e;
		/* 进行四舍五入，只保留整数部分 */
		num = Math.round(num);
		/* 再把原来小数部分还原为小数 */
		return num / e;
	} else {
		return num;/* 如果当前小数点后的位数等于或小于要保留的位数，那么无需处理，直接返回 */
	}
}
/*
 * 统一设置所有条目的复选按钮
 */
function setItemCheckBox(bool) {
	$(":checkbox[name=checkboxBtn]").attr("checked", bool);
}
/*
 * 计算总计
 */
function showTotal() {
	var total = 0;
	/*
	 * 1. 获取所有的被勾选的条目复选框！循环遍历之
	 */
	$(":checkbox[name=checkboxBtn][checked=true]").each(function() {
		// 2. 获取复选框的值，即其他元素的前缀
		var id = $(this).val();
		// 3. 再通过前缀找到小计元素，获取其文本
		var text = $("#" + id + "Subtotal").text();
		// 找到数量
		var num = $("#" + id + "num").val();
		// 4.获取运费
		var yf= $("#" + id + "yunfei").text();
		// 5. 累加计算
		total += text * num + parseInt(yf);
	});
	// 5. 把总计显示在总计元素上
	$("#total").text(round(total, 2));// round()函数的作用是把total保留2位
}

/*
 * 设置结算按钮样式
 */
function setJieSuan(bool) {
	if (bool) {
		$("#jiesuan").removeClass("btn_submit_pay_kill").addClass(
				"btn_submit_pay");
		$("#jiesuan").click(checklogin);
	} else {
		$("#jiesuan").removeClass("btn_submit_pay").addClass(
				"btn_submit_pay_kill");
		$("#jiesuan").unbind("click");// 撤消当前元素止所有click事件
	}
}

/*
 * 结算
 */
function checklogin() {
	var uexist = "${user_session.uname}";
	if (uexist) {
		// 1. 获取所有被选择的条目的id，放到数组中
		var cartItemIdArray = new Array();
		$(":checkbox[name=checkboxBtn][checked=true]").each(function() {
			cartItemIdArray.push($(this).val());// 把复选框的值添加到数组中
		});
		// 2. 把数组的值toString()，然后赋给表单的cartItemIds这个hidden
		$("#cartItemIds").val(cartItemIdArray.toString());
		// 把总计的值，也保存到表单中
		$("#hiddenTotal").val($("#total").text());
		// 3. 提交这个表单
		$("#jieSuanForm").submit();
	} else {
		showBg();
	}
}

// 显示灰色 jQuery 遮罩层
function showBg() {
	var bh = $("body").height();
	var bw = $("body").width();
	$("#fullbg").css({
		height : bh,
		width : bw,
		display : "block"
	});
	$("#dialog").show();
}

// 关闭灰色 jQuery 遮罩
function closeBg() {
	$("#fullbg,#dialog").hide();
}

function delgwc(gid) {
	$.ajax({
		type : 'post',
		url : 'cart/delete.html', // 发送数据的地址
		data : {
			gid : gid
		},
		dataType : "json",
		success : function(data) {
			if (data.msg == "ok") {
				alert("删除成功！");
				window.location.href = "cart/select.html";
			} else if (data.msg == "no") {
				alert("删除失败！");
				window.location.href = "cart/select.html";
			}
		}
	});
}