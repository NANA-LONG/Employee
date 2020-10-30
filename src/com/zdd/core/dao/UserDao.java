package com.zdd.core.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.zdd.core.po.User;

/**
 * 用户DAO层接口
 */
public interface UserDao {
	/**
	 * 通过账号和密码查询用户
	 */
	public User findUser(@Param("username") String username,
            @Param("password") String password,
            @Param("role") Integer role);
	 // 员工列表
		public List<User> selectUserList(User user);
		// 员工数
		public Integer selectUserListCount(User user);
		
		// 创建员工
		public int createUser(User user);
		// 通过id查询员工
		public User getUserById(Integer id);
		// 更新员工信息
		public int updateUser(User user);
		// 删除员工
		int deleteUser (Integer id);
		//课程模糊查询
	    public List<User> selectVague(User user);
}	
