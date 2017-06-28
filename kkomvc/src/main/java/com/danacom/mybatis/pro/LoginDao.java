package com.danacom.mybatis.pro;

import java.util.List;

import org.springframework.stereotype.Component;

import com.danacom.mybatis.base.BaseDao;

@Component
public class LoginDao extends BaseDao {
	
	/**
     * 사용자 로그인 체크
     * 
     * @author		유종훈
     * @date		2017. 05. 09
     */
	public List<MemComVo> getLoginChk(String mem_id){
		return template.selectList("loginChk", mem_id);
	}

	public void memInsert(MemComVo memComVo) {
		template.insert("memInsert", memComVo);
	}

}
