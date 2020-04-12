package com.irs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.irs.bean.BigClass;

/**
 * 商品大类型
 * @author robb
 *
 */
public interface BigClassMapper {
	/**
	 * 获取所有的数据
	 * @param start
	 * @param length
	 * @return
	 */
	@Select("select * from sys_bigclass  order by bid desc limit #{start},#{length}")
	public List<BigClass> findall(@Param("start")Integer start,@Param("length")Integer length);
	/**
	 * 获取大分类数据个数
	 * @return
	 */
	@Select("select count(*) from sys_bigclass ")
	public int getcount();
	/**
	 * 添加数据
	 * @param bean
	 * @return
	 */
	@Insert("insert into sys_bigclass (bname)values(#{bean.bname})")
	public int insert(@Param("bean") BigClass  bean);
	/**
	 * 修改数据
	 * @param bean
	 * @return
	 */
	@Update("update sys_bigclass set bname=#{bean.bname} where bid=#{bean.bid}")
	public int update(@Param("bean") BigClass  bean);
	/**
	 * 根据编号获取数据
	 * @param bid
	 * @return
	 */
	@Select("select * from sys_bigclass where bid=#{bid}")
	public BigClass getinfo(@Param("bid") Integer bid);
	
	
}
