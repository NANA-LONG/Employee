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
import com.zdd.core.po.Award;
import com.zdd.core.po.User;
import com.zdd.core.service.Award1Service;
/**
 * 员工管理控制器类
 */
@Controller
public class Award1Controller {
	// 依赖注入
	@Autowired
	private Award1Service award1Service;
	
	/**
	 *  员工列表
	 */
	@RequestMapping(value = "/award1/list.action")
	public String list(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer rows,
			String number,String name,
            String reason,String explains,Model model) {
		// 条件查询所有员工
		Page<Award> awards = award1Service
				.findAwardList(page, rows, number,
						name,reason,explains);
		model.addAttribute("page", awards);
		// 添加参数
		model.addAttribute("number", number);
		model.addAttribute("name", name);
		model.addAttribute("reason", reason);
		model.addAttribute("explains", explains);	
		model.addAttribute("func", "award1");
		return "staff1";
	}
}
