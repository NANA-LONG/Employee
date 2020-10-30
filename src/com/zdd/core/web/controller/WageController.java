package com.zdd.core.web.controller;
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zdd.common.utils.Page;
import com.zdd.core.po.Wage;
import com.zdd.core.po.User;
import com.zdd.core.service.WageService;
/**
 * 员工管理控制器类
 */
@Controller
public class WageController {
	// 依赖注入
	@Autowired
	private WageService wageService;
	
	/**
	 *  员工列表
	 */
	@RequestMapping(value = "/wage/list.action")
	public String list(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer rows,
			String bills_number, String base_pay,
			String insurances_pay, Integer merit_pay, Model model) {
		// 条件查询所有员工
		Page<Wage> wages = wageService
				.findWageList(page, rows, bills_number,
						base_pay,insurances_pay,merit_pay);
		model.addAttribute("page", wages);
		// 添加参数
		model.addAttribute("bills_number", bills_number);
		model.addAttribute("base_pay", base_pay);
		model.addAttribute("nation", insurances_pay);
		model.addAttribute("merit_pay",merit_pay);	
		model.addAttribute("func", "wage");
		return "staff";
	}
	
	/**
	 * 创建员工
	 */
	@RequestMapping("/wage/create.action")
	@ResponseBody
	public String wageCreate(Wage wage,HttpSession session) {
	    // 获取Session中的当前用户信息
		User User = (User) session.getAttribute("USER_SESSION");
	    // 将当前用户id存储在员工对象中
		wage.setId(User.getId());
	   
	    // 执行Service层中的创建方法，返回的是受影响的行数
	    int rows = wageService.createWage(wage);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}

	/**
	 * 通过id获取员工信息
	 */
	@RequestMapping("/wage/getWageById.action")
	@ResponseBody
	public Wage getWageById(Integer id) {
		Wage wage = wageService.getWageById(id);
	    return wage;
	}
	/**
	 * 更新员工
	 */
	@RequestMapping("/wage/update.action")
	@ResponseBody
	public String wageUpdate(Wage wage) {
	    int rows = wageService.updateWage(wage);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}

	/**
	 * 删除员工
	 */
	@RequestMapping("/wage/delete.action")
	@ResponseBody
	public String wageDelete(Integer id) {
	    int rows = wageService.deleteWage(id);
	    if(rows > 0){			
	        return "OK";
	    }else{
	        return "FAIL";			
	    }
	}

}
