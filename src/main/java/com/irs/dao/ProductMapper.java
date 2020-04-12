package com.irs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.irs.bean.Product;
/**
 * 商品接口类
 * @author robb
 *
 */
public interface ProductMapper{

	/**
	 * 获取所有的商品信息
	 * @param bean
	 * @param start
	 * @param length
	 * @return
	 */
	public List<Product> list(@Param("bean") Product bean,@Param("start") Integer start, @Param("length") Integer length);
	
	public int insert(@Param("bean")Product bean);
	public int update(@Param("bean")Product bean);
	public Product getinfo(@Param("pid")Integer pid);
	public int getcount(@Param("bean")Product bean);
    @Delete("delete from tb_product where pid=#{pid}")
	public int delete(@Param("pid")Integer pid);

}
