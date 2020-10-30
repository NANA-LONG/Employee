package com.zdd.core.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zdd.common.utils.Page;
import com.zdd.core.dao.User1Dao;
import com.zdd.core.po.User;
import com.zdd.core.service.User1Service;
/** 
 * 用户Service接口实现类
 */
@Service("user1Service")
@Transactional
public class User1ServiceImpl implements User1Service {
	// 注入UserDao
	@Autowired
	private User1Dao user1Dao;
	
	// 通过账号和密码查询用户
	@Override
	public User findUser(String username, String password, Integer role) {
		User users = this.user1Dao.findUser(username, password,role);
		
		return users;
	}
	@Override
	public Page<User> findUserList(Integer page, Integer rows, 
			String username, String password,
			Integer role) {
		      // 创建员工对象
				User user = new User();
				// 判断员工名称
				if(StringUtils.isNotBlank(username)){
					user.setUsername(username);
				}
				// 判断员工信息来源
				if(StringUtils.isNotBlank(password)){
					user.setPassword(password);
				}
				//模糊查询
				if ("".equals(user.getUsername())) {
					user.setUsername(null);
				}
				if ("".equals(user.getPassword())) {
					user.setPassword(null);
				}
				// 当前页
				user.setStart((page-1) * rows) ;
				// 每页数
				user.setRows(rows);
				// 查询员工列表
				List<User> users = user1Dao.selectUserList(user);
				// 查询员工列表总记录数
				Integer count = user1Dao.selectUserListCount(user);
				// 创建Page返回对象
				Page<User> result = new Page<>();
				result.setPage(page);
				result.setRows(users);
				result.setSize(rows);
				result.setTotal(count);
				return result;
			}
	@Override
	public User getUserById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Page<User> selectVague(Integer page, Integer rows, User user1) {
		// TODO Auto-generated method stub
		return null;
	}
}
