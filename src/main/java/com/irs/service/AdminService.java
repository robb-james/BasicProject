package com.irs.service;


import java.io.Serializable;
import java.util.List;

import com.irs.bean.Menu;
import com.irs.bean.TbAdmin;
import com.irs.bean.TbMenus;
import com.irs.bean.TbRoles;
import com.irs.bean.TbUsers;
import com.irs.bean.UserOnlineBo;
import com.irs.bean.XtreeData;
import com.irs.util.ResultUtil;

public interface AdminService {
	//add 20190604
	//批量删除测试
	public TbAdmin test(Long uid);
	// 登陆
	public TbAdmin login(String username, String password);
	
	//获取所有角色
	public ResultUtil selRoles(Integer page,Integer limit);
	
	//获取所有角色
	public List<TbRoles> selRoles();
	
	//获取所有管理员
	public ResultUtil selAdmins(Integer page,Integer limit);
	
	//获取角色菜单
	public List<Menu> selMenus(TbUsers admin);
	
	//获取指定角色权限树
	public List<XtreeData> selXtreeData(TbAdmin admin);
	//获取指定角色权限树
	public List<XtreeData> selXtreeData1(TbAdmin admin);
	
	//更新角色信息
	public void updRole(TbRoles role,String m);
	
	//删除指定角色
	public void delRole(Long roleId);

	//批量删除指定角色
	public void delRoles(String rolesId);
	
	//根据角色名查询角色
	public TbRoles selRoleByRoleName(String roleName);

	//添加新角色
	public void insRole(TbRoles role, String m);

	//删除指定管理员
	public void delAdminById(Long id);

	//批量删除指定管理员
	public void delAdmins(String adminStr);

	//管理员用户名唯一性校验
	public TbAdmin selAdminByUserName(String username);

	//新增管理员
	public void insAdmin(TbAdmin admin);

	//根据id得到管理员
	public TbUsers selAdminById(Long id);
	
	//test
	public TbAdmin selectAdminById(Long id);

	//根据email得到管理员
	public TbAdmin selAdminByEmail(String eMail,String username);

	//更新管理员信息
	public void updAdmin(TbAdmin admin);
	public  TbAdmin getinfo(String username,String password);
	

	public void updAdmin1(TbAdmin admin);

	public List<TbMenus> selMenusByParentId();

	public TbMenus selMenuById(Long menuId);

	public void insMenu(TbMenus menus);

	public void updMenu(TbMenus menus);

	public TbMenus selMenuByTitle(String title);

	public TbMenus selMenusById(Long menuId);

	public void delMenuById(Long menuId);

	public List<TbMenus> selMenusById1(Long menuId);

	public void updMenuSortingById(TbMenus menus);

	public List<TbMenus> checkTitleSameLevel(TbMenus menus);
	/**
	 * 获取在线用户列表
	 * @return
	 */
	public ResultUtil OnlineUsers();
	/*
	 * 强制踢出用户
	 */
	public void kickout(Serializable sessionId);
	
	
}
