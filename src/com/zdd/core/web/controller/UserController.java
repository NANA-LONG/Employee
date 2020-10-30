package com.zdd.core.web.controller;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zdd.common.utils.Page;
import com.zdd.core.po.User;
import com.zdd.core.service.UserService;
/**
 * 用户控制器类
 */
@Controller
public class UserController {
	// 依赖注入
	@Autowired
	private UserService userService;
	/**
	 * 用户登录
	 */
	
	@RequestMapping(value = "/login.action", method = RequestMethod.POST,produces="text/html;charset=UTF-8")
	public String login(String username,String password, Integer role,Model model, 
                                                          HttpSession session) {
		// 通过账号和密码查询用户
		User users = userService.findUser(username, password,role);
		if(users != null){		
			// 将用户对象添加到Session
			session.setAttribute("USER_SESSION", users);
			// 跳转到主页面
//			return "customer";
			if(users.getRole()== 1) {
				// 跳转到主页面
				    return "redirect:/staff/list.action";
				}else {
					return "redirect:staff1/list.action";
				}
			}
			model.addAttribute("msg", "账号或密码错误，请重新输入！");
	         // 返回到登录页面
			return "login";
		}
	
	/**
	 * 模拟其他类中跳转到员工管理页面的方法
	 */
	@RequestMapping(value = "/toStaff.action")
	public String toStaff() {
	    return "staff";
	}
	
	/**
	 * 退出登录
	 */
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
	    // 清除Session
	    session.invalidate();
	    // 重定向到登录页面的跳转方法
	    return "redirect:login.action";
	}
	/**
	 * 向用户登陆页面跳转
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String toLogin() {
	    return "login";
	}
	/**
	 *  员工列表
	 */
	@RequestMapping(value = "/users/list.action")
	public String list(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer rows, 
			String username, String password,Integer role, Model model) {
		// 条件查询所有员工
		Page<User> users = userService
				.findUserList(page,rows, username, password, role);
		model.addAttribute("page", users);
		// 添加参数
		model.addAttribute("username", username);
		model.addAttribute("func", "users");
		return "staff";
	}
	
	/**
	 * 创建学生
	 */
	@RequestMapping("/user/create.action")
	@ResponseBody
	public String userCreate(User user,HttpSession session) {
	    // 执行Service层中的创建方法，返回的是受影响的行数
	    int rows = userService.createUser(user);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}
	/**
	 * 通过id获取员工信息
	 */
	@RequestMapping("/user/getUserById.action")
	@ResponseBody
	public User getUserById(Integer id) {
		User user = userService.getUserById(id);
	    return user;
	}
	/**
	 * 更新员工
	 */
	@RequestMapping("/user/update.action")
	@ResponseBody
	public String userUpdate(User user) {
	    int rows = userService.updateUser(user);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}

	/**
	 * 删除员工
	 */
	@RequestMapping("/user/delete.action")
	@ResponseBody
	public String userDelete(Integer id) {
	    int rows = userService.deleteUser(id);
	    if(rows > 0){			
	        return "OK";
	    }else{
	        return "FAIL";			
	    }
	}
}
