package com.zdd.core.service;
import com.zdd.common.utils.Page;
import com.zdd.core.po.Staff;
import com.zdd.core.po.Wage;
public interface WageService {
	// 查询员工列表
	public Page<Wage> findWageList(Integer page, Integer rows, 
                 String bills_number,String merit_pay,
                 String base_pay,Integer insurances_pay);
	//创建员工
	public int createWage(Wage wage);
	
	// 通过id查询员工
	public Wage getWageById(Integer id);
	// 更新员工
	public int updateWage(Wage wage);
	// 删除员工
	public int deleteWage(Integer id);
	//课程模糊查询
		public Page<Wage> selectVague(Integer page, Integer rows,Wage wage);
}
