package com.zdd.core.service;
import com.zdd.common.utils.Page;
import com.zdd.core.po.Department;
import com.zdd.core.po.Staff;
public interface Department1Service {
	// 查询员工列表
	public Page<Department> findDepartmentList(Integer page, Integer rows, 
			String department_name,String department_number);
	
	// 通过id查询员工
	public Department getDepartmentById(Integer id);
	//课程模糊查询
		public Page<Department> selectVague(Integer page, Integer rows,Department department1);

}
