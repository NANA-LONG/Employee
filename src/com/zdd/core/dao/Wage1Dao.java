package com.zdd.core.dao;
import java.util.List;

import com.zdd.core.po.Staff;
import com.zdd.core.po.Wage;
/**
 * Customer接口
 */
public interface Wage1Dao {
    // 员工列表
	public List<Wage> selectWageList(Wage wage1);
	// 员工数
	public Integer selectWageListCount(Wage wage1);
	
	// 通过id查询员工
	public Wage getWageById(Integer id);
	//课程模糊查询
    public List<Wage> selectVague(Wage wage1);

}
