package com.zdd.core.service.impl;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zdd.core.dao.AwardDao;
import com.zdd.common.utils.Page;
import com.zdd.core.po.Award;
import com.zdd.core.service.AwardService;

/**
 * 员工管理
 */
@Service("awardService")
@Transactional
public class AwardServiceImpl implements AwardService {
	// 声明DAO属性并注入
	@Autowired
	private AwardDao awardDao;

	@Override
	public Page<Award> findAwardList(Integer page, Integer rows, 
			String number,String name) {
		      // 创建员工对象
				Award award = new Award();
				// 判断员工名称
				if(StringUtils.isNotBlank(number)){
					award.setNumber(number);
				}
				// 判断员工信息来源
				if(StringUtils.isNotBlank(name)){
					award.setName(name);
				}
				
				/**
				 * 课程模糊查询
				 */
				if ("".equals(award.getNumber())) {
					award.setNumber(null);
				}
				if ("".equals(award.getName())) {
					award.setName(null);
				}
				
				// 当前页
				award.setStart((page-1) * rows) ;
				// 每页数
				award.setRows(rows);
				// 查询员工列表
				List<Award> awards = awardDao.selectAwardList(award);
				// 查询员工列表总记录数
				Integer count = awardDao.selectAwardListCount(award);
				// 创建Page返回对象
				Page<Award> result = new Page<>();
				result.setPage(page);
				result.setRows(awards);
				result.setSize(rows);
				result.setTotal(count);
				return result;
			}

	@Override
	public int createAward(Award award) {
		return awardDao.createAward(award);
	}

	@Override
	public Award getAwardById(Integer id) {
		Award award = awardDao.getAwardById(id);
	    return award;
	}

	@Override
	public int updateAward(Award award) {
		 return awardDao.updateAward(award);
	}
	
	@Override
	public int deleteAward(Integer id) {
		return awardDao.deleteAward(id);
	}

	@Override
	public Page<Award> selectVague(Integer page, Integer rows, Award awrad) {
		// TODO Auto-generated method stub
		return null;
	}
}
