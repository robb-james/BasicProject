package com.irs.util;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@Data
public class ResultModel {
	private Object detail;
	private int code;
	private String msg;
	private List<?> data;
	private long recordsTotal;
	private long recordsFiltered;
	
	public static ResultModel success(Object data) {
		return new ResultModel(data);
	}
	public static ResultModel success(int code,String msg) {
		return new ResultModel(code,msg);
	}
	public static ResultModel success(List<?> data,long recordsTotal,long recordsFiltered) {
		return new ResultModel(data,recordsTotal,recordsFiltered);
	}
	
	public static ResultModel error(int code, String msg) {
		return new ResultModel(code, msg);
	}

	private ResultModel(Object data) {
		this.code = 200;
		this.msg = "success";
		if (null == data) {
			this.detail = "";
		} else {
			this.detail = data;
		}
	}

	private ResultModel(int code, String msg) {
		this.code = code;
		this.msg = msg;
	}
	
	@SuppressWarnings("rawtypes")
	private ResultModel(List<?> data,long recordsTotal,long recordsFiltered) {
		this.code = 200;
		this.msg = "success";
		this.recordsTotal = recordsTotal;
		this.recordsFiltered = recordsFiltered;
		if(data == null) {
			this.data = new ArrayList();
		}else {
			this.data = data;
		}
	}
	
	public boolean isSuccess() {
		return 200 == code;
	}

}
