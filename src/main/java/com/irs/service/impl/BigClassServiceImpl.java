package com.irs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.irs.annotation.AuthToken;
import com.irs.bean.BigClass;
import com.irs.dao.BigClassMapper;
import com.irs.service.BigClassService;
@Service
public class BigClassServiceImpl implements BigClassService{

	@Autowired
	private BigClassMapper mapper;
	
	@Override
	public List<BigClass> findall(Integer start, Integer length) {
		// TODO Auto-generated method stub
		return mapper.findall(start, length);
	}

	@Override
	public int getcount() {
		// TODO Auto-generated method stub
		return mapper.getcount();
	}

	@Override
	public int insert(BigClass bean) {
		// TODO Auto-generated method stub
		return mapper.insert(bean);
	}

	@Override
	public int update(BigClass bean) {
		// TODO Auto-generated method stub
		return mapper.update(bean);
	}

	@Override
	public BigClass getinfo(Integer bid) {
		// TODO Auto-generated method stub
		return mapper.getinfo(bid);
	}

}
