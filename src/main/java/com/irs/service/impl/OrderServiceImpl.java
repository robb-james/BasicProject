package com.irs.service.impl;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.irs.bean.Order;
import com.irs.dao.OrderMapper;
import com.irs.service.OrderService;
@Transactional
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderMapper orderMapper;
	@Override
	public int deleteByPrimaryKey(String oid) {
		// TODO Auto-generated method stub
		return orderMapper.deleteByPrimaryKey(oid);
	}
	@Override
	public int insert(Order record) {
		// TODO Auto-generated method stub
		return orderMapper.insert(record);
	}

	@Override
	public Order selectByPrimaryKey(String oid) {
		// TODO Auto-generated method stub
		return orderMapper.selectByPrimaryKey(oid);
	}

	@Override
	public int updateByPrimaryKey(Order record) {
		// TODO Auto-generated method stub
		return orderMapper.updateByPrimaryKey(record);
	}


	@Override
	public int selectCount(Integer uid) {
		// TODO Auto-generated method stub
		return orderMapper.selectCount(uid);
	}
	
	@Override
	public List<Order> findByPage(Integer start, Integer length, Order bean) {
		// TODO Auto-generated method stub
		return orderMapper.findByPage(start, length, bean);
	}

	

}
