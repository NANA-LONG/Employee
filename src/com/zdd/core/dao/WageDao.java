package com.zdd.core.dao;
import java.util.List;

import com.zdd.core.po.Wage;;
/**
 * Customer接口
 */
public interface WageDao {
    // 员工列表
	public List<Wage> selectWageList(Wage wage);
	// 员工数
	public Integer selectWageListCount(Wage wage);
	
	// 创建员工
	public int createWage(Wage wage);
	// 通过id查询员工
	public Wage getWageById(Integer id);
	// 更新员工信息
	public int updateWage(Wage wage);
	// 删除员工
	int deleteWage (Integer id);
	//课程模糊查询
    public List<Wage> selectVague(Wage wage);
}
