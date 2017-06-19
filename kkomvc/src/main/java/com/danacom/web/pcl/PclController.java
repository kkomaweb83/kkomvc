package com.danacom.web.pcl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.danacom.mybatis.pcl.PclDao;
import com.danacom.mybatis.pcl.ProClassVo;

@Controller
public class PclController {
	@Autowired private PclDao pclDao;
	
	public void setPclDao(PclDao pclDao) {
		this.pclDao = pclDao;
	}
	public PclDao getPclDao() {
		return pclDao;
	}
	
	@RequestMapping(value="/pcl_list.da")
	public ModelAndView pcl_list(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("pcl/pcl_list");
		
		HttpSession session = request.getSession();
		if(session.getAttribute("old_list") != null){
			session.removeAttribute("old_list");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/ajax_pcl_list.da")
	public ModelAndView ajax_pcl_list(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("pcl/ajax_pcl_list");
		
		String pcl_upperno = request.getParameter("pcl_upperno");
		String pcl_old_upperno = request.getParameter("pcl_old_upperno");
		String insert = request.getParameter("insert");
		int step = Integer.parseInt(request.getParameter("step"));
		String objsetp = request.getParameter("objsetp");
		
		String pcl_session = request.getParameter("pcl_session");
		
		List<ProClassVo> list = pclDao.getPclList(pcl_upperno);
		
		HttpSession session = request.getSession();
		List<ProClassVo> old_list = new ArrayList<>();
		if(session.getAttribute("old_list") != null){
			old_list = (List<ProClassVo>)session.getAttribute("old_list");
			if(objsetp != null){
				for(int i = old_list.size(); i> (step-2); i--){
					old_list.remove(i-1);
				}
			}
		}
		
		ProClassVo oldPclVO = new ProClassVo();
		oldPclVO.setPcl_no(pcl_upperno);
		oldPclVO.setPcl_upperno(pcl_old_upperno);
		oldPclVO.setPcl_step(step);
		if(pcl_old_upperno != null && !pcl_old_upperno.equals("NO")){
			oldPclVO.setPcl_list(pclDao.getPclList(pcl_old_upperno));
			if(pcl_session != null && pcl_session.equals("y")){ 
				old_list.add(oldPclVO);
			}
		}
		session.setAttribute("old_list", old_list);
		
				
		ProClassVo pclVO = new ProClassVo();
		if(pcl_upperno.equalsIgnoreCase("null") || pcl_upperno == null){
			pclVO.setPcl_upperno(pcl_upperno);			
			pclVO.setPa_pcl_name(pcl_upperno);			
			pclVO.setPcl_step(step);
		}else{
			pclVO = pclDao.getPclVO(pcl_upperno);
			pclVO.setPcl_upperno(pclVO.getPcl_no());
			pclVO.setPa_pcl_name(pclVO.getPcl_name());
			pclVO.setPcl_name("");
			pclVO.setPcl_step(step);
		}
		
		mv.addObject("pcllist",list);
		mv.addObject("insert", insert);
		mv.addObject("pclVO", pclVO);
		mv.addObject("oldstep", step);
		mv.addObject("pcl_session", "n");
		
		return mv;
	}
	
	@RequestMapping(value="/pcl_auto_no.da")
	public ModelAndView pcl_auto_no(HttpServletRequest request, HttpServletResponse response){
		//ModelAndView mv = new ModelAndView("ajax_pcl_list.da");
		
		String pcl_uppercode = request.getParameter("pcl_upperno");
		String pcl_ord_no = "";
		String new_pcl_no = "";
		
		if(pcl_uppercode.equalsIgnoreCase("null") || pcl_uppercode == null) pcl_ord_no = "";
		else pcl_ord_no = pcl_uppercode;
		
		String maxNo = pclDao.getMaxPclNo(pcl_uppercode);
		
		if(maxNo != null){
			if(maxNo.length()%2 != 0) maxNo = "0" + maxNo;
			maxNo = maxNo.replace(pcl_ord_no, "");
			new_pcl_no = pcl_ord_no + maxNo;
		}else new_pcl_no = pcl_ord_no + "01";
		
		if(pcl_ord_no.length() >= new_pcl_no.length()) new_pcl_no = pcl_ord_no + new_pcl_no; 
		
		request.setAttribute("pcl_atuo_no", new_pcl_no);
		
		return ajax_pcl_list(request, response);
	}
	
	@RequestMapping(value="/pcl_preUpdate.da")
	public ModelAndView pcl_preUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("pcl/ajax_pcl_list");
		
		String pcl_upperno = request.getParameter("pcl_upperno");
		String pcl_no = request.getParameter("pcl_no");
		String insert = request.getParameter("insert");
		
		ProClassVo pclVO = pclDao.getPclVO(pcl_no);
		List<ProClassVo> list = pclDao.getPclList(pcl_upperno);
		
		mv.addObject("insert",insert);
		mv.addObject("pclVO",pclVO);
		mv.addObject("pcllist",list);
		
		return mv;
	}
	
	@RequestMapping(value="/pcl_insert.da")
	public ModelAndView pcl_insert(@ModelAttribute("pclVO")ProClassVo pclVO, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("redirect:/ajax_pcl_list.da?dana=ajax_pcl_list&insert=y");
		
		pclDao.pclInsert(pclVO);
		
		/*
		String movUrl = "PclController?dana=ajax_pcl_list&pcl_upperno=" 
				+ request.getParameter("pcl_upperno")+"&insert=y&step="
				+ request.getParameter("pcl_step")+"&pcl_old_upperno="
				+ request.getParameter("pcl_upperno"); */
		
		mv.addObject("pcl_upperno",pclVO.getPcl_upperno());
		mv.addObject("step",pclVO.getPcl_step());
		mv.addObject("pcl_old_upperno",pclVO.getPcl_old_upperno());
		
		return mv;
	}
	
	@RequestMapping(value="/pcl_update.da")
	public ModelAndView pcl_update(@ModelAttribute("pclVO")ProClassVo pclVO, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("redirect:/ajax_pcl_list.da?dana=ajax_pcl_list&insert=y");
		
		pclDao.pclUpdate(pclVO);
		
		mv.addObject("pcl_upperno",pclVO.getPcl_upperno());
		mv.addObject("step",pclVO.getPcl_step());
		mv.addObject("pcl_old_upperno",pclVO.getPcl_old_upperno());
		
		return mv;
	}
	
	@RequestMapping(value="/pcl_delete.da")
	public ModelAndView pcl_delete(@ModelAttribute("pclVO")ProClassVo pclVO, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("redirect:/ajax_pcl_list.da?dana=ajax_pcl_list&insert=y");
		
		pclDao.pclDelete(pclVO.getPcl_no());
		
		mv.addObject("pcl_upperno",pclVO.getPcl_upperno());
		mv.addObject("step",pclVO.getPcl_step());
		mv.addObject("pcl_old_upperno",pclVO.getPcl_old_upperno());
		
		return mv;
	}
	
	@RequestMapping(value="/member_prejoin.da")
	public ModelAndView member_prejoin(){
		return new ModelAndView("pcl/member_prejoin");
	}

}
