package com.zdd.core.service.impl;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zdd.core.dao.StaffDao;
import com.zdd.common.utils.Page;
import com.zdd.core.po.Staff;
import com.zdd.core.service.StaffService;

/**
 * 员工管理
 */
@Service("staffService")
@Transactional
public class StaffServiceImpl implements StaffService {
	// 声明DAO属性并注入
	@Autowired
	private StaffDao staffDao;

	@Override
	public Page<Staff> findStaffList(Integer page, Integer rows, 
			String department_number, String employee_name,
			String nation, String role) {
		      // 创建员工对象
				Staff staff = new Staff();
				// 判断员工名称
				if(StringUtils.isNotBlank(department_number)){
					staff.setDepartment_number(department_number);
				}
				// 判断员工信息来源
				if(StringUtils.isNotBlank(employee_name)){
					staff.setEmployee_name(employee_name);
				}
				// 判断员工所属行业
				if(StringUtils.isNotBlank(nation)){
					staff.setNation(nation);
				}
				// 判断员工级别
				if(StringUtils.isNotBlank(role)){
					staff.setRole(role);
				}
				//模糊查询
				if ("".equals(staff.getDepartment_number())) {
					staff.setDepartment_number(null);
				}
				if ("".equals(staff.getEmployee_name())) {
					staff.setEmployee_name(null);
				}
				if ("".equals(staff.getNation())) {
					staff.setNation(null);
				}
				if ("".equals(staff.getRole())) {
					staff.setRole(null);
				}
				// 当前页
				staff.setStart((page-1) * rows) ;
				// 每页数
				staff.setRows(rows);
				// 查询员工列表
				List<Staff> staffs = staffDao.selectStaffList(staff);
				// 查询员工列表总记录数
				Integer count = staffDao.selectStaffListCount(staff);
				// 创建Page返回对象
				Page<Staff> result = new Page<>();
				result.setPage(page);
				result.setRows(staffs);
				result.setSize(rows);
				result.setTotal(count);
				return result;
			}
	/**
	 * 课程模糊查询
	 */
	
	
	@Override
	public int createStaff(Staff staff) {
		return staffDao.createStaff(staff);
	}

	@Override
	public Staff getStaffById(Integer id) {
		Staff staff = staffDao.getStaffById(id);
	    return staff;
	}

	@Override
	public int updateStaff(Staff staff) {
		 return staffDao.updateStaff(staff);
	}
	
	@Override
	public int deleteStaff(Integer id) {
		return staffDao.deleteStaff(id);
	}
	@Override
	public Page<Staff> selectVague(Integer page, Integer rows, Staff staff) {
		// TODO Auto-generated method stub
		return null;
	}
}
