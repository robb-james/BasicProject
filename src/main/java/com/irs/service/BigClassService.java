package com.irs.service;

import java.util.List;
import com.irs.bean.BigClass;

public interface BigClassService {
	public List<BigClass> findall(Integer start,Integer length);
	public int getcount();
	public int insert( BigClass  bean);
	public int update( BigClass  bean);
	public BigClass getinfo(Integer bid);
	
	
}
