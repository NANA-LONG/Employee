package com.zdd.core.dao;
import java.util.List;

import com.zdd.core.po.Award;
import com.zdd.core.po.Department;;
/**
 * Customer接口
 */
public interface DepartmentDao {
    // 员工列表
	public List<Department> selectDepartmentList(Department department);
	// 员工数
	public Integer selectDepartmentListCount(Department department);
	
	// 创建员工
	public int createDepartment(Department department);
	// 通过id查询员工
	public Department getDepartmentById(Integer id);
	// 更新员工信息
	public int updateDepartment(Department department);
	// 删除员工
	int deleteDepartment (Integer id);
	//课程模糊查询
    public List<Department> selectVague(Department department);
}
