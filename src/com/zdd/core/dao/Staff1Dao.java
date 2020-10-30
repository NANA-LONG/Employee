package com.zdd.core.dao;
import java.util.List;

import com.zdd.core.po.Staff;
/**
 * Customer接口
 */
public interface Staff1Dao {
    // 员工列表
	public List<Staff> selectStaffList(Staff staff1);
	// 员工数
	public Integer selectStaffListCount(Staff staff1);
	// 通过id查询员工
	public Staff getStaffById(Integer id);
	// 更新员工信息
	public int updateStaff(Staff staff1);
	//课程模糊查询
    public List<Staff> selectVague(Staff staff1);

}
