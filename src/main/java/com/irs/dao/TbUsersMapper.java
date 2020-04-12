package com.irs.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.irs.bean.TbAdmin;
import com.irs.bean.TbUsers;
import com.irs.bean.TbUsersExample;

public interface TbUsersMapper {
    int countByExample(TbUsersExample example);

    int deleteByExample(TbUsersExample example);

    int deleteByPrimaryKey(Long uid);

    int insert(TbUsers record);

    int insertSelective(TbUsers record);

    List<TbUsers> selectByExample(TbUsersExample example);

    TbUsers selectByPrimaryKey(Long uid);
    int updateByExampleSelective(@Param("record") TbUsers record, @Param("example") TbUsersExample example);
    int updateByExample(@Param("record") TbUsers record, @Param("example") TbUsersExample example);
    int updateByPrimaryKeySelective(TbUsers record);

    int updateByPrimaryKey(TbUsers record);
    @Select("select * from tb_users where phone=#{username} and password=#{password}")
    TbUsers getinfo(@Param("username") String phone,@Param("password") String password);
    @Select("select * from tb_users where phone=#{phone}")
    TbUsers getphone(@Param("phone") String phone);
    @Select("select * from tb_users where nickname=#{nickname}")
    TbUsers getnickname(@Param("nickname") String nickname);
@Update("update tb_users set password=#{password} where uid=#{uid}")
    public int updatepassword(@Param("password")String password,@Param("uid")Long uid);
   
@Select("select * from tb_admin where id=#{id}")
   TbAdmin selectAdminById(Long id);
    
    
    
}