package com.danacom.web.pro;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.danacom.mybatis.base.BaseDao;
import com.danacom.mybatis.mkr.MakerVo;
import com.danacom.mybatis.mkr.MkrDao;
import com.danacom.mybatis.pcl.PclDao;
import com.danacom.mybatis.pcl.ProClassVo;
import com.danacom.mybatis.pro.MpVo;
import com.danacom.mybatis.pro.OdrDet;
import com.danacom.mybatis.pro.OdrDocVo;
import com.danacom.mybatis.pro.ProDao;
import com.danacom.mybatis.pro.ProTempVo;
import com.danacom.mybatis.pro.ProductVo;
import com.danacom.mybatis.pro.SctDao;
import com.danacom.mybatis.pro.SctTotPriceVO;
import com.danacom.mybatis.pro.Shop_cart;
import com.danacom.util.CommonUtilsController;

@Controller
public class ProController {
	@Autowired private PclDao pclDao;
	@Autowired private MkrDao mkrDao; 
	@Autowired private ProDao proDao; 
	@Autowired private BaseDao baseDao; 
	@Autowired private SctDao sctDao;
	@Autowired private PlatformTransactionManager transactionManager;
	
	public void setPclDao(PclDao pclDao) {
		this.pclDao = pclDao;
	}
	public PclDao getPclDao() {
		return pclDao;
	}
	public void setMkrDao(MkrDao mkrDao) {
		this.mkrDao = mkrDao;
	}
	public MkrDao getMkrDao() {
		return mkrDao;
	}
	public void setProDao(ProDao proDao) {
		this.proDao = proDao;
	}
	public ProDao getProDao() {
		return proDao;
	}
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	public BaseDao getBaseDao() {
		return baseDao;
	}
	public void setSctDao(SctDao sctDao) {
		this.sctDao = sctDao;
	}
	public SctDao getSctDao() {
		return sctDao;
	}
	public void setTransactionManager(PlatformTransactionManager transactionManager) {
		this.transactionManager = transactionManager;
	}
	public PlatformTransactionManager getTransactionManager() {
		return transactionManager;
	}
	
	@RequestMapping(value="/pro_main_prelist.do")
	public ModelAndView pro_main_prelist(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("pro/pro_main_list");
		
		List<ProClassVo> class_list = pclDao.getPclList("NULL");
		for(int i=0; i < class_list.size(); i++){
			if(i > 1) break;
			ProClassVo pclVO = class_list.get(i);
			pclVO.setPcl_list(pclDao.getPclList(pclVO.getPcl_no()));
		}
		HttpSession session = request.getSession();
		session.setAttribute("class_list", class_list);
		
		return mv;
	}
	
	@RequestMapping(value="/ajax_pro_topSearch.do")
	public ModelAndView ajax_pro_topSearch(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("pro/ajax_pro_main_topSearch");
		
		String pro_pcl_no = request.getParameter("pro_pcl_no");
		
		String mainPclName = pclDao.getMainPclName(pro_pcl_no);
		
		List<MakerVo> mkrList = mkrDao.getMkrList(pro_pcl_no);
		
		ProClassVo pclVO = null;
		List<ProClassVo> tempList = null;
		List<ProClassVo> pclList = pclDao.getPclList(pro_pcl_no);
		if(pclList != null){
			for(int i=0; i < pclList.size(); i++){
				pclVO = pclList.get(i);
				pclVO.setPcl_list(pclDao.getPclList(pclVO.getPcl_no()));
				tempList = pclVO.getPcl_list();
				if(tempList != null){
					for(int j=0; j < tempList.size(); j++){
						pclVO = tempList.get(j);
						pclVO.setPcl_list(pclDao.getPclList(pclVO.getPcl_no()));
					}
				}
			}
		}
		mv.addObject("pclList", pclList);
		mv.addObject("mkrList", mkrList);
		mv.addObject("mainPclName", mainPclName);
		
		return mv;
	}
	
	@RequestMapping(value="/ajax_pro_list.do")
	public ModelAndView ajax_pro_list(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("pro/ajax_pro_main_list");
		
		int total_cnt = 0;
		Map<String, Object> requestMap = new HashMap<>();
		requestMap.put("pro_pcl_no", request.getParameter("pro_pcl_no"));
		requestMap.put("proOrderCode", request.getParameter("proOrderCode"));
		requestMap.put("mkr_no_sy", request.getParameterValues("mkr_no_sy"));
		requestMap.put("pdt_step51_sy", request.getParameterValues("pdt_step51_sy"));
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        TransactionStatus status = transactionManager.getTransaction(def);
		
		CommonUtilsController.setPageSetting(requestMap, request); // 페이징1
		List<ProductVo> pro_list = proDao.getProMainList(requestMap);
		
		if(pro_list != null && pro_list.size() > 0){
			total_cnt = ((ProductVo)pro_list.get(0)).getTot_cont();
			if(total_cnt == -999){
				total_cnt = baseDao.get_found_rows();
			}
			requestMap.put("total_cnt", total_cnt);
		}
		CommonUtilsController.setPageSetting(requestMap, request); // 페이징2
		
		transactionManager.commit(status);
		
		mv.addObject("proMainList", pro_list);
		mv.addObject("total_cnt", total_cnt);
		mv.addObject("orderCode", request.getParameter("proOrderCode"));
		
		return mv;
	}
	
	@RequestMapping(value="/ajax_pro_pclSearch.do")
	public ModelAndView ajax_pro_pclSearch(HttpServletRequest request, HttpServletResponse response){
		
		return ajax_pro_list(request, response);
	}
	
	@RequestMapping(value="/ajax_sct_list.do")
	public ModelAndView ajax_sct_list(@ModelAttribute("sctCommand")Shop_cart sctCommand, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("");
		
		String sct_part = request.getParameter("sct_part");
		List<Shop_cart> sctList = sctDao.getSctList(sctCommand.getSct_mem_no());
		
		SctTotPriceVO sctTotPrivceVo = new SctTotPriceVO();
		int tempPrice = 0;
		for(int i = 0; i<sctList.size(); i++){
			Shop_cart temp = (Shop_cart) sctList.get(i);
			
			temp.setSct_proVO(sctDao.getSctProVo(temp));
			tempPrice = sctTotPrivceVo.getSct_tot_milege() +  temp.getSct_proVO().getPro_tot_milege();
			sctTotPrivceVo.setSct_tot_milege(tempPrice);
			tempPrice = 0;
			tempPrice = sctTotPrivceVo.getSct_tot_disprice() + temp.getSct_proVO().getPro_tot_price();
			sctTotPrivceVo.setSct_tot_disprice(tempPrice);
			tempPrice = 0;
		}
		sctTotPrivceVo = sctDao.getSctTotPrice(sctTotPrivceVo);
		
		String returnUrl = "sct/ajax_sct_list";
		if(sct_part != null && sct_part.equals("1")) returnUrl = "sct/mini_sct_list";
		
		mv.addObject("sctList", sctList);
		mv.addObject("sctTotPrivceVo", sctTotPrivceVo);
		
		mv.setViewName(returnUrl);
		
		return mv;
	}
	
