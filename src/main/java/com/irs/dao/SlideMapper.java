package com.irs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.irs.bean.Slide;

public interface SlideMapper {
	/**
	 * 获取所有的轮播图
	 * @return
	 */
	@Select("select * from sys_slide")
    public List<Slide> list();
	/**
	 * 删除数据
	 * @param hid
	 * @return
	 */
	@Delete("delete from sys_slide where hid=#{hid}")
	public int delete(@Param("hid")Integer hid);
	/**
	 * 添加数据
	 * @param bean
	 * @return
	 */
	@Insert("insert into sys_slide(hname,hurl)values(#{bean.hname},#{bean.hurl})")
	public int insert(@Param("bean")Slide bean);
	/**
	 * 修改数据
	 * @param bean
	 * @return
	 */
	@Update("update sys_slide set hname=#{bean.hname},hurl=#{bean.hurl}  where  hid=#{bean.hid}")
	public int update(@Param("bean")Slide bean);
	/**
	 * 根据编号获取一条数据
	 * @param hid
	 * @return
	 */
	@Select("select * from sys_slide where hid=#{hid}")
	public Slide getinfo(@Param("hid")Integer hid);
	
}
