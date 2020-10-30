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
import com.zdd.core.service.AwardService;
/**
 * 员工管理控制器类
 */
@Controller
public class AwardController {
	// 依赖注入
	@Autowired
	private AwardService awardService;
	
	/**
	 *  员工列表
	 */
	@RequestMapping(value = "/award/list.action")
	public String list(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer rows,
			String number,String name,
            String reason,String explains,Model model) {
		// 条件查询所有员工
		Page<Award> awards = awardService
				.findAwardList(page, rows, number, name);
		model.addAttribute("page", awards);
		// 添加参数
		model.addAttribute("number", number);
		model.addAttribute("name", name);	
		model.addAttribute("func", "award");
		return "staff";
	}
	
	/**
	 * 创建员工
	 */
	@RequestMapping("/award/create.action")
	@ResponseBody
	public String awardCreate(Award award,HttpSession session) {
	    // 获取Session中的当前用户信息
		User User = (User) session.getAttribute("USER_SESSION");
	    // 将当前用户id存储在员工对象中
		award.setId(User.getId());
		// 创建Date对象
	    Date date = new Date();
	    // 得到一个Timestamp格式的时间，存入mysql中的时间格式“yyyy/MM/dd HH:mm:ss”
	    Timestamp timeStamp = new Timestamp(date.getTime());
	    award.setCreatetime(timeStamp);
	    // 执行Service层中的创建方法，返回的是受影响的行数
	    int rows = awardService.createAward(award);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}

	/**
	 * 通过id获取员工信息
	 */
	@RequestMapping("/award/getAwardById.action")
	@ResponseBody
	public Award getAwardById(Integer id) {
		Award award = awardService.getAwardById(id);
	    return award;
	}
	/**
	 * 更新员工
	 */
	@RequestMapping("/award/update.action")
	@ResponseBody
	public String awardUpdate(Award award) {
	    int rows = awardService.updateAward(award);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}

	/**
	 * 删除员工
	 */
	@RequestMapping("/award/delete.action")
	@ResponseBody
	public String awardDelete(Integer id) {
	    int rows = awardService.deleteAward(id);
	    if(rows > 0){			
	        return "OK";
	    }else{
	        return "FAIL";			
	    }
	}

}
