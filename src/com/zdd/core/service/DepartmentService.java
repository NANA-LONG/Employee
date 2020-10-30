package com.zdd.core.service;
import com.zdd.common.utils.Page;
import com.zdd.core.po.Award;
import com.zdd.core.po.Department;
public interface DepartmentService {
	// 查询员工列表
	public Page<Department> findDepartmentList(Integer page, Integer rows, 
			String department_name);
	//创建员工
	public int createDepartment(Department department);
	
	// 通过id查询员工
	public Department getDepartmentById(Integer id);
	// 更新员工
	public int updateDepartment(Department department);
	// 删除员工
	public int deleteDepartment(Integer id);
	//课程模糊查询
    public Page<Department> selectVague(Integer page, Integer rows,Department department);
}
