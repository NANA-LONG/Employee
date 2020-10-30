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
import com.zdd.core.service.Wage1Service;
/**
 * 员工管理控制器类
 */
@Controller
public class Wage1Controller {
	// 依赖注入
	@Autowired
	private Wage1Service wage1Service;
	
	/**
	 *  员工列表
	 */
	@RequestMapping(value = "/wage1/list.action")
	public String list(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer rows,
			String bills_number, String base_pay,
			String insurances_pay, Integer merit_pay, Model model) {
		// 条件查询所有员工
		Page<Wage> wages = wage1Service
				.findWageList(page, rows, bills_number,
						base_pay,insurances_pay,merit_pay);
		model.addAttribute("page", wages);
		// 添加参数
		model.addAttribute("bills_number", bills_number);
		model.addAttribute("base_pay", base_pay);
		model.addAttribute("nation", insurances_pay);
		model.addAttribute("merit_pay",merit_pay);	
		model.addAttribute("func", "wage1");
		return "staff1";
	}
}