	@RequestMapping(value="/ajax_pro_mainView.do")
	public ModelAndView ajax_pro_mainView(@ModelAttribute("proCom")ProductVo proCom, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("");
		
		ProductVo proVo = proDao.getProVo(proCom.getPro_no());
		
		ProClassVo pclVO = null;
		List<ProClassVo> tempList = null;
		List<ProClassVo> pclList = pclDao.getPclList(proCom.getPro_pcl_no());
		if(pclList != null){
			for(int i=0; i < pclList.size(); i++){
				pclVO = (ProClassVo)pclList.get(i);
				pclVO.setPcl_list(pclDao.getPclList(pclVO.getPcl_no()));
				tempList = pclVO.getPcl_list();
				if(tempList != null){
					for(int j=0; j < tempList.size(); j++){
						ProTempVo proTempVO = new ProTempVo();
						pclVO = (ProClassVo)tempList.get(j);
						pclVO.setPcl_list(pclDao.getPclList(pclVO.getPcl_no()));
						proTempVO.setPdt_name(pclVO.getPcl_no());
						
						proTempVO.setPdt_pro_no(proCom.getPro_no());
						proTempVO = pclDao.getNextPclVo(proTempVO);
						if(proTempVO != null){
							pclVO.setPcl_next_no(proTempVO.getPcl_next_no());
							pclVO.setPcl_next_name(proTempVO.getPcl_next_name());
						}
					}
				}
			}
		}
		
		String returnUrl = "pro/ajax_pro_main_view";
		String view_area = request.getParameter("view_area");
		if(view_area != null && view_area.equals("2")){
			returnUrl = "sct/ajax_pro_dlg_view";
		}
		
		mv.addObject("proVo", proVo);
		mv.addObject("pclList", pclList);
		
		mv.setViewName(returnUrl);
		
		return mv;
	}
	
	@RequestMapping(value="/sct_main_prelist.do")
	public ModelAndView sct_main_prelist(){
		return new ModelAndView("sct/sct_main_list");
	}
	
	@RequestMapping(value="/ajax_sct_insert.do")
	public ModelAndView ajax_sct_insert(@ModelAttribute("sctCommand")Shop_cart sctCommand, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("");
		
		String sct_part = request.getParameter("sct_part");
		
		if(sctCommand.getSct_count() < 1){
			sctCommand.setSct_count(1);
		}
		
		int chk = sctDao.sctInsertChk(sctCommand);
		if(chk == 0) sctDao.sctInsert(sctCommand);
		else sctDao.sctCountUpdate(sctCommand);
		
		String returnUrl = "redirect:/sct_main_prelist.do?dana=sct_main_prelist";
		if(sct_part != null && sct_part.equals("1")) returnUrl = "redirect:/ajax_sct_list.do?dana=ajax_sct_list";
		
		mv.setViewName(returnUrl);
		mv.addObject("sct_part", sct_part);
		mv.addObject("sct_pro_no", sctCommand.getSct_pro_no());
		mv.addObject("sct_mem_no", sctCommand.getSct_mem_no());
		mv.addObject("sct_pro_part", sctCommand.getSct_pro_no());
		
		return mv;
	}
	
	@RequestMapping(value="/ajax_sct_update.do")
	public ModelAndView ajax_sct_update(@ModelAttribute("sctCommand")Shop_cart sctCommand, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("redirect:/ajax_sct_list.do?dana=ajax_sct_list");
		
		sctDao.sctUpdate(sctCommand);
		
		mv.addObject("sct_part", request.getParameter("sct_part"));
		mv.addObject("sct_no", sctCommand.getSct_no());
		mv.addObject("sct_mem_no", sctCommand.getSct_mem_no());
		mv.addObject("sct_count", sctCommand.getSct_count());
		
		return mv;
	}
	
	@RequestMapping(value="/ajax_sct_delete.do")
	public ModelAndView ajax_sct_delete(@ModelAttribute("sctCommand")Shop_cart sctCommand, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("redirect:/ajax_sct_list.do?dana=ajax_sct_list");
		
		sctDao.sctDelete(sctCommand.getSct_no());
		
		mv.addObject("sct_part", request.getParameter("sct_part"));
		mv.addObject("sct_no", sctCommand.getSct_no());
		mv.addObject("sct_mem_no", sctCommand.getSct_mem_no());
		
		return mv;
	}
	
