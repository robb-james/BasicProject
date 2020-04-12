package com.irs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.irs.bean.TbComment;
/**
 * 评论管理接口类
 * @author robb
 *
 */
public interface CommentMapper {

	/**
	 * 获取所有的信息
	 * @param page
	 * @param size
	 * @return
	 */
    List<TbComment> getlist(@Param("page")Integer page,@Param("size")Integer size);
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
    TbComment selectByPrimaryKey(@Param("uid") Integer uid);
/**
 * 修改信息
 * @param record
 * @return
 */
    int update(TbComment record);
}