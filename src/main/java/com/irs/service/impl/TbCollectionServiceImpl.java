package com.irs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.irs.bean.TbCollection;
import com.irs.dao.TbCollectionMapper;
import com.irs.service.TbCollectionService;

@Service
public class TbCollectionServiceImpl implements TbCollectionService {

	@Autowired
	private TbCollectionMapper  mapper;
	
	@Override
	public List<TbCollection> list(Integer uid) {
		// TODO Auto-generated method stub
		return mapper.list(uid);
	}

	@Override
	public int insert(TbCollection bean) {
		// TODO Auto-generated method stub
		return mapper.insert(bean);
	}

	@Override
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return mapper.delete(id);
	}

}
