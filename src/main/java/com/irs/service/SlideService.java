package com.irs.service;

import java.util.List;
import com.irs.bean.Slide;

public interface SlideService {

	public List<Slide> list();

	public int delete(Integer hid);

	public int insert(Slide bean);

	public int update(Slide bean);

	public Slide getinfo(Integer hid);

}
