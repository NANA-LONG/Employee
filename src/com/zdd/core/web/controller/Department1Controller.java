package com.zdd.core.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.zdd.common.utils.Page;
import com.zdd.core.po.Department;
import com.zdd.core.service.Department1Service;
/**
 * 员工管理控制器类
 */
@Controller
public class Department1Controller {
	// 依赖注入
	@Autowired
	private Department1Service department1Service;
	
	/**
	 *  员工列表
	 */
	@RequestMapping(value = "/department1/list.action")
	public String list(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer rows,
			String department_name,String department_number, Model model) {
		// 条件查询所有员工
		Page<Department> departments = department1Service.findDepartmentList(page, rows, department_name,department_number);
		model.addAttribute("page", departments);
		// 添加参数
		model.addAttribute("department_number", department_name);
		model.addAttribute("func", "department1");
		return "staff1";
	}
}
