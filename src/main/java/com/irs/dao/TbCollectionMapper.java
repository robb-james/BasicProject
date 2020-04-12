package com.irs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.irs.bean.TbCollection;

/**
 * 用户收藏
 * @author robb
 *
 */
public interface TbCollectionMapper {
	@Select("select * from tb_collection where uid=#{uid}")
    List<TbCollection> list(@Param("uid")Integer uid );
	@Insert("insert into tb_collection(uid,pid,createtime)values(#{bean.uid},#{bean.pid},#{bean.createtime})")
	int insert(@Param("bean")TbCollection bean);
	@Delete("delete from tb_collection where id=#{id}")
	int delete(@Param("id") Integer id);
	
	
}
