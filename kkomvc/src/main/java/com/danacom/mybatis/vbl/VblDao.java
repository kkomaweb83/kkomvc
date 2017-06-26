package com.danacom.mybatis.vbl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.danacom.mybatis.base.BaseDao;
import com.danacom.mybatis.pcl.ProClassVo;
import com.danacom.mybatis.pro.ProductVo;

@Component
public class VblDao extends BaseDao {
	
	/**
     * 가상견적서 리스트
     * 
     * @author		유종훈
     * @date		2017. 05. 21
     */
	public List<VirBillVo> getVblList(Map<String, Object> requestMap){
		return template.selectList("vblList", requestMap);
	}

	public int getVblMaxNo() {
		return template.selectOne("vblMaxNo");
	}

	public void vblInsert(VirBillVo vblCommand) {
		template.insert("vblInsert", vblCommand);
	}

	public int vdtInsert(VblDetVo vdtCommand) {
		return template.insert("vdtInsert", vdtCommand);
	}

	public VirBillVo getVblVo(int vbl_no) {
		return template.selectOne("vblVo", vbl_no);
	}

	public ProductVo getvVblProVo(ProClassVo pclVO2) {
		return template.selectOne("vblProVo", pclVO2);
	}
	
	public void commit(){
		template.commit();
	}

	public void vblUpdate(VirBillVo vblCommand) {
		template.update("vblUpdate", vblCommand);
	}

	public void vdtDelete(int vblMaxNo) {
		template.delete("vdtDelete", vblMaxNo);
	}

	public void vblDelete(int vblMaxNo) {
		template.delete("vblDelete", vblMaxNo);
	}

	public int getVbbMaxNo() {
		return template.selectOne("vbbMaxNo");
	}

	public void vbbInsert(VirBillVo vblCommand) {
		template.insert("vbbInsert", vblCommand);
	}

	public int vdsInsert(VblDetVo vdtCommand) {
		return template.insert("vdsInsert", vdtCommand);
	}

	public List<VbbVo> getVbbList(Map<String, Object> requestMap) {
		return template.selectList("vbbList", requestMap);
	}

	public void countUpVbbContent(VbbVo vbb_Command) {
		template.update("countUpVbbContent", vbb_Command);
	}

	public VbbVo getVbbContent(VbbVo vbb_Command) {
		return template.selectOne("getVbbContent", vbb_Command);
	}

	public List<VbsVo> getVbbContentPro(VbbVo vbb_Command) {
		return template.selectList("getVbbContentPro", vbb_Command);
	}

	public List<VbbVo> getVbrList(VbbVo vbb_Command) {
		return template.selectList("getVbrList", vbb_Command);
	}

	public void recommVbbContent(VbbVo vbb_Command) {
		template.update("recommVbbContent", vbb_Command);
	}

	public void replyInsert(VbbVo vbb_Command) {
		template.insert("replyInsert", vbb_Command);
	}

	public void replyUpdate(VbbVo vbb_Command) {
		template.update("replyUpdate", vbb_Command);
	}

	public void replyDelete(VbbVo vbb_Command) {
		template.delete("replyDelete", vbb_Command);
	}
	
	public List<BtlVo> getBtlList(Map<String, Object> requestMap) {
		return template.selectList("btlList", requestMap);
	}

	public void btlInsert(BtlVo btl_Command) {
		template.insert("btlInsert", btl_Command);
	}

	public BtlVo getBtlView(BtlVo btl_Command) {
		return template.selectOne("getBtlView", btl_Command);
	}

	public List<BtlVo> getBtlDetList(BtlVo btl_Command) {
		return template.selectList("getBtlDetList", btl_Command);
	}

	public int getVbjMaxNo() {
		return template.selectOne("vbjMaxNo");
	}

	public void vbjInsert(BtlVo btl_Command) {
		template.insert("vbjInsert", btl_Command);
	}

	public List<BtlVo> getVdsNoList(BtlVo btl_Command) {
		return template.selectList("getVdsNoList", btl_Command);
	}

	public void vbdInsert(BtlVo btl_Command) {
		template.insert("vbdInsert", btl_Command);
	}

	public void answerVbbUpdate(BtlVo btl_Command) {
		template.update("answerVbbUpdate", btl_Command);
	}

	public BtlVo getBtlJoinContent(BtlVo btl_Command) {
		return template.selectOne("getBtlJoinContent", btl_Command);
	}

	public List<BtlVo> getBtlJoinDetList(BtlVo btl_Command) {
		return template.selectList("getBtlJoinDetList", btl_Command);
	}

	public void vbdDelete(BtlVo btl_Command) {
		template.delete("vbdDelete", btl_Command);
	}

	public void vbjDelete(BtlVo btl_Command) {
		template.delete("vbjDelete", btl_Command);
	}

	public void gradeVbjUpdate(BtlVo btl_Command) {
		template.update("gradeVbjUpdate", btl_Command);
	}

}
