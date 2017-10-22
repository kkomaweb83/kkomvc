package com.danacom.web.cpy;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.danacom.mybatis.cpy.CpyDao;
import com.danacom.mybatis.cpy.CpyVo;

@Controller
public class CpyController {
	
	@Autowired private CpyDao cpyDao;
	
	public CpyDao getCpyDao() {
		return cpyDao;
	}
	
	@RequestMapping(value="/company_list.do")
	public ModelAndView mkr_list(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("cpy/company_list");
		
		List<CpyVo> cpyList = cpyDao.getCpyList();
		
		mv.addObject("cpyList", cpyList);
		
		return mv;
	}

}
