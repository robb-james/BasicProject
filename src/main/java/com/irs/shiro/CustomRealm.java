package com.irs.shiro;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.irs.bean.TbMenus;
import com.irs.bean.TbUsers;
import com.irs.dao.AdminMenusMapper;
import com.irs.dao.TbAdminMapper;
import com.irs.dao.TbUsersMapper;

/**
 * 
 * @Desc: 自定义Realm
 * @author robb
 * @version: v1.0
 */
public class CustomRealm extends AuthorizingRealm {
	@Autowired
	private TbAdminMapper tbAdminMapper;
	@Autowired
	private AdminMenusMapper adminMenusMapper;
	@Autowired
	private TbUsersMapper mapper;
	
	private static Logger logger=LoggerFactory.getLogger(CustomRealm.class);

	public CustomRealm() {
		logger.info("CustomRealm====================");
	}

	@Override
	public String getName() {
		return "CustomRealm";
	}

	/**
	 * realm授权方法 从输入参数principalCollection得到身份信息 根据身份信息到数据库查找权限信息 将权限信息添加给授权信息对象
	 * 返回 授权信息对象(判断用户访问url是否在权限信息中没有体现)
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		TbUsers admin = (TbUsers) principalCollection.getPrimaryPrincipal();
		Long roleId = admin.getRoleid().longValue();

		List<String> permsList = null;

		// 系统管理员，拥有最高权限
		List<TbMenus> menuList = adminMenusMapper.getMenus(roleId);
		permsList = new ArrayList<>(menuList.size());
		for (TbMenus menu : menuList) {
			if (menu.getPerms() != null && !"".equals(menu.getPerms())) {
				permsList.add(menu.getPerms());
			}
		}

		// 用户权限列表
		Set<String> permsSet = new HashSet<String>();
		for (String perms : permsList) {
			if (StringUtils.isBlank(perms)) {
				continue;
			}
			permsSet.addAll(Arrays.asList(perms.trim().split(",")));
		}
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		info.setStringPermissions(permsSet);
		return info;
	}

	/**
	 * 表单认证过滤器认证时会调用自定义Realm的认证方法进行认证，成功回到index.do，再跳转到index.jsp页面
	 *
	 * 前提：表单认证过滤器收集和组织用户名和密码信息封装为token对象传递给此方法
	 *
	 * token:封装了身份信息和凭证信息 2步骤：比对身份 信息；比对凭证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String username = String.valueOf(token.getPrincipal()).trim();
		System.out.println("username:"+username+";");
		String password = new String((char[]) token.getCredentials());

		String psd = new Md5Hash(password).toString();
		System.out.println("密码--"+psd);
		TbUsers admins = mapper.getinfo(username, psd);
		
		
		// 账号不存在
		if (admins == null) {
			throw new UnknownAccountException("账号不存在!");
		}
		
		// 密码错误
		if (!psd.equals(admins.getPassword())) {
			throw new IncorrectCredentialsException("账号或密码不正确!");
		}

		// 账号未分配角色
		if (admins.getRoleid() == null || admins.getRoleid() == 0) {
			throw new UnknownAccountException("账号未分配角色!");
		}

		SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(admins,password, getName());
		return info;
	}
}
