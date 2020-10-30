package com.zdd.core.service.impl;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zdd.core.dao.Wage1Dao;
import com.zdd.common.utils.Page;
import com.zdd.core.po.Wage;
import com.zdd.core.service.Wage1Service;

/**
 * 员工管理
 */
@Service("wage1Service")
@Transactional
public class Wage1ServiceImpl implements Wage1Service {
	// 声明DAO属性并注入
	@Autowired
	private Wage1Dao wage1Dao;

	@Override
	public Page<Wage> findWageList(Integer page, Integer rows, 
			String bills_number, String base_pay,
			String insurances_pay, Integer merit_pay) {
		      // 创建员工对象
				Wage wage1 = new Wage();
				// 判断员工名称
				if(StringUtils.isNotBlank(bills_number)){
					wage1.setBills_number(bills_number);
				}
				// 判断员工信息来源
				if(StringUtils.isNotBlank(base_pay)){
					wage1.setBase_pay(base_pay);
				}
				// 判断员工所属行业
				if(StringUtils.isNotBlank(insurances_pay)){
					wage1.setInsurances_pay(insurances_pay);
				}
				//模糊查询
				if ("".equals(wage1.getBills_number())) {
					wage1.setBills_number(null);
				}
				if ("".equals(wage1.getBase_pay())) {
					wage1.setBase_pay(null);
				}
				if ("".equals(wage1.getInsurances_pay())) {
					wage1.setInsurances_pay(null);
				}
				
				// 当前页
				wage1.setStart((page-1) * rows) ;
				// 每页数
				wage1.setRows(rows);
				// 查询员工列表
				List<Wage> wages = 
						wage1Dao.selectWageList(wage1);
				
				// 查询员工列表总记录数
				Integer count = wage1Dao.selectWageListCount(wage1);
				// 创建Page返回对象
				Page<Wage> result = new Page<>();
				result.setPage(page);
				result.setRows(wages);
				result.setSize(rows);
				result.setTotal(count);
				return result;
	}


	@Override
	public Wage getWageById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public Page<Wage> selectVague(Integer page, Integer rows, Wage wage1) {
		// TODO Auto-generated method stub
		return null;
	}


}
