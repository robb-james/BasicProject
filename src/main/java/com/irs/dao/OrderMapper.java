package com.irs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.irs.bean.Order;

public interface OrderMapper {
    //用户端删除订单
	int deleteByPrimaryKey(String oid);

	//添加订单
	int insert(Order record);

	//根据编号查询订单
	Order selectByPrimaryKey(String oid);
	//修改订单状态
	int updateByPrimaryKey(Order record);

	/**
	 * 根据商家id查询订单
	 * 
	 * @param startPos
	 * @param pageSize
	 * @param uid
	 * @return
	 */
	public List<Order> findByPage(
			@Param(value = "start") Integer start,
			@Param(value = "length") Integer length,
			@Param(value = "bean") Order bean);

	/**
	 * 根据商家id记录总数
	 */
	public int selectCount(@Param(value = "uid") Integer uid);


}