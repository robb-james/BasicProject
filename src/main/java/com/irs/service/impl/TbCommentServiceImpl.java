package com.irs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.irs.bean.TbComment;
import com.irs.dao.CommentMapper;
import com.irs.service.TbCommentService;
import com.irs.util.ResultUtil;

@Service
public class TbCommentServiceImpl implements TbCommentService{

	@Autowired
	private CommentMapper tbdao;

	@Override
	public List<TbComment> getlist(Integer page, Integer size) {
		// TODO Auto-generated method stub
		return tbdao.getlist(page, size);
	}

	@Override
	public ResultUtil list(Integer page, Integer limit) {
		PageHelper.startPage(page, limit);
		
		List<TbComment> list=tbdao.getlist(page, limit);
		PageInfo<TbComment> pageinfo=new PageInfo<TbComment>(list);
		ResultUtil resultUtil = new ResultUtil();
		resultUtil.setCode(0);
		resultUtil.setCount(pageinfo.getTotal());
		resultUtil.setData(pageinfo.getList());
		return resultUtil;
	}

	@Override
	public int insert(TbComment record) {
		// TODO Auto-generated method stub
		return tbdao.insert(record);
	}

	@Override
	public TbComment selectByPrimaryKey(Integer lid) {
		// TODO Auto-generated method stub
		return tbdao.selectByPrimaryKey(lid);
	}

	@Override
	public int update(TbComment record) {
		// TODO Auto-generated method stub
		return tbdao.update(record);
	}
	


	
	

}
