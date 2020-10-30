package com.zdd.core.service;
import com.zdd.common.utils.Page;
import com.zdd.core.po.Award;
import com.zdd.core.po.Staff;
public interface Award1Service {
	// 查询员工列表
	public Page<Award> findAwardList(Integer page, Integer rows, 
                                        String number,String name,
                                        String reason,String explains);
	
	
	// 通过id查询员工
	public Award getAwardById(Integer id);
	//课程模糊查询
	public Page<Award> selectVague(Integer page, Integer rows,Award award1);

}
