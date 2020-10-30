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
import com.zdd.core.service.StaffService;
/**
 * 员工管理控制器类
 */
@Controller
public class StaffController {
	// 依赖注入
	@Autowired
	private StaffService staffService;
	
	/**
	 *  员工列表
	 */
	@RequestMapping(value = "/staff/list.action")
	public String list(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer rows,
			String department_number, String employee_name, String nation,
			String role, Model model) {
		// 条件查询所有员工
		Page<Staff> staffs = staffService
				.findStaffList(page, rows, department_number,
						employee_name,nation,role);
		model.addAttribute("page", staffs);
		// 添加参数
		
		model.addAttribute("department_number", department_number);
		model.addAttribute("employee_name", employee_name);
		model.addAttribute("nation", nation);
		model.addAttribute("role", role);	
		model.addAttribute("func", "staff");
		return "staff";
	}
	
	/**
	 * 创建员工
	 */
	@RequestMapping("/staff/create.action")
	@ResponseBody
	public String staffCreate(Staff staff,HttpSession session) {
	    // 获取Session中的当前用户信息
		User User = (User) session.getAttribute("USER_SESSION");
	    // 将当前用户id存储在员工对象中
		staff.setId(User.getId());
	   
	    // 执行Service层中的创建方法，返回的是受影响的行数
	    int rows = staffService.createStaff(staff);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}

	/**
	 * 通过id获取员工信息
	 */
	@RequestMapping("/staff/getStaffById.action")
	@ResponseBody
	public Staff getStaffById(Integer id) {
		Staff staff = staffService.getStaffById(id);
	    return staff;
	}
	/**
	 * 更新员工
	 */
	@RequestMapping("/staff/update.action")
	@ResponseBody
	public String staffUpdate(Staff staff) {
		System.out.println(staff.getId());
	    int rows = staffService.updateStaff(staff);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}

	/**
	 * 删除员工
	 */
	@RequestMapping("/staff/delete.action")
	@ResponseBody
	public String staffDelete(Integer id) {
	    int rows = staffService.deleteStaff(id);
	    if(rows > 0){			
	        return "OK";
	    }else{
	        return "FAIL";			
	    }
	}

}
