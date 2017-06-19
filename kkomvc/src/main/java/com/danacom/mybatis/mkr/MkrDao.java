package com.danacom.mybatis.mkr;

import java.util.List;

import org.springframework.stereotype.Component;

import com.danacom.mybatis.base.BaseDao;

@Component
public class MkrDao extends BaseDao {

	/**
     * 관리자 제조사 리스트 조회
     * 
     * @author		유종훈
     * @date		2017. 05. 14
     */
	public List<MakerVo> getMkrList(String pro_pcl_no){
		return template.selectList("mkrList", pro_pcl_no);
	}

	/**
     * 관리자 제조사 등록
     * 
     * @author		유종훈
     * @date		2017. 05. 14
     */
	public void mkrInsert(MakerVo mkrCom) {
		template.insert("mkrInsert", mkrCom);
	}
	
	/**
     * 관리자 제조사 상세조회
     * 
     * @author		유종훈
     * @date		2017. 05. 14
     */
	public MakerVo getMkrVO(String mkr_no){
		return template.selectOne("mkrVO", mkr_no);
	}
	
	/**
     * 관리자 제조사 수정
     * 
     * @author		유종훈
     * @date		2017. 05. 14
     */
	public void mkrUpdate(MakerVo mkrCom) {
		template.insert("mkrUpdate", mkrCom);
	}
	
	/**
     * 관리자 제조사 삭제
     * 
     * @author		유종훈
     * @date		2017. 05. 14
     */
	public void mkrDelete(String mkr_no) {
		template.delete("mkrDelete", mkr_no);
	}
		
}
