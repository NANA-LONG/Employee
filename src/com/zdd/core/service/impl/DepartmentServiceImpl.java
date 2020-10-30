package com.zdd.core.service.impl;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zdd.core.dao.DepartmentDao;
import com.zdd.common.utils.Page;
import com.zdd.core.po.Department;
import com.zdd.core.service.DepartmentService;

/**
 * 员工管理
 */
@Service("departmentService")
@Transactional
public class DepartmentServiceImpl implements DepartmentService {
	// 声明DAO属性并注入
	@Autowired
	private DepartmentDao departmentDao;

	@Override
	public Page<Department> findDepartmentList(Integer page, Integer rows, 
			String department_name) {
		      // 创建员工对象
				Department department = new Department();
				// 判断员工名称
				if(StringUtils.isNotBlank(department_name)){
					department.setDepartment_name(department_name);
				}
				/**
				 * 课程模糊查询
				 */
				if ("".equals(department.getDepartment_name())) {
					department.setDepartment_name(null);
				}
				
				// 当前页
				department.setStart((page-1) * rows) ;
				// 每页数
				department.setRows(rows);
				// 查询员工列表
				List<Department> departments = departmentDao.selectDepartmentList(department);
				// 查询员工列表总记录数
				Integer count = departmentDao.selectDepartmentListCount(department);
				// 创建Page返回对象
				Page<Department> result = new Page<>();
				result.setPage(page);
				result.setRows(departments);
				result.setSize(rows);
				result.setTotal(count);
				return result;
			}

	@Override
	public int createDepartment(Department department) {
		return departmentDao.createDepartment(department);
	}

	@Override
	public Department getDepartmentById(Integer id) {
		Department department = departmentDao.getDepartmentById(id);
	    return department;
	}

	
	
	@Override
	public int updateDepartment(Department department) {
		return departmentDao.updateDepartment(department);
	}

	@Override
	public int deleteDepartment(Integer id) {
		return departmentDao.deleteDepartment(id);
	}

	@Override
	public Page<Department> selectVague(Integer page, Integer rows, Department department) {
		// TODO Auto-generated method stub
		return null;
	}
}
