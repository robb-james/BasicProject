package com.irs.util;

import java.text.SimpleDateFormat;
import java.util.Date;

//公共常量类
public class Constants {
	public static final String ADMIN_SESSION = "admin_session";// 管理员登录信息
	public static final String USER_SESSION = "user_session";// 用户登录信息
	public static final String COLUMN_SESSION = "column_session";// 全部栏目信息
	public static final String ALL_USER = "all_user";// 全部用户信息

	/**
	 * 生成订单号 当前时间加上两位随机数
	 * 
	 * @return
	 */
	public static String OrderNumber() {
		String OrderNumber = "";
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		int x = (int) (Math.random() * 100);
		if (x < 10) {
			x = x + 9;
		} else if (x == 100) {
			x--;
		}
		OrderNumber = sdf.format(d) + x;
		return OrderNumber;
	}
	
	
}
