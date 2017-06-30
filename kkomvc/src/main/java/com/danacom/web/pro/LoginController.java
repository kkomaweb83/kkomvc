package com.danacom.web.pro;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danacom.mybatis.pro.LoginDao;
import com.danacom.mybatis.pro.MemComVo;


@Controller
public class LoginController {
	@Autowired private  LoginDao loginDao  ;
	
	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;
	}
	public LoginDao getLoginDao() {
		return loginDao;
	}
	
	@RequestMapping(value="/loginChk.do")
	public ModelAndView loginChk(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("");
		
		MemComVo login = new MemComVo(); 
		
		String mem_id = request.getParameter("mem_id");
		String mem_pass = request.getParameter("mem_pass");
		String url = "redirect:/pro_main_prelist.do?dana=pro_main_prelist&pro_pcl_no=0101";
		
		List<MemComVo> list = loginDao.getLoginChk(mem_id);
		
		if(list == null || list.size() == 0){
			login.setMsg("lo_err01");
			login.setCmd(102);
		}else if(list.size() == 1){
			login = list.get(0);
			if(login.getMem_pass().equals(mem_pass)){
				login.setMsg("");
				login.setCmd(101);
				
				request.getSession().setAttribute("login", login);
				if(login.getMem_admin_autho().equals("y")){
					url = "redirect:/pcl_list.do?dana=pcl_list";
				}
			}else{
				login.setMsg("lo_err02");
				login.setCmd(102);
			}
		}else if(list.size() > 1){
			login.setMsg("lo_err03");
			login.setCmd(102);
		}
		if(login.getCmd() == 102){
			mv.addObject("login_chk_msg", login.getMsg());
		}
		
		mv.setViewName(url);
		
		return mv;
	}
	
	@RequestMapping(value="/logout.do")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("");
		String url = "redirect:/pro_main_prelist.do?dana=pro_main_prelist&pro_pcl_no=0101";
				
		request.getSession().removeAttribute("login");
		
		mv.setViewName(url);
		
		return mv;
	}
	
	@RequestMapping(value="/chk_mem_id.do")
	public @ResponseBody Map<String, Object> chk_mem_id(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> jsonObject = new HashMap<String, Object>();
		
		String mem_id = request.getParameter("chk_mem_id");
		List<MemComVo> list = loginDao.getLoginChk(mem_id);
		
		jsonObject.put("chk", "Y");
		jsonObject.put("msg", "");
		if(list != null && list.size() > 0){
			jsonObject.put("chk", "N");
			jsonObject.put("msg", "존재하는 ID 입니다.");
		}
		
		return jsonObject;
	}
	
	@RequestMapping(value="/mem_join.do")
	public ModelAndView mem_join(@ModelAttribute("memComVo")MemComVo memComVo, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("");
		
		loginDao.memInsert(memComVo);
		
		mv.setViewName("pro/mem_result");
		mv.addObject("mem_id", memComVo.getMem_id());
		
		return mv;
	}
	
}
