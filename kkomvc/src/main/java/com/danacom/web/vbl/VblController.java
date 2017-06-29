package com.danacom.web.vbl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.danacom.mybatis.pro.MemComVo;
import com.danacom.mybatis.pro.ProDao;
import com.danacom.mybatis.pro.ProductVo;
import com.danacom.mybatis.pro.Shop_cart;
import com.danacom.mybatis.vbl.BtlVo;
import com.danacom.mybatis.vbl.VbbVo;
import com.danacom.mybatis.vbl.VblDao;
import com.danacom.mybatis.vbl.VblDetVo;
import com.danacom.mybatis.vbl.VbsVo;
import com.danacom.mybatis.vbl.VirBillVo;
import com.danacom.util.CommonUtilsController;

@Controller
public class VblController {
	@Autowired private VblDao vblDao;
	@Autowired private BaseDao baseDao;
	@Autowired private PclDao pclDao;
	@Autowired private MkrDao mkrDao;
	@Autowired private ProDao proDao; 
	@Autowired private PlatformTransactionManager transactionManager;
	
	public void setVblDao(VblDao vblDao) {
		this.vblDao = vblDao;
	}
	public VblDao getVblDao() {
		return vblDao;
	}
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	public BaseDao getBaseDao() {
		return baseDao;
	}
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
	public void setTransactionManager(PlatformTransactionManager transactionManager) {
		this.transactionManager = transactionManager;
	}
	public PlatformTransactionManager getTransactionManager() {
		return transactionManager;
	}
	
	@RequestMapping(value="/vbl_main_prelist.do")
	public ModelAndView vbl_main_prelist(){
		return new ModelAndView("vbl/vbl_list");
	}
	
	@RequestMapping(value="/ajax_vbl_list.do")
	public ModelAndView ajax_vbl_list(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("vbl/ajax_vbl_list");
		
		int total_cnt = 0;
		Map<String, Object> requestMap = new HashMap<>();
		requestMap.put("vbl_mem_no", request.getParameter("vbl_mem_no"));
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        TransactionStatus status = transactionManager.getTransaction(def);
		
		CommonUtilsController.setPageSetting(requestMap, request); // 페이징1
		List<VirBillVo> vbl_list = vblDao.getVblList(requestMap);
		
		if(vbl_list != null && vbl_list.size() > 0){
			total_cnt = ((VirBillVo)vbl_list.get(0)).getTot_cont();
			if(total_cnt == -999){
				total_cnt = baseDao.get_found_rows();
			}
			requestMap.put("total_cnt", total_cnt);
		}
		CommonUtilsController.setPageSetting(requestMap, request); // 페이징2
		
		transactionManager.commit(status);
		
		mv.addObject("pro_list", vbl_list);
		mv.addObject("total_cnt", total_cnt);
		
		return mv;
	}
	
	@RequestMapping(value="/ajax_vbl_preInsert.do")
	public ModelAndView ajax_vbl_preInsert(){
		return new ModelAndView("vbl/vbl_insert");
	}
	
	@RequestMapping(value="/ajax_vbl_inMkrPcl.do")
	public ModelAndView ajax_vbl_inMkrPcl(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("vbl/ajax_vbl_inMkrPcl");
		
		String pcl_no = request.getParameter("pcl_no");
		ProductVo proCommand = new ProductVo();
		proCommand.setPro_pcl_no(pcl_no);
		
		String mainPclName = pclDao.getMainPclName(pcl_no);
		
		List<MakerVo> mkrList = mkrDao.getMkrList(pcl_no);
		
		ProClassVo pclVO = null;
		List<ProClassVo> tempList = null;
		List<ProClassVo> pclList = pclDao.getPclList(pcl_no);
		if(pclList != null){
			for(int i=0; i < pclList.size(); i++){
				pclVO = (ProClassVo)pclList.get(i);
				pclVO.setPcl_list(pclDao.getPclList(pclVO.getPcl_no()));
				tempList = pclVO.getPcl_list();
				if(tempList != null){
					for(int j=0; j < tempList.size(); j++){
						pclVO = (ProClassVo)tempList.get(j);
						pclVO.setPcl_list(pclDao.getPclList(pclVO.getPcl_no()));
					}
				}
			}
		}
		
		mv.addObject("pclList", pclList);
		mv.addObject("mkrList", mkrList);
		mv.addObject("mainPclName", mainPclName);
		mv.addObject("mainPclNo", pcl_no);
		
		return mv;
	}
	
