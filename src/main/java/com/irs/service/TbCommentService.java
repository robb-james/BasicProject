package com.irs.service;

import java.util.List;

import com.irs.bean.TbComment;
import com.irs.util.ResultUtil;

public interface TbCommentService{
	 
	/**
	 * 获取所有的信息
	 * @param page
	 * @param size
	 * @return
	 */
    List<TbComment> getlist(Integer page,Integer size);
    
    ResultUtil list(Integer page,Integer size);
/**
 * 添加信息
 * @param record
 * @return
 */
    int insert(TbComment record);
/**
 * 根据编号获取信息
 * @param lid
 * @return
 */
    TbComment selectByPrimaryKey(Integer lid);
/**
 * 修改信息
 * @param record
 * @return
 */
    int update(TbComment record);
	
	
}
