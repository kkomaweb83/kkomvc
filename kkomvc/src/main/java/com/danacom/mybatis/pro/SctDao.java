package com.danacom.mybatis.pro;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.danacom.mybatis.base.BaseDao;

@Component
public class SctDao extends BaseDao {

	public List<Shop_cart> getSctList(int sct_mem_no) {
		return template.selectList("sctList", sct_mem_no);
	}

	public Shop_proVO getSctProVo(Shop_cart temp) {
		return template.selectOne("sctProVo", temp);
	}

	public Shop_proVO getSctPptVo(Shop_cart temp) {
		return template.selectOne("sctPptVo", temp);
	}

	public SctTotPriceVO getSctTotPrice(SctTotPriceVO sctTotPrivceVo) {
		return template.selectOne("sctTotPrice", sctTotPrivceVo);
	}

	public int sctInsertChk(Shop_cart sctCommand) {
		return template.selectOne("insertChk", sctCommand);
	}

	public void sctInsert(Shop_cart sctCommand) {
		template.insert("sctInsert", sctCommand);
	}

	public void sctCountUpdate(Shop_cart sctCommand) {
		template.update("countUpdate", sctCommand);
	}
	
	public void sctUpdate(Shop_cart sctCommand) {
		template.update("sctUpdate", sctCommand);
	}
	
	public void sctDelete(int sct_no) {
		template.delete("sctDelete", sct_no);
	}
	
	public void sctAllDelete(int sct_mem_no) {
		template.delete("sctAllDelete", sct_mem_no);
	}
	
	public void commit(){
		template.commit();
	}

	public SctTotPriceVO getMemMilege(int sct_mem_no) {
		return template.selectOne("memMilege", sct_mem_no);
	}

	public String getOdrMaxNo() {
		return template.selectOne("getOdrMaxNo");
	}

	public void odrInsert(OdrDocVo doc) {
		template.insert("odrInsert", doc);
	}

	public String getDlvMaxNo() {
		return template.selectOne("getDlvMaxNo");
	}

	public void dlvInsert(OdrDocVo doc) {
		template.insert("dlvInsert", doc);
	}

	public void odtInsert(OdrDet odtVo) {
		template.insert("odtInsert", odtVo);
	}
	
	public void proCountUpdate(Map<String, Object> stockcount_map) {
		template.update("proCountUpdate", stockcount_map);
	}

	public void editMileage(OdrDocVo doc) {
		template.update("editMileage", doc);
	}

	public void memMilAdd(OdrDocVo doc) {
		template.update("memMilAdd", doc);
	}

	public List<MpVo> getOrdersList(Map<String, Object> requestMap) {
		return template.selectList("getOrdersList", requestMap);
	}

	public MpVo getOrdersDetList(String odr_no) {
		return template.selectOne("getOrdersDetList", odr_no);
	}

	public List<Shop_cart> getOdcOdtList(String odr_no) {
		return template.selectList("getOdcOdtList", odr_no);
	}

	public void conditionUpdate(OdrDocVo doc) {
		template.update("conditionUpdate", doc);
	}

}
