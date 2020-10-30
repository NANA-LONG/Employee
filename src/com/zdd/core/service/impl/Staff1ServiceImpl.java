package com.zdd.core.service.impl;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zdd.core.dao.Staff1Dao;
import com.zdd.common.utils.Page;
import com.zdd.core.po.Staff;
import com.zdd.core.service.Staff1Service;

/**
 * 员工管理
 */
@Service("staff1Service")
@Transactional
public class Staff1ServiceImpl implements Staff1Service {
	// 声明DAO属性并注入
	@Autowired
	private Staff1Dao staff1Dao;

	@Override
	public Page<Staff> findStaffList(Integer page, Integer rows, 
			String department_number, String employee_name,
			String nation) {
		      // 创建员工对象
				Staff staff1 = new Staff();
				// 判断员工名称
				if(StringUtils.isNotBlank(department_number)){
					staff1.setDepartment_number(department_number);
				}
				// 判断员工信息来源
				if(StringUtils.isNotBlank(employee_name)){
					staff1.setEmployee_name(employee_name);
				}
				// 判断员工所属行业
				if(StringUtils.isNotBlank(nation)){
					staff1.setNation(nation);
				}
				if ("".equals(staff1.getDepartment_number())) {
					staff1.setDepartment_number(null);
				}
				if ("".equals(staff1.getEmployee_name())) {
					staff1.setEmployee_name(null);
				}
				if ("".equals(staff1.getNation())) {
					staff1.setNation(null);
				}
				if ("".equals(staff1.getRole())) {
					staff1.setRole(null);
				}
				// 当前页
				staff1.setStart((page-1) * rows) ;
				// 每页数
				staff1.setRows(rows);
				// 查询员工列表
				List<Staff> staffs = staff1Dao.selectStaffList(staff1);
				// 查询员工列表总记录数
				Integer count = staff1Dao.selectStaffListCount(staff1);
				// 创建Page返回对象
				Page<Staff> result = new Page<>();
				result.setPage(page);
				result.setRows(staffs);
				result.setSize(rows);
				result.setTotal(count);
				return result;
			}



	@Override
	public Staff getStaffById(Integer id) {
		Staff staff1 = staff1Dao.getStaffById(id);
	    return staff1;
	}



	@Override
	public Page<Staff> selectVague(Integer page, Integer rows, Staff staff1) {
		// TODO Auto-generated method stub
		return null;
	}


}