	@RequestMapping(value="/ajax_vbl_inProList.do")
	public ModelAndView ajax_vbl_inProList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("vbl/ajax_vbl_inProList");
		
		String pcl_no = request.getParameter("pcl_no");
		String maker = request.getParameter("maker");
		String searchValue = request.getParameter("searchValue");
		String[] mkr_no_sy = null;
		String[] pdt_step51_sy = null;
		
		int total_cnt = 0;
		Map<String, Object> requestMap = new HashMap<>();
		requestMap.put("pro_pcl_no", request.getParameter("pcl_no"));
		requestMap.put("proOrderCode", request.getParameter("proOrderCode"));
		
		if(maker != null && !"0".equals(maker)){
			mkr_no_sy = new String[1];
			mkr_no_sy[0] = maker;
		}
		
		List<String> tempSetp = new ArrayList<>();
		String[] temp2 = request.getParameterValues("search_pcl_no");
		if(temp2 != null){
			for(int i=0; i<temp2.length; i++){
				if(!temp2[i].equals("0")) tempSetp.add(temp2[i]);
			}
			if(tempSetp.size() > 0){
				String[] temp3 = new String[tempSetp.size()]; 
				for(int j=0; j<tempSetp.size(); j++){
					temp3[j] = (String) tempSetp.get(j);
				}
				pdt_step51_sy = temp3;
			}
		}
		requestMap.put("mkr_no_sy", mkr_no_sy);
		requestMap.put("pdt_step51_sy", pdt_step51_sy);
		requestMap.put("searchValue", searchValue);
		
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
		mv.addObject("mainPclNo", pcl_no);
		mv.addObject("total_cnt", total_cnt);
		mv.addObject("orderCode", request.getParameter("proOrderCode"));
		
