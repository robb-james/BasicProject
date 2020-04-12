package com.irs.service;

import java.util.List;

import com.irs.bean.Product;

/**
 * 商品接口 业务实现接口
 * 
 * @author robb
 *
 */
public interface ProductService {
	/**
	 * 获取所有的商品信息
	 * 
	 * @param bean
	 * @param start
	 * @param length
	 * @return
	 */
	public List<Product> list(Product bean, Integer start, Integer length);

	public Product getinfo(Integer pid);
	public int insert(Product bean);

	public int update(Product bean);

	public int getcount(Product bean);

	public int delete(Integer pid);

}
