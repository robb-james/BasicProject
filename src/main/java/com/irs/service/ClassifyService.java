package com.irs.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.irs.bean.Classify;

public interface ClassifyService {

	public List<Classify> findall(Integer start,Integer length);

	public int getcount();
	public int insert(Classify  bean);
	
	public int update( Classify  bean);
	public Classify getinfo(Integer cid);
	
	public List<Classify> getinfoBybid(Integer bid);
	
	
	
	
}