	@RequestMapping(value="/ajax_sct_alldelete.do")
	public ModelAndView ajax_sct_alldelete(@ModelAttribute("sctCommand")Shop_cart sctCommand, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("redirect:/ajax_sct_list.do?dana=ajax_sct_list");
		
		sctDao.sctAllDelete(sctCommand.getSct_mem_no());
		
		mv.addObject("sct_part", request.getParameter("sct_part"));
		mv.addObject("sct_mem_no", sctCommand.getSct_mem_no());
		
		return mv;
	}
	
	@RequestMapping(value="/ajax_sct_multi_insert.do")
	public ModelAndView ajax_sct_multi_insert(@ModelAttribute("sctCommand")Shop_cart sctCommand, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("redirect:/sct_main_prelist.do?dana=sct_main_prelist");
		
		String[] temp = sctCommand.getPst_pro_no();
		String pst_pro_no = "";
		String pst_quantity = "";
		for(int i=0; i<temp.length ; i++){
			Shop_cart temp3 = new Shop_cart();
			pst_pro_no = temp[i];
			pst_quantity = request.getParameter("cnt_" + pst_pro_no);
			temp3.setSct_pro_no(Integer.parseInt(pst_pro_no));
			temp3.setSct_count(Integer.parseInt(pst_quantity));
			temp3.setSct_pro_part(sctCommand.getSct_pro_part());
			temp3.setSct_pro_muti(sctCommand.getSct_pro_muti());
			temp3.setSct_mem_no(sctCommand.getVbl_mem_no());
			
			int chk = sctDao.sctInsertChk(temp3);
			if(chk == 0) sctDao.sctInsert(temp3);
			else sctDao.sctCountUpdate(temp3);
		}
		
		return mv;
	}
	
	@RequestMapping(value="/sct_odr_doc.do")
	public ModelAndView sct_odr_doc(@ModelAttribute("sctCommand")Shop_cart sctCommand, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("sct/odr_doc");
		
		int sctProMuti = sctCommand.getSct_pro_muti();
		List<Shop_cart> sctList = null;
		
		if(sctProMuti == 1){
			sctList = sctDao.getSctList(sctCommand.getSct_mem_no());
		}else if(sctProMuti == 2){
			sctList = new ArrayList<>();
			Shop_cart temp2 = new Shop_cart();
			temp2.setSct_pro_no(sctCommand.getSct_pro_no());
			if(sctCommand.getSct_count() < 1){
				temp2.setSct_count(1);
			}else{
				temp2.setSct_count(sctCommand.getSct_count());
			}
			temp2.setSct_pro_part(sctCommand.getSct_pro_part());
			temp2.setSct_pro_muti(sctProMuti);
			temp2.setSct_mem_no(sctCommand.getSct_mem_no());
			sctList.add(temp2);
		}else if(sctProMuti == 3){
			sctList = new ArrayList<>();
			String[] temp = sctCommand.getPst_pro_no();
			String pst_pro_no = "";
			String pst_quantity = "";
			for(int i=0; i<temp.length ; i++){
				Shop_cart temp3 = new Shop_cart();
				pst_pro_no = temp[i];
				pst_quantity = request.getParameter("cnt_" + pst_pro_no);
				temp3.setSct_pro_no(Integer.parseInt(pst_pro_no));
				temp3.setSct_count(Integer.parseInt(pst_quantity));
				temp3.setSct_pro_part(sctCommand.getSct_pro_part());
				temp3.setSct_pro_muti(sctProMuti);
				temp3.setSct_mem_no(sctCommand.getSct_mem_no());
				sctList.add(temp3);
			}
		}
		
		SctTotPriceVO sctTotPrivceVo = new SctTotPriceVO();
		int tempPrice = 0;
		for(int i = 0; i<sctList.size(); i++){
			Shop_cart temp = (Shop_cart) sctList.get(i);
			
			temp.setSct_proVO(sctDao.getSctProVo(temp));
			tempPrice = sctTotPrivceVo.getSct_tot_milege() +  temp.getSct_proVO().getPro_tot_milege();
			sctTotPrivceVo.setSct_tot_milege(tempPrice);
			tempPrice = 0;
			tempPrice = sctTotPrivceVo.getSct_tot_disprice() + temp.getSct_proVO().getPro_tot_price();
			sctTotPrivceVo.setSct_tot_disprice(tempPrice);
			tempPrice = 0;
		}
		sctTotPrivceVo = sctDao.getSctTotPrice(sctTotPrivceVo);
		
		SctTotPriceVO userMil = sctDao.getMemMilege(sctCommand.getSct_mem_no());
		
		mv.addObject("sctList", sctList);
		mv.addObject("sctTotPrivceVo", sctTotPrivceVo);
		mv.addObject("myCoupon", null);		
		mv.addObject("userMil", userMil);		
		mv.addObject("sctProMuti", sctProMuti);		
		mv.addObject("odr_vbj_no", request.getParameter("odr_vbj_no"));		
		
		return mv;
	}
	
