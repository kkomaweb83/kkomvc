package com.danacom.mybatis.pcl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.danacom.mybatis.base.BaseDao;
import com.danacom.mybatis.pro.ProTempVo;

@Component
public class PclDao extends BaseDao {

	/**
     * 메인 상단 상품분류 조회
     * 
     * @author		유종훈
     * @date		2017. 05. 08
     */
	public List<ProClassVo> getPclList(String pcl_upperno){
		return template.selectList("pclList", pcl_upperno);
	}
	
	/**
     * 사용자 상품 리스트 상품분류명 조회
     * 
     * @author		유종훈
     * @date		2017. 05. 08
     */
	public String getMainPclName(String pro_pcl_no){
		return template.selectOne("mainPclName", pro_pcl_no);
	}
	
	public ProClassVo getPclVO(String pcl_upperno){
		return template.selectOne("pclVO", pcl_upperno);
	}

	public String getMaxPclNo(String pcl_uppercode) {
		return template.selectOne("pclAutoPclNo", pcl_uppercode);
	}

	public void pclInsert(ProClassVo pclVO) {
		template.insert("pclInsert", pclVO);
	}
	
	public void pclUpdate(ProClassVo pclVO) {
		template.update("pclUpdate", pclVO);
	}
	
	public void pclDelete(String pcl_no) {
		template.delete("pclDelete", pcl_no);
	}

	public ProTempVo getNextPclVo(ProTempVo proTempVO) {
		return template.selectOne("nextPclVo", proTempVO);
	}
	
}
