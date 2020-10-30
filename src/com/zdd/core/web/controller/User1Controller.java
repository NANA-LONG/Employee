package com.zdd.core.web.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zdd.common.utils.Page;
import com.zdd.core.po.User;
import com.zdd.core.service.User1Service;
/**
 * 用户控制器类
 */
@Controller
public class User1Controller {
	// 依赖注入
	@Autowired
	private User1Service user1Service;

	/**
	 *  员工列表
	 */
	@RequestMapping(value = "/users1/list.action")
	public String list(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer rows, 
			String username, String password,Integer role, Model model) {
		// 条件查询所有员工
		Page<User> users = user1Service
				.findUserList(page,rows, username, password, role);
		model.addAttribute("page", users);
		// 添加参数
		model.addAttribute("username", username);
		model.addAttribute("func", "users1");
		return "staff1";
	}
	
	
}