	@RequestMapping(value="/odr_doc.do")
	public ModelAndView odr_doc(@ModelAttribute("doc")OdrDocVo doc, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		doc.setOdr_condition(1);
		
		String[] s_pro_no = request.getParameterValues("s_pro_no");
		int[] s_pro_no_i = new int[s_pro_no.length];
		for(int i = 0; i<s_pro_no.length; i++){
			s_pro_no_i[i] = Integer.parseInt(s_pro_no[i]);
		}
		doc.setS_pro_no(s_pro_no_i);
		
		String[] s_odt_count = request.getParameterValues("s_odt_count");
		int[] s_odt_count_i = new int[s_pro_no.length];
		for(int i = 0; i<s_odt_count.length; i++){
			s_odt_count_i[i] = Integer.parseInt(s_odt_count[i]);
		}
		doc.setS_odt_count(s_odt_count_i);
		
		String[] s_pro_disprice = request.getParameterValues("s_pro_disprice");
		int[] s_pro_disprice_i = new int[s_pro_no.length];
		for(int i = 0; i<s_pro_disprice.length; i++){
			s_pro_disprice_i[i] = Integer.parseInt(s_pro_disprice[i]);
		}
		doc.setS_pro_disprice(s_pro_disprice_i);
		
		String[] s_pro_milege = request.getParameterValues("s_pro_milege");
		int[] s_pro_milege_i = new int[s_pro_no.length];
		for(int i = 0; i<s_pro_milege.length; i++){
			s_pro_milege_i[i] = Integer.parseInt(s_pro_milege[i]);
		}
		doc.setS_pro_milege(s_pro_milege_i);
		
		String[] s_odt_pro_part = request.getParameterValues("s_odt_pro_part");
		int[] s_odt_pro_part_i = new int[s_pro_no.length];
		for(int i = 0; i<s_odt_pro_part.length; i++){
			s_odt_pro_part_i[i] = Integer.parseInt(s_odt_pro_part[i]);
		}
		doc.setS_odt_pro_part(s_odt_pro_part_i);
		
		String odr_no_max = sctDao.getOdrMaxNo();
		doc.setOdr_no_max(odr_no_max);
		
		sctDao.odrInsert(doc);
		
		String del_no_max = sctDao.getDlvMaxNo();
		doc.setDel_no_max(del_no_max);
		
		sctDao.dlvInsert(doc);
		
		for(int i=0; i < doc.getS_pro_no().length; i++){
			OdrDet odtVo = new OdrDet(); 
			odtVo.setS_pro_no(doc.getS_pro_no()[i]);
			odtVo.setS_odt_count(doc.getS_odt_count()[i]);
			odtVo.setS_pro_disprice(doc.getS_pro_disprice()[i]);
			odtVo.setS_pro_milege(doc.getS_pro_milege()[i]);
			odtVo.setS_odt_pro_part(doc.getS_odt_pro_part()[i]);
			odtVo.setOdr_no_max(odr_no_max);
			odtVo.setDel_no_max(del_no_max);
			sctDao.odtInsert(odtVo);
			
			Map<String, Object> stockcount_map = new HashMap<>();
			stockcount_map.put("s_pro_no", doc.getS_pro_no()[i]);
			stockcount_map.put("s_count", doc.getS_odt_count()[i]);
			sctDao.proCountUpdate(stockcount_map);
		}
		
		sctDao.editMileage(doc);
		
		sctDao.memMilAdd(doc);
		
		// 장바구니 초기화
		if(doc.getSct_pro_muti() == 1){
			sctDao.sctAllDelete(doc.getMem_no());
		}
		
		//String returnUrl = "sct/odr_result.jsp?odr_no_max="+odr_no_max;
		
		mv.setViewName("sct/odr_result");
		mv.addObject("odr_no_max", odr_no_max);
		
		return mv;
	}
	
