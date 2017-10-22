package com.danacom.mybatis.cpy;

import java.util.List;

import org.springframework.stereotype.Component;

import com.danacom.mybatis.base.BaseDao;

@Component
public class CpyDao extends BaseDao {
	
	/**
     * 회사리스트 조회
     * 
     * @author		유종훈
     * @date		2017. 10. 22
     */
	public List<CpyVo> getCpyList(){
		return template.selectList("cpyList");
	}

}
