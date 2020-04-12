package com.irs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.irs.bean.Classify;
import com.irs.dao.ClassifyMapper;
import com.irs.service.ClassifyService;
@Service
public class ClassIfyServiceImpl implements ClassifyService{

	@Autowired
	private ClassifyMapper mapper;
	@Override
	public List<Classify> findall(Integer start, Integer length) {
		// TODO Auto-generated method stub
		return mapper.findall(start, length);
	}

	@Override
	public int getcount() {
		// TODO Auto-generated method stub
		return mapper.getcount();
	}

	@Override
	public int insert(Classify bean) {
		// TODO Auto-generated method stub
		return mapper.insert(bean);
	}

	@Override
	public int update(Classify bean) {
		// TODO Auto-generated method stub
		return mapper.update(bean);
	}

	@Override
	public Classify getinfo(Integer cid) {
		// TODO Auto-generated method stub
		return mapper.getinfo(cid);
	}

	@Override
	public List<Classify> getinfoBybid(Integer bid) {
		// TODO Auto-generated method stub
		return mapper.getinfoBybid(bid);
	}

}
