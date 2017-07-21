package com.danacom.mybatis.pro;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.danacom.mybatis.base.BaseDao;

@Component
public class ProDao extends BaseDao {

	public List<ProductVo> getProAdminList(Map<String, Object> requestMap) {
		return template.selectList("proAdminPclList", requestMap);
	}

	public int getProMaxNo() {
		return template.selectOne("proMaxNO");
	}

	public void proInsert(ProductVo proCommand) {
		template.insert("proInsert", proCommand);
	}

	public void psmInsert(ProductVo proCommand) {
		template.insert("psmInsert", proCommand);
	}

	public void pmgInsert(Pro_imgVo pmgCommand) {
		template.insert("pmgInsert", pmgCommand);
	}

	public void pdtInsert(Pro_detVo pdtCommand) {
		template.insert("pdtInsert", pdtCommand);
	}
	
	public void commit(){
		template.commit();
	}

	public ProductVo getProVo(int pro_no) {
		return template.selectOne("proVo", pro_no);
	}

	public String getPmgFile(int pro_no, int idt_no) {
		Map<String, Integer> map = new HashMap<>();
		map.put("pro_no", pro_no);
		map.put("idt_no", idt_no);
		return template.selectOne("pmgFile", map);
	}

	public void proUpdate(ProductVo proCommand) {
		template.update("proUpdate", proCommand);
	}

	public void psmUpdate(ProductVo proCommand) {
		template.update("psmUpdate", proCommand);
	}

	public void pmgUpdate(Pro_imgVo pmgCommand) {
		template.update("pmgUpdate", pmgCommand);
	}

	public void pdtDelete(int proMaxNo) {
		template.delete("pdtDelete", proMaxNo);
	}

	public void pmgDelete(int proMaxNo) {
		template.delete("pmgDelete", proMaxNo);
	}

	public void psmDelete(int proMaxNo) {
		template.delete("psmDelete", proMaxNo);
	}

	public void proDelete(int proMaxNo) {
		template.delete("proDelete", proMaxNo);
	}

	public List<ProductVo> getProMainList(Map<String, Object> requestMap) {
		return template.selectList("proMainList", requestMap);
	}

	public List<MemComVo> getMemAdminList(Map<String, Object> requestMap) {
		return template.selectList("getMemAdminList", requestMap);
	}

	public void sctProDelete(int proMaxNo) {
		template.delete("sctProDelete", proMaxNo);
	}

	public void tran_delete(int proMaxNo) {
		template.delete("pdtDelete", proMaxNo);
		template.delete("pmgDelete", proMaxNo);
		template.delete("psmDelete", proMaxNo);
		template.delete("proDelete", proMaxNo);
		template.delete("sctProDelete", proMaxNo);
	}

}
