package com.irs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.irs.bean.BigClass;
import com.irs.bean.Classify;

public interface ClassifyMapper {

	/**
	 * 获取所有的数据
	 * @param start
	 * @param length
	 * @return
	 */
	@Select("select a.*,b.bname as bname from sys_classify a join sys_bigclass b on a.bid=b.bid order by a.cid desc LIMIT #{start},#{length}")
	public List<Classify> findall(@Param("start")Integer start,@Param("length")Integer length);
	/**
	 * 获取大分类数据个数
	 * @return
	 */
	@Select("select count(*) from sys_classify ")
	public int getcount();
	/**
	 * 添加数据
	 * @param bean
	 * @return
	 */
	@Insert("insert into sys_classify (bid,cname,cremark)values(#{bean.bid},#{bean.cname},#{bean.cremark})")
	public int insert(@Param("bean") Classify  bean);
	/**
	 * 修改数据
	 * @param bean
	 * @return
	 */
	@Update("update sys_classify set bid=#{bean.bid},cname=#{bean.cname},cremark=#{bean.cremark}  where cid=#{bean.cid}")
	public int update(@Param("bean") Classify  bean);
	/**
	 * 根据编号获取数据
	 * @param bid
	 * @return
	 */
	@Select("select * from sys_classify where cid=#{cid}")
	public Classify getinfo(@Param("cid") Integer cid);
	@Select("select * from sys_classify where bid=#{bid}")
	public List<Classify> getinfoBybid(@Param("bid")Integer bid);
	
}