	@RequestMapping(value="/orders_list.do")
	public ModelAndView orders_list(){
		return new ModelAndView("sct/orders_list");
	}
	
	@RequestMapping(value="/ajax_orders_list.do")
	public ModelAndView ajax_orders_list(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		
		String reurl = request.getParameter("reurl");
		
		int total_cnt = 0;
		Map<String, Object> requestMap = new HashMap<>();
		if(reurl == null || !reurl.equals("admin")){
			requestMap.put("ord_mem_no", request.getParameter("ord_mem_no"));
		}
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        TransactionStatus status = transactionManager.getTransaction(def);
		
		CommonUtilsController.setPageSetting(requestMap, request); // 페이징1
		List<MpVo> orders_list = sctDao.getOrdersList(requestMap);
		
		if(orders_list != null && orders_list.size() > 0){
			total_cnt = ((MpVo)orders_list.get(0)).getTot_cont();
			if(total_cnt == -999){
				total_cnt = baseDao.get_found_rows();
			}
			requestMap.put("total_cnt", total_cnt);
		}
		CommonUtilsController.setPageSetting(requestMap, request); // 페이징2
		
		transactionManager.commit(status);
		
		mv.addObject("orders_list", orders_list);
		mv.addObject("total_cnt", total_cnt);
		
		String returnUrl = "sct/ajax_orders_list";
		if(reurl != null && reurl.equals("admin")) returnUrl = "sct/ajax_orders_admin_list";
		
		mv.setViewName(returnUrl);
		
		return mv;
	}
	
	@RequestMapping(value="/orders_det_list.do")
	public ModelAndView orders_det_list(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("sct/orders_det_list");
		
		String odr_no = request.getParameter("odr_no");
		MpVo mpCommand = sctDao.getOrdersDetList(odr_no);
		
		List<Shop_cart> odtList = sctDao.getOdcOdtList(odr_no);
		
		SctTotPriceVO sctTotPrivceVo = new SctTotPriceVO();
		int tempPrice = 0;
		for(int i = 0; i<odtList.size(); i++){
			Shop_cart temp = (Shop_cart) odtList.get(i);
			
			temp.setSct_proVO(sctDao.getSctProVo(temp));
			tempPrice = sctTotPrivceVo.getSct_tot_milege() +  temp.getSct_proVO().getPro_tot_milege();
			sctTotPrivceVo.setSct_tot_milege(tempPrice);
			tempPrice = 0;
			tempPrice = sctTotPrivceVo.getSct_tot_disprice() + temp.getSct_proVO().getPro_tot_price();
			sctTotPrivceVo.setSct_tot_disprice(tempPrice);
			tempPrice = 0;
		}
		sctTotPrivceVo = sctDao.getSctTotPrice(sctTotPrivceVo);
		
		mv.addObject("odtList", odtList);
		mv.addObject("sctTotPrivceVo", sctTotPrivceVo);
		mv.addObject("mpCommand", mpCommand);
		
		return mv;
	}
	
