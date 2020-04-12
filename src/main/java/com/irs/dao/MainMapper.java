package com.irs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.irs.bean.TbUsers;


public interface MainMapper {
	@Select("select * from tb_users where to_days(createtime) = to_days(now());")
	List<TbUsers> selUsersToday();
	
	@Select("SELECT * FROM tb_users WHERE TO_DAYS( NOW( ) ) - TO_DAYS( createtime)= 1  ")
	List<TbUsers> selUsersYesterday();
	
	@Select("SELECT * FROM  tb_users WHERE YEARWEEK(date_format(createtime,'%Y-%m-%d')) = YEARWEEK(now());")
	List<TbUsers> selUsersYearWeek();
	
	@Select("SELECT * FROM tb_users WHERE DATE_FORMAT( createtime, '%Y%m' ) = DATE_FORMAT( CURDATE( ) , '%Y%m' )")
	List<TbUsers> selUsersMonth();
}
