package com.danacom.web.pro;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.danacom.mybatis.base.BaseDao;
import com.danacom.mybatis.mkr.MakerVo;
import com.danacom.mybatis.mkr.MkrDao;
import com.danacom.mybatis.pcl.PclDao;
import com.danacom.mybatis.pcl.ProClassVo;
import com.danacom.mybatis.pro.ProDao;
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
	
	@RequestMapping(value="/pro_main_prelist.da")
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
	
	@RequestMapping(value="/ajax_pro_topSearch.da")
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
	
	@RequestMapping(value="/ajax_pro_list.da")
	public ModelAndView ajax_pro_list(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("pro/ajax_pro_main_list");
		
		int total_cnt = 0;
		Map<String, Object> requestMap = new HashMap<>();
		requestMap.put("pro_pcl_no", request.getParameter("pro_pcl_no"));
		requestMap.put("proOrderCode", request.getParameter("proOrderCode"));
		requestMap.put("mkr_no_sy", request.getParameterValues("mkr_no_sy"));
		requestMap.put("pdt_step51_sy", request.getParameterValues("pdt_step51_sy"));
		
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
		
		mv.addObject("proMainList", pro_list);
		mv.addObject("total_cnt", total_cnt);
		mv.addObject("orderCode", request.getParameter("proOrderCode"));
		
		return mv;
	}
	
	@RequestMapping(value="/ajax_pro_pclSearch.da")
	public ModelAndView ajax_pro_pclSearch(HttpServletRequest request, HttpServletResponse response){
		
		return ajax_pro_list(request, response);
	}
	
	@RequestMapping(value="/ajax_sct_list.da")
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

}
