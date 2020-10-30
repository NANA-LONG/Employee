package com.zdd.core.service.impl;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zdd.core.dao.WageDao;
import com.zdd.common.utils.Page;
import com.zdd.core.po.Wage;
import com.zdd.core.service.WageService;

/**
 * 员工管理
 */
@Service("wageService")
@Transactional
public class WageServiceImpl implements WageService {
	// 声明DAO属性并注入
	@Autowired
	private WageDao wageDao;

	@Override
	public Page<Wage> findWageList(Integer page, Integer rows, 
			String bills_number, String base_pay,
			String insurances_pay, Integer merit_pay) {
		      // 创建员工对象
				Wage wage = new Wage();
				// 判断员工名称
				if(StringUtils.isNotBlank(bills_number)){
					wage.setBills_number(bills_number);
				}
				// 判断员工信息来源
				if(StringUtils.isNotBlank(base_pay)){
					wage.setBase_pay(base_pay);
				}
				// 判断员工所属行业
				if(StringUtils.isNotBlank(bills_number)){
					wage.setBills_number(bills_number);
				}
				if ("".equals(wage.getBase_pay())) {
					wage.setBase_pay(null);
				}
				
				// 当前页
				wage.setStart((page-1) * rows) ;
				// 每页数
				wage.setRows(rows);
				// 查询员工列表
				List<Wage> wages = 
						wageDao.selectWageList(wage);
				
				// 查询员工列表总记录数
				Integer count = wageDao.selectWageListCount(wage);
				// 创建Page返回对象
				Page<Wage> result = new Page<>();
				result.setPage(page);
				result.setRows(wages);
				result.setSize(rows);
				result.setTotal(count);
				return result;
			}

	@Override
	public int createWage(Wage wage) {
		return wageDao.createWage(wage);
	}

	@Override
	public Wage getWageById(Integer id) {
		Wage wage = wageDao.getWageById(id);
	    return wage;
	}

	@Override
	public int updateWage(Wage wage) {
		 return wageDao.updateWage(wage);
	}
	
	@Override
	public int deleteWage(Integer id) {
		return wageDao.deleteWage(id);
	}

	@Override
	public Page<Wage> selectVague(Integer page, Integer rows, Wage wage) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
