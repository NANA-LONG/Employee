package com.zdd.core.service;
import com.zdd.common.utils.Page;
import com.zdd.core.po.Award;
public interface AwardService {
	// 查询员工列表
	public Page<Award> findAwardList(Integer page, Integer rows, 
                                        String number,String name);
	//创建员工
	public int createAward(Award award);
	
	// 通过id查询员工
	public Award getAwardById(Integer id);
	// 更新员工
	public int updateAward(Award award);
	// 删除员工
	public int deleteAward(Integer id);
	//课程模糊查询
	public Page<Award> selectVague(Integer page, Integer rows,Award awrad);


}
