package com.zdd.core.dao;
import java.util.List;
import com.zdd.core.po.Award;;
/**
 * Customer接口
 */
public interface AwardDao {
    // 员工列表
	public List<Award> selectAwardList(Award award);
	// 员工数
	public Integer selectAwardListCount(Award award);
	
	// 创建员工
	public int createAward(Award award);
	// 通过id查询员工
	public Award getAwardById(Integer id);
	// 更新员工信息
	public int updateAward(Award award);
	// 删除员工
	int deleteAward (Integer id);

	//课程模糊查询
		public List<Award> selectVague(Award award);
}