		return mv;
	}		
	
	@RequestMapping(value="/ajax_vbl_insert.do")
	public ModelAndView ajax_vbl_insert(@ModelAttribute("vblCommand")VirBillVo vblCommand, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("redirect:/vbl_main_prelist.do?dana=vbl_main_prelist");
		
		int vblMaxNo= vblDao.getVblMaxNo();
		vblCommand.setVbl_no(vblMaxNo);
		
		vblDao.vblInsert(vblCommand);
		
		VblDetVo vdtCommand = new VblDetVo();
		String[] temp = vblCommand.getPst_pro_no();
		String pst_pro_no = "";
		String pst_quantity = "";
		for(int i=0; i<temp.length ; i++){
			pst_pro_no = temp[i];
			pst_quantity = request.getParameter("cnt_" + pst_pro_no);
			vdtCommand.setVdt_pro_no(Integer.parseInt(pst_pro_no));
			vdtCommand.setVdt_quantity(Integer.parseInt(pst_quantity));
			vdtCommand.setVdt_vbl_no(vblMaxNo);
			vblDao.vdtInsert(vdtCommand);
		}
		
		return mv;
	}		
	
	@RequestMapping(value="/vbl_view.do")
	public ModelAndView vbl_view(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("vbl/vbl_view");
		
		VirBillVo vblCommand = new VirBillVo();
		vblCommand.setVbl_no(Integer.parseInt(request.getParameter("vbl_no")));
		
		VirBillVo vblVo = vblDao.getVblVo(vblCommand.getVbl_no());
		int totPrice = 0;
		 
		List<ProClassVo> pptPclList = pclDao.getPclList("NULL");
		for(int i=0; i < pptPclList.size(); i++){
			if(i > 1) break;
			ProClassVo pclVO = (ProClassVo)pptPclList.get(i);
			pclVO.setPcl_list(pclDao.getPclList(pclVO.getPcl_no()));
			for(int j=0; j<pclVO.getPcl_list().size(); j++){
				ProClassVo pclVO2 = (ProClassVo)pclVO.getPcl_list().get(j);
				pclVO2.setPpt_no(vblCommand.getVbl_no());
				pclVO2.setProVO(vblDao.getvVblProVo(pclVO2));
				if(pclVO2.getProVO() != null){
					totPrice += (pclVO2.getProVO().getPro_disprice()*pclVO2.getProVO().getPst_quantity());
				}
			}
		}
		
		mv.addObject("vblVo", vblVo);
		mv.addObject("pptPclList", pptPclList);
		mv.addObject("totPrice", totPrice);
		
		return mv;
	}
	
	@RequestMapping(value="/ajax_vbl_update.do")
	public ModelAndView ajax_vbl_update(@ModelAttribute("vblCommand")VirBillVo vblCommand, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("redirect:/vbl_main_prelist.do?dana=vbl_main_prelist");
		
		int vblMaxNo= vblCommand.getVbl_no();
		vblCommand.setVbl_bor_answer("N");
		
		vblDao.vblUpdate(vblCommand);
		
		vblDao.vdtDelete(vblMaxNo);
		
		VblDetVo vdtCommand = new VblDetVo();
		String[] temp = vblCommand.getPst_pro_no();
		String pst_pro_no = "";
		String pst_quantity = "";
		for(int i=0; i<temp.length ; i++){
			pst_pro_no = temp[i];
			pst_quantity = request.getParameter("cnt_" + pst_pro_no);
			vdtCommand.setVdt_pro_no(Integer.parseInt(pst_pro_no));
			vdtCommand.setVdt_quantity(Integer.parseInt(pst_quantity));
			vdtCommand.setVdt_vbl_no(vblMaxNo);
			vblDao.vdtInsert(vdtCommand);
		}
		
		return mv;
	}
	
	@RequestMapping(value="/ajax_vbl_delete.do")
	public ModelAndView ajax_vbl_delete(@ModelAttribute("vblCommand")VirBillVo vblCommand, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("redirect:/vbl_main_prelist.do?dana=vbl_main_prelist");
		
		int vblMaxNo= vblCommand.getVbl_no();
			
		vblDao.vdtDelete(vblMaxNo);
		
		vblDao.vblDelete(vblMaxNo);
	
		return mv;
	}
	
	@RequestMapping(value="/ajax_vbb_insert.do")
	public ModelAndView ajax_vbb_insert(@ModelAttribute("vblCommand")VirBillVo vblCommand, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("redirect:/vbb_prelist.do?dana=vbb_prelist");	
		
		int vblMaxNo= vblCommand.getVbl_no();
		int vbbMaxNo = vblDao.getVbbMaxNo();
		vblCommand.setVbb_no(vbbMaxNo);
		
		vblCommand.setVbl_bor_answer("Y");
		
		vblDao.vblUpdate(vblCommand);
		vblDao.vbbInsert(vblCommand);
		
		vblDao.vdtDelete(vblMaxNo);
		
		VblDetVo vdtCommand = new VblDetVo();
		String[] temp = vblCommand.getPst_pro_no();
		String pst_pro_no = "";
		String pst_quantity = "";
		for(int i=0; i<temp.length ; i++){
			pst_pro_no = temp[i];
			pst_quantity = request.getParameter("cnt_" + pst_pro_no);
			vdtCommand.setVdt_pro_no(Integer.parseInt(pst_pro_no));
			vdtCommand.setVdt_quantity(Integer.parseInt(pst_quantity));
			vdtCommand.setVdt_vbl_no(vblMaxNo);
			vdtCommand.setVds_vbb_no(vbbMaxNo);
			int res = vblDao.vdtInsert(vdtCommand);
			int res2 =vblDao.vdsInsert(vdtCommand);
		} 
	
		return mv;
	}
	
	@RequestMapping(value="/vbb_prelist.do")
	public ModelAndView vbb_prelist(){
		return new ModelAndView("vbl/vbb_list");
	}
	
	@RequestMapping(value="/ajax_vbb_list.do")
	public ModelAndView ajax_vbb_list(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		
		String reurl = request.getParameter("reurl");
		
		int total_cnt = 0;
		Map<String, Object> requestMap = new HashMap<>();
		requestMap.put("vbb_mem_no", request.getParameter("vbb_mem_no"));
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        TransactionStatus status = transactionManager.getTransaction(def);
		
		CommonUtilsController.setPageSetting(requestMap, request); // 페이징1
		List<VbbVo> vbb_list = vblDao.getVbbList(requestMap);
		
		if(vbb_list != null && vbb_list.size() > 0){
			total_cnt = ((VbbVo)vbb_list.get(0)).getTot_cont();
			if(total_cnt == -999){
				total_cnt = baseDao.get_found_rows();
			}
			requestMap.put("total_cnt", total_cnt);
		}
		CommonUtilsController.setPageSetting(requestMap, request); // 페이징2
		
		transactionManager.commit(status);
		
		request.setAttribute("pro_list", vbb_list);
		request.setAttribute("total_cnt", total_cnt);
		
		String returnUrl = "vbl/ajax_vbb_list";
		if(reurl != null && reurl.equals("admin")) returnUrl = "vbl/ajaxVbbList";
		
		mv.setViewName(returnUrl);
		
		return mv;
	}
	
	@RequestMapping(value="/vbb_view.do")
	public ModelAndView vbb_view(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		
		String reurl = request.getParameter("reurl");
		
		VbbVo vbb_Command = new VbbVo();
		vbb_Command.setVbb_no(request.getParameter("vbb_no"));
		
		if(reurl == null || "".equals(reurl)){
			vblDao.countUpVbbContent(vbb_Command);
		}
		VbbVo vbbContent = vblDao.getVbbContent(vbb_Command);
		List<VbsVo> vbbProList = vblDao.getVbbContentPro(vbb_Command);
		mv.addObject("vbbContent", vbbContent);
		mv.addObject("vbbProList", vbbProList);
		
		if(reurl == null || "".equals(reurl)){
			List<VbbVo> vbrList = vblDao.getVbrList(vbb_Command);
			for (VbbVo vbr_command : vbrList) {
				MemComVo loginCommand= (MemComVo)request.getSession().getAttribute("login");
				if(vbr_command.getVbr_content() != null){
					if(loginCommand == null || !loginCommand.getMem_id().equals(vbr_command.getMem_id())){
						vbr_command.setVbr_content(vbr_command.getVbr_content().replace("\r\n", "<br />"));
					}
				}
			}
			mv.addObject("vbrList", vbrList);
		}
		
		String returnUrl = "vbl/vbb_view";
		if(reurl != null && reurl.equals("btl")) returnUrl = "vbl/ajaxVbbRead";
		
		mv.setViewName(returnUrl);
		
		return mv;
	}
	
	@RequestMapping(value="/vbb_reply_insert.do")
	public ModelAndView vbb_reply_insert(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("redirect:/vbb_view.do?dana=vbb_view");
		
		VbbVo vbb_Command = new VbbVo();
		vbb_Command.setVbb_no(request.getParameter("vbb_no"));
		vbb_Command.setVbr_content(request.getParameter("vbr_content"));
		MemComVo loginCommand= (MemComVo)request.getSession().getAttribute("login");
		vbb_Command.setMem_no(loginCommand.getMem_no()+"");
		
		vblDao.replyInsert(vbb_Command);
		
		mv.addObject("vbb_no", request.getParameter("vbb_no"));
		
		return mv;
	}		
	
	@RequestMapping(value="/vbb_reply_update.do")
	public ModelAndView vbb_reply_update(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("redirect:/vbb_view.do?dana=vbb_view");
		
		VbbVo vbb_Command = new VbbVo();
		vbb_Command.setVbr_no(request.getParameter("vbr_no"));
		vbb_Command.setVbb_no(request.getParameter("vbb_no"));
		vbb_Command.setVbr_content(request.getParameter("vbr_content"));
		
		vblDao.replyUpdate(vbb_Command);
		
		mv.addObject("vbr_no", request.getParameter("vbr_no"));
		mv.addObject("vbb_no", request.getParameter("vbb_no"));
		
		return mv;
	}		
	
	@RequestMapping(value="/vbb_reply_delete.do")
	public ModelAndView vbb_reply_delete(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("redirect:/vbb_view.do?dana=vbb_view");
		
		VbbVo vbb_Command = new VbbVo();
		vbb_Command.setVbr_no(request.getParameter("vbr_no"));
		vbb_Command.setVbb_no(request.getParameter("vbb_no"));
		
		vblDao.replyDelete(vbb_Command);
		
		mv.addObject("vbr_no", request.getParameter("vbr_no"));
		mv.addObject("vbb_no", request.getParameter("vbb_no"));
		
		return mv;
	}		
	
	@RequestMapping(value="/vbb_recomm.do")
	public ModelAndView vbb_recomm(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("vbl/vbb_view");
		
		VbbVo vbb_Command = new VbbVo();
		vbb_Command.setVbb_no(request.getParameter("vbb_no"));
		
		vblDao.recommVbbContent(vbb_Command);
		VbbVo vbbContent = vblDao.getVbbContent(vbb_Command);
		List<VbsVo> vbbProList = vblDao.getVbbContentPro(vbb_Command);
		List<VbbVo> vbrList = vblDao.getVbrList(vbb_Command);
		request.setAttribute("vbbContent", vbbContent);
		request.setAttribute("vbbProList", vbbProList);
		for (VbbVo vbr_command : vbrList) {
			MemComVo loginCommand= (MemComVo)request.getSession().getAttribute("login");
			if(vbr_command.getVbr_content() != null){
				if(loginCommand == null || !loginCommand.getMem_id().equals(vbr_command.getMem_id())){
					vbr_command.setVbr_content(vbr_command.getVbr_content().replace("\r\n", "<br />"));
				}
			}
		}
		mv.addObject("vbrList", vbrList);
	
		return mv;
	}	
	
	@RequestMapping(value="/btl_admin_list.do")
	public ModelAndView btl_admin_list(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		
		String reurl = request.getParameter("reurl");
		
		int total_cnt = 0;
		Map<String, Object> requestMap = new HashMap<>();
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        TransactionStatus status = transactionManager.getTransaction(def);
		
		CommonUtilsController.setPageSetting(requestMap, request); // 페이징1
		List<BtlVo> btlList = vblDao.getBtlList(requestMap);
		
		if(btlList != null && btlList.size() > 0){
			total_cnt = ((BtlVo)btlList.get(0)).getTot_cont();
			if(total_cnt == -999){
				total_cnt = baseDao.get_found_rows();
			}
			requestMap.put("total_cnt", total_cnt);
		}
		CommonUtilsController.setPageSetting(requestMap, request); // 페이징2
		
		transactionManager.commit(status);
		
		mv.addObject("btlList", btlList);
		mv.addObject("total_cnt", total_cnt);
		
		String returnUrl = "vbl/btl_admin_list";
		if(reurl != null && reurl.equals("main")) returnUrl = "vbl/btl_main_list";
		
		mv.setViewName(returnUrl);
		
		return mv;
	}			
	
	@RequestMapping(value="/btl_admin_preInsert.do")
	public ModelAndView btl_admin_preInsert(){
		return new ModelAndView("vbl/btl_admin_insert");
	}
	
	@RequestMapping(value="/btl_admin_insert.do")
	public ModelAndView btl_admin_insert(@ModelAttribute("btl_Command")BtlVo btl_Command, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("redirect:/btl_admin_list.do?dana=btl_admin_list");
		
		vblDao.btlInsert(btl_Command);
		
		return mv;
	}		
	
	@RequestMapping(value="/btlDetList.do")
	public ModelAndView btlDetList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		
		String reurl = request.getParameter("reurl");
		
		BtlVo btl_Command = new BtlVo();
		btl_Command.setBtl_no(request.getParameter("btl_no"));
		
		BtlVo btl = vblDao.getBtlView(btl_Command);
		List<BtlVo> btlDetList = vblDao.getBtlDetList(btl_Command);
		
		mv.addObject("btl", btl);
		mv.addObject("btlDetList", btlDetList);
		
		String returnUrl = "vbl/btl_det_list";
		if(reurl != null && reurl.equals("admin")) returnUrl = "vbl/ajaxBtlJoinList";
		if(reurl != null && reurl.equals("main")) returnUrl = "vbl/ajaxBtlJoinList_main";
		
		mv.setViewName(returnUrl);
		
		return mv;
	}		
	
	@RequestMapping(value="/btlDetPrejoin.do")
	public ModelAndView btlDetPrejoin(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		
		String reurl = request.getParameter("reurl");
		
		BtlVo btl_Command = new BtlVo();
		btl_Command.setBtl_no(request.getParameter("btl_no"));
		
		BtlVo btl = vblDao.getBtlView(btl_Command);
		
		mv.addObject("btl", btl);
		mv.addObject("cs_date_chk", btl.getCs_date_chk());
		
		String returnUrl = "vbl/btlDetPrejoin";
		if(reurl != null && reurl.equals("main")) returnUrl = "vbl/btlDetPrejoin_main";
		
		mv.setViewName(returnUrl);
		
		return mv;
	}
	
	@RequestMapping(value="/ajaxVbbList.do")
	public ModelAndView ajaxVbbList(HttpServletRequest request, HttpServletResponse response){
		return ajax_vbb_list(request, response);
	}
	
	@RequestMapping(value="/ajaxBtlDetList.do")
	public ModelAndView ajaxBtlDetList(HttpServletRequest request, HttpServletResponse response){
		return btlDetList(request, response);
	}
	
	@RequestMapping(value="/btl_main_list.do")
	public ModelAndView btl_main_list(HttpServletRequest request, HttpServletResponse response){
		return btl_admin_list(request, response);
	}
	
	@RequestMapping(value="/ajaxVbbRead.do")
	public ModelAndView ajaxVbbRead(HttpServletRequest request, HttpServletResponse response){
		return vbb_view(request, response);
	}
	
	@RequestMapping(value="/ajaxBtlDetJoin.do")
	public ModelAndView ajaxBtlDetJoin(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		
		String reurl = request.getParameter("reurl");
		
		BtlVo btl_Command = new BtlVo();
		btl_Command.setVbb_no(request.getParameter("vbb_no"));
		btl_Command.setBtl_no(request.getParameter("btl_no"));
		
		int vbjMaxNo = vblDao.getVbjMaxNo();
		btl_Command.setVbj_no(vbjMaxNo+"");
		
		vblDao.answerVbbUpdate(btl_Command);
		vblDao.vbjInsert(btl_Command);

		List<BtlVo> vds_no_list = vblDao.getVdsNoList(btl_Command);
		for (BtlVo vo : vds_no_list) {
			btl_Command.setVbd_no(vo.getVds_no());
			btl_Command.setVbd_quantity(vo.getVds_quantity());
			btl_Command.setVbd_pro_no(vo.getVbd_pro_no());
			vblDao.vbdInsert(btl_Command);
		}
		
		String returnUrl = "redirect:/ajaxBtlDetList.do?dana=ajaxBtlDetList&reurl=main";
		if(reurl != null && reurl.equals("admin")) returnUrl = "redirect:/ajaxBtlDetList.do?dana=ajaxBtlDetList&reurl=admin";
		
		mv.setViewName(returnUrl);
		mv.addObject("vbb_no", request.getParameter("vbb_no"));
		mv.addObject("btl_no", request.getParameter("btl_no"));
		
		return mv;
	}		
	
	@RequestMapping(value="/ajaxBtlJoinDetList.do")
	public ModelAndView ajaxBtlJoinDetList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		
		String reurl = request.getParameter("reurl");
		
		BtlVo btl_Command = new BtlVo();
		btl_Command.setVbj_no(request.getParameter("vbj_no"));
		
		BtlVo btlJoinContent = vblDao.getBtlJoinContent(btl_Command);
		List<BtlVo> btlJoinDetList = vblDao.getBtlJoinDetList(btl_Command);
		mv.addObject("btlJoinContent", btlJoinContent);
		mv.addObject("btlJoinDetList", btlJoinDetList);
		
		String returnUrl = "vbl/ajaxBtlJoinDetList";
		if(reurl != null && reurl.equals("main")) returnUrl = "vbl/ajaxBtlJoinDetList_main";
		
		mv.setViewName(returnUrl);
		
		return mv;
	}		
	
	@RequestMapping(value="/ajaxBtlDetUnjoin.do")
	public ModelAndView ajaxBtlDetUnjoin(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		
		String reurl = request.getParameter("reurl");
		
		BtlVo btl_Command = new BtlVo();
		btl_Command.setVbj_no(request.getParameter("vbj_no"));
		btl_Command.setBtl_no(request.getParameter("btl_no"));
		
		vblDao.vbdDelete(btl_Command);
		vblDao.vbjDelete(btl_Command);
		
		String returnUrl = "redirect:/ajaxBtlDetList.do?dana=ajaxBtlDetList&reurl=main";
		if(reurl != null && reurl.equals("admin")) returnUrl = "redirect:/ajaxBtlDetList.do?dana=ajaxBtlDetList&reurl=admin";
		
		mv.setViewName(returnUrl);
		mv.addObject("vbj_no", request.getParameter("vbj_no"));
		mv.addObject("btl_no", request.getParameter("btl_no"));
		
		return mv;
	}		
	
	@RequestMapping(value="/ajaxBtlJoinDowngrade.do")
	public ModelAndView ajaxBtlJoinDowngrade(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		
		String reurl = request.getParameter("reurl");
		
		BtlVo btl_Command = new BtlVo();
		btl_Command.setVbj_no(request.getParameter("vbj_no"));
		btl_Command.setBtl_no(request.getParameter("btl_no"));
		btl_Command.setVbj_title(request.getParameter("vbj_title"));
		
		vblDao.gradeVbjUpdate(btl_Command);
		
		String returnUrl = "redirect:/ajaxBtlDetList.do?dana=ajaxBtlDetList&reurl=main";
		if(reurl != null && reurl.equals("admin")) returnUrl = "redirect:/ajaxBtlDetList.do?dana=ajaxBtlDetList&reurl=admin";
		
		mv.setViewName(returnUrl);
		mv.addObject("vbj_no", request.getParameter("vbj_no"));
		mv.addObject("btl_no", request.getParameter("btl_no"));
		
		return mv;
	}
	
}
