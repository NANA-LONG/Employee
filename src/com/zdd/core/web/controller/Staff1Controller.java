package com.zdd.core.web.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zdd.common.utils.Page;
import com.zdd.core.po.Staff;
import com.zdd.core.po.User;
import com.zdd.core.service.Staff1Service;
/**
 * 员工管理控制器类
 */
@Controller
public class Staff1Controller {
	// 依赖注入
	@Autowired
	private Staff1Service staff1Service;
	
	/**
	 *  员工列表
	 */
	@RequestMapping(value = "/staff1/list.action")
	public String list(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer rows,
			String department_number, String employee_name, String nation,
			String role, Model model) {
		// 条件查询所有员工
		Page<Staff> staffs = staff1Service
				.findStaffList(page, rows, department_number,
						employee_name,nation);
		model.addAttribute("page", staffs);
		// 添加参数
		
		model.addAttribute("department_number", department_number);
		model.addAttribute("employee_name", employee_name);
		model.addAttribute("nation", nation);	
		model.addAttribute("func", "staff1");
		return "staff1";
	}
	/**
	 * 通过id获取员工信息
	 */
	@RequestMapping("/staff1/getStaffById.action")
	@ResponseBody
	public Staff getStaffById(Integer id) {
		Staff staff1 = staff1Service.getStaffById(id);
	    return staff1;
	}
}