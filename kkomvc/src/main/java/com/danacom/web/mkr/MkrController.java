package com.danacom.web.mkr;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.danacom.mybatis.mkr.MakerVo;
import com.danacom.mybatis.mkr.MkrDao;

@Controller
public class MkrController {
	@Autowired private MkrDao mkrDao ;
	
	public void setMkrDao(MkrDao mkrDao) {
		this.mkrDao = mkrDao;
	}
	public MkrDao getMkrDao() {
		return mkrDao;
	}
	
	@RequestMapping(value="/mkr_list.do")
	public ModelAndView mkr_list(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("mkr/mkr_list");
		
		String mkr_insert = request.getParameter("mkr_insert");
		String mkr_pcl_no = request.getParameter("mkr_pcl_no");
		
		List<MakerVo> list = mkrDao.getMkrList(mkr_pcl_no);
		MakerVo mkrCom = new MakerVo();
		mkrCom.setList(list);
		mkrCom.setMkr_insert(mkr_insert);
		
		mv.addObject("mkr_pcl_no", mkr_pcl_no);
		mv.addObject("mkrCom", mkrCom);
		
		return mv;
	}
	
	@RequestMapping(value="/mkr_preUpdate.do")
	public ModelAndView mkr_preUpdate(HttpServletRequest request, HttpServletResponse response){
		//ModelAndView mv = new ModelAndView("mkr/mkr_list");
		
		String mkr_no = request.getParameter("mkr_no");
		String mkr_pcl_no = request.getParameter("mkr_pcl_no");
		
		MakerVo mkrVO = mkrDao.getMkrVO(mkr_no);
		
		request.setAttribute("mkrVO", mkrVO);
		request.setAttribute("mkr_insert", "y");
		request.setAttribute("mkr_pcl_no", mkr_pcl_no);
		request.setAttribute("pro_cont", mkrVO.getTot_cont()); // 상품여부 확인 : 존재하면 삭제불가
		
		return mkr_list(request, response);
	}
	
	@RequestMapping(value="/mkr_insert.do")
	public ModelAndView mkr_insert(@ModelAttribute("mkrCom")MakerVo mkrCom, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("redirect:/mkr_list.do?dana=mkr_list&mkr_insert=y");
		
		mkrDao.mkrInsert(mkrCom);
		
		mv.addObject("mkr_pcl_no",mkrCom.getMkr_pcl_no());
		
		return mv;
	}
	
	@RequestMapping(value="/mkr_update.do")
	public ModelAndView mkr_update(@ModelAttribute("mkrCom")MakerVo mkrCom, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("redirect:/mkr_list.do?dana=mkr_list&mkr_insert=y");
		
		mkrDao.mkrUpdate(mkrCom);
		
		mv.addObject("mkr_pcl_no",mkrCom.getMkr_pcl_no());
		
		return mv;
	}
	
	@RequestMapping(value="/mkr_delete.do")
	public ModelAndView mkr_delete(@ModelAttribute("mkrCom")MakerVo mkrCom, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("redirect:/mkr_list.do?dana=mkr_list&mkr_insert=y");
		
		mkrDao.mkrDelete(String.valueOf(mkrCom.getMkr_no()));
		
		mv.addObject("mkr_pcl_no",mkrCom.getMkr_pcl_no());
		
		return mv;
	}
	
}
