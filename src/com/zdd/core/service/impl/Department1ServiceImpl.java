package com.zdd.core.service.impl;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zdd.core.dao.Department1Dao;
import com.zdd.common.utils.Page;
import com.zdd.core.po.Department;
import com.zdd.core.service.Department1Service;

/**
 * 员工管理
 */
@Service("department1Service")
@Transactional
public class Department1ServiceImpl implements Department1Service {
	// 声明DAO属性并注入
	@Autowired
	private Department1Dao department1Dao;

	@Override
	public Page<Department> findDepartmentList(Integer page, Integer rows, 
			String department_name,String department_number) {
		      // 创建员工对象
				Department department = new Department();
				// 判断员工名称
				if(StringUtils.isNotBlank(department_name)){
					department.setDepartment_name(department_name);
				}
				if(StringUtils.isNotBlank(department_name)){
					department.setDepartment_name(department_name);
				}
		/*
		 * // 判断员工信息来源 if(StringUtils.isNotBlank(employee_name)){
		 * department.setEmployee_name(employee_name); } // 判断员工所属行业
		 * if(StringUtils.isNotBlank(nation)){ department.setNation(nation); } // 判断员工级别
		 * if(StringUtils.isNotBlank(role)){ department.setRole(role); }
		 */if ("".equals(department.getDepartment_name())) {
				department.setDepartment_name(null);
			}
		 if ("".equals(department.getDepartment_name())) {
				department.setDepartment_name(null);
			}
		 if ("".equals(department.getDepartment_name())) {
				department.setDepartment_name(null);
			}
				// 当前页
				department.setStart((page-1) * rows) ;
				// 每页数
				department.setRows(rows);
				// 查询员工列表
				List<Department> departments = department1Dao.selectDepartmentList(department);
				// 查询员工列表总记录数
				Integer count = department1Dao.selectDepartmentListCount(department);
				// 创建Page返回对象
				Page<Department> result = new Page<>();
				result.setPage(page);
				result.setRows(departments);
				result.setSize(rows);
				result.setTotal(count);
				return result;
			}



	@Override
	public Department getDepartmentById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public Page<Department> selectVague(Integer page, Integer rows, Department department) {
		// TODO Auto-generated method stub
		return null;
	}

	


}
