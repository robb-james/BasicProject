package com.irs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.irs.bean.Slide;
import com.irs.dao.SlideMapper;
import com.irs.service.SlideService;

@Service
public class SlideServiceImpl implements SlideService{

	@Autowired
	private SlideMapper mapper;
	
	
	@Override
	public List<Slide> list() {
		// TODO Auto-generated method stub
		return mapper.list();
	}

	@Override
	public int delete(Integer hid) {
		// TODO Auto-generated method stub
		return mapper.delete(hid);
	}

	@Override
	public int insert(Slide bean) {
		// TODO Auto-generated method stub
		return mapper.insert(bean);
	}

	@Override
	public int update(Slide bean) {
		// TODO Auto-generated method stub
		return mapper.update(bean);
	}

	@Override
	public Slide getinfo(Integer hid) {
		// TODO Auto-generated method stub
		return mapper.getinfo(hid);
	}

}
