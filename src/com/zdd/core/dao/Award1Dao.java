package com.zdd.core.dao;
import java.util.List;
import com.zdd.core.po.Award;
import com.zdd.core.po.Staff;;
/**
 * Customer接口
 */
public interface Award1Dao {
    // 员工列表
	public List<Award> selectAwardList(Award award1);
	// 员工数
	public Integer selectAwardListCount(Award award1);
	
	// 通过id查询员工
	public Award getAwardById(Integer id);
	//课程模糊查询
    public List<Award> selectVague(Award award1);


}
