package com.zdd.core.dao;
import java.util.List;
import com.zdd.core.po.Department;
import com.zdd.core.po.Staff;;
/**
 * Customer接口
 */
public interface Department1Dao {
    // 员工列表
	public List<Department> selectDepartmentList(Department department1);
	// 员工数
	public Integer selectDepartmentListCount(Department department1);
		// 通过id查询员工
	public Department getDepartmentById(Integer id);
	//课程模糊查询
    public List<Department> selectVague(Department department1);

}
