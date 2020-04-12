package com.irs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.irs.bean.Order;



public interface OrderService {

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
			Integer start,
			 Integer length,
				Order bean);

		/**
		 * 根据商家id记录总数
		 */
		public int selectCount(@Param(value = "uid") Integer uid);

	
}
