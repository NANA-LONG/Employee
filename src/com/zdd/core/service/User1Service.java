package com.zdd.core.service;
import com.zdd.common.utils.Page;
import com.zdd.core.po.Staff;
import com.zdd.core.po.User;

/**
 * 用户Service层接口
 */
public interface User1Service {
	// 通过账号和密码查询用户
	public User findUser(String username,String password,Integer role);
	// 查询员工列表
		public Page<User> findUserList(Integer page, Integer rows, 
	                                        String username,String password,
	                                        Integer role);
	
		// 通过id查询员工
		public User getUserById(Integer id);
	
		//课程模糊查询
		public Page<User> selectVague(Integer page, Integer rows,User user1);

}
