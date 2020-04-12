package com.irs.controller.base;

import static org.springframework.util.Assert.isTrue;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.irs.bean.TbUsers;
import com.irs.util.PageProperties;
import com.irs.util.ResultModel;



public abstract class BaseController {

	protected Logger logger = LoggerFactory.getLogger(getClass());

	protected ResultModel success() {
		return success("操作成功");
	}
	protected ResultModel success(int code,String msg) {
		return ResultModel.success(code,msg);
	}
	protected ResultModel success(Object data) {
		return ResultModel.success(data);
	}
	
	protected ResultModel success(List<?> data,long recordsTotal,long recordsFiltered) {
		return ResultModel.success(data,recordsTotal,recordsFiltered);
	}
	
	protected ResultModel error(int code, String msg) {
		return ResultModel.error(code, msg);
	}

	/**
	 * 
	 * @desc 构建分页参数
	 * @author robb
	 * @params @param req
	 * @params @return
	 * @return PageProperties
	 */
	protected PageProperties buildPage(HttpServletRequest req) {
		String start = req.getParameter("start");
		String length = req.getParameter("length");
		String pages = req.getParameter("page");
		String sizes = req.getParameter("size");
		String sortStr = req.getParameter("sort");
		String sortFiled = req.getParameter("sortFiled");
		Integer page = 0;
		if(pages == null || "".equals(pages)) {
			page = Integer.parseInt(start);
		}
		Integer size = 1;
		if(sizes == null || "".equals(sizes)) {
			size = Integer.parseInt(length);
			page = page/size + 1;
			pages = page + ""; 
			sizes = size+"";
		}
		isTrue(NumberUtils.isNumber(pages), "当前页码不合法");
		isTrue(NumberUtils.isNumber(sizes), "每页条数不合法");
		PageProperties props = new PageProperties();
		if (StringUtils.isNotBlank(sortStr) && StringUtils.isNotBlank(sortFiled)) {
			isTrue(NumberUtils.isNumber(sortStr), "排序类型不合法");
			props.setSort(Integer.parseInt(sortStr));
			props.setSortFiled(sortFiled);
		}
		props.setPage(Integer.parseInt(pages));
		props.setPageSize(Integer.parseInt(sizes));
		return props;
	}

	/*
	 * 验证用户是否登录
	 */
	public ResultModel validUser() {
		Subject subject = SecurityUtils.getSubject();
		// 判断当前的subject是否登录
		if (subject.isAuthenticated() == false) {
			return error(400, "用户未登录");
		}
		return success();
	}

	protected Subject getSubject() {
		return SecurityUtils.getSubject();
	}
	
	/**
	 * 获取当前登录用户
	 * @return
	 */
	public TbUsers getUser() {
		TbUsers user = (TbUsers) SecurityUtils.getSubject().getPrincipal();
		if (null == user) {
			return null;
		}
		return user;
	}
}
