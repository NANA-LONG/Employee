package com.zdd.core.web.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zdd.common.utils.Page;
import com.zdd.core.po.Department;
import com.zdd.core.po.User;
import com.zdd.core.service.DepartmentService;
/**
 * 员工管理控制器类
 */
@Controller
public class DepartmentController {
	// 依赖注入
	@Autowired
	private DepartmentService departmentService;
	
	/**
	 *  员工列表
	 */
	@RequestMapping(value = "/department/list.action")
	public String list(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer rows,
			String department_name, Model model) {
		// 条件查询所有员工
		Page<Department> departments = departmentService
				.findDepartmentList(page, rows, department_name);
		model.addAttribute("page", departments);
		// 添加参数
		model.addAttribute("department_number", department_name);
		model.addAttribute("func", "department");
		return "staff";
	}
	
	/**
	 * 创建员工
	 */
	@RequestMapping("/department/create.action")
	@ResponseBody
	public String departmentCreate(Department department,HttpSession session) {
	    // 获取Session中的当前用户信息
		User User = (User) session.getAttribute("USER_SESSION");
	    // 将当前用户id存储在员工对象中
		department.setId(User.getId());
	   
	    // 执行Service层中的创建方法，返回的是受影响的行数
	    int rows = departmentService.createDepartment(department);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}

	/**
	 * 通过id获取员工信息
	 */
	@RequestMapping("/department/getDepartmentById.action")
	@ResponseBody
	public Department getDepartmentById(Integer id) {
		Department department = departmentService.getDepartmentById(id);
	    return department;
	}
	/**
	 * 更新员工
	 */
	@RequestMapping("/department/update.action")
	@ResponseBody
	public String departmentUpdate(Department department) {
		System.out.println(department.getId());
	    int rows = departmentService.updateDepartment(department);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}

	/**
	 * 删除员工
	 */
	@RequestMapping("/department/delete.action")
	@ResponseBody
	public String departmentDelete(Integer id) {
	    int rows = departmentService.deleteDepartment(id);
	    if(rows > 0){			
	        return "OK";
	    }else{
	        return "FAIL";			
	    }
	}

}
