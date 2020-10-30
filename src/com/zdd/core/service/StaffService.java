package com.zdd.core.service;
import com.zdd.common.utils.Page;
import com.zdd.core.po.Staff;
public interface StaffService {
	// 查询员工列表
	public Page<Staff> findStaffList(Integer page, Integer rows, 
                                        String department_number,String employee_name,
                                        String nation,String role);
	//创建员工
	public int createStaff(Staff staff);
	
	// 通过id查询员工
	public Staff getStaffById(Integer id);
	// 更新员工
	public int updateStaff(Staff staff);
	// 删除员工
	public int deleteStaff(Integer id);
	//课程模糊查询
	public Page<Staff> selectVague(Integer page, Integer rows,Staff staff);


}