	@RequestMapping(value="/orders_admin_list.do")
	public ModelAndView orders_admin_list(){
		return new ModelAndView("sct/orders_admin_list");
	}
	
	@RequestMapping(value="/ajax_orders_admin_list.do")
	public ModelAndView ajax_orders_admin_list(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		
		String reurl = request.getParameter("reurl");
		
		int total_cnt = 0;
		Map<String, Object> requestMap = new HashMap<>();
		if(reurl == null || !reurl.equals("admin")){
			requestMap.put("ord_mem_no", request.getParameter("ord_mem_no"));
		}
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        TransactionStatus status = transactionManager.getTransaction(def);
		
		CommonUtilsController.setPageSetting(requestMap, request); // 페이징1
		List<MpVo> orders_list = sctDao.getOrdersList(requestMap);
		
		if(orders_list != null && orders_list.size() > 0){
			total_cnt = ((MpVo)orders_list.get(0)).getTot_cont();
			if(total_cnt == -999){
				total_cnt = baseDao.get_found_rows();
			}
			requestMap.put("total_cnt", total_cnt);
		}
		CommonUtilsController.setPageSetting(requestMap, request); // 페이징2
		
		transactionManager.commit(status);
		
		mv.addObject("orders_list", orders_list);
		mv.addObject("total_cnt", total_cnt);
		
		String returnUrl = "sct/ajax_orders_list";
		if(reurl != null && reurl.equals("admin")) returnUrl = "sct/ajax_orders_admin_list";
		
		mv.setViewName(returnUrl);
		
		return mv;
	}
	
	@RequestMapping(value="/orders_admin_det_list.do")
	public ModelAndView orders_admin_det_list(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("sct/orders_admin_det_list");
		
		String odr_no = request.getParameter("odr_no");
		MpVo mpCommand = sctDao.getOrdersDetList(odr_no);
		
		List<Shop_cart> odtList = sctDao.getOdcOdtList(odr_no);
		
		SctTotPriceVO sctTotPrivceVo = new SctTotPriceVO();
		int tempPrice = 0;
		for(int i = 0; i<odtList.size(); i++){
			Shop_cart temp = (Shop_cart) odtList.get(i);
			
			temp.setSct_proVO(sctDao.getSctProVo(temp));
			tempPrice = sctTotPrivceVo.getSct_tot_milege() +  temp.getSct_proVO().getPro_tot_milege();
			sctTotPrivceVo.setSct_tot_milege(tempPrice);
			tempPrice = 0;
			tempPrice = sctTotPrivceVo.getSct_tot_disprice() + temp.getSct_proVO().getPro_tot_price();
			sctTotPrivceVo.setSct_tot_disprice(tempPrice);
			tempPrice = 0;
		}
		sctTotPrivceVo = sctDao.getSctTotPrice(sctTotPrivceVo);
		
		mv.addObject("odtList", odtList);
		mv.addObject("sctTotPrivceVo", sctTotPrivceVo);
		mv.addObject("mpCommand", mpCommand);
		
		return mv;
	}
	
	@RequestMapping(value="/odr_condition.do")
	public ModelAndView odr_condition(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("redirect:/orders_admin_det_list.do?dana=orders_admin_det_list&reurl=admin");
		
		OdrDocVo doc = new OdrDocVo();
		doc.setOdr_no(request.getParameter("odr_no"));
		doc.setOdr_condition(Integer.parseInt(request.getParameter("odr_condition")));
		
		sctDao.conditionUpdate(doc);
		
		mv.addObject("odr_no", request.getParameter("odr_no"));
		
		return mv;
	}
	
	@RequestMapping(value="/mem_preUpdate.do")
	public ModelAndView mem_preUpdate(){
		return new ModelAndView("pcl/mem_update");
	}

}
