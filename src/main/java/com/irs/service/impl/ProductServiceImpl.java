package com.irs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.irs.bean.Product;
import com.irs.dao.ProductMapper;
import com.irs.service.ProductService;


/**
 * 商品业务实现类
 * @author robb
 *
 */
@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper goods;
	/**
	 * 获取所有的商品信息
	 */
	@Override
	public List<Product> list(Product bean, Integer start, Integer length) {
		// TODO Auto-generated method stub
		return goods.list(bean, start, length);
	}
	@Override
	public int insert(Product bean) {
		// TODO Auto-generated method stub
		return goods.insert(bean);
	}
	@Override
	public int update(Product bean) {
		// TODO Auto-generated method stub
		return goods.update(bean);
	}
	@Override
	public int getcount(Product bean) {
		// TODO Auto-generated method stub
		return goods.getcount(bean);
	}
	@Override
	public int delete(Integer pid) {
		// TODO Auto-generated method stub
		return goods.delete(pid);
	}
	@Override
	public Product getinfo(Integer pid) {
		// TODO Auto-generated method stub
		return goods.getinfo(pid);
	}
	

}
