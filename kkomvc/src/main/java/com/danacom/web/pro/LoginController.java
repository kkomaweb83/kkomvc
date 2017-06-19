package com.danacom.web.pro;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping(value="/loginChk.da")
	public ModelAndView loginChk(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("");
		
		MemComVo login = new MemComVo(); 
		
		String mem_id = request.getParameter("mem_id");
		String mem_pass = request.getParameter("mem_pass");
		String url = "redirect:/pro_main_prelist.da?dana=pro_main_prelist&pro_pcl_no=0101";
		
		List<MemComVo> list = loginDao.getLoginChk(mem_id);
		
		if(list == null || list.size() == 0){
			login.setMsg("해당 ID가 존재하지 않습니다.");
			login.setCmd(102);
		}else if(list.size() == 1){
			login = list.get(0);
			if(login.getMem_pass().equals(mem_pass)){
				login.setMsg("");
				login.setCmd(101);
				
				request.getSession().setAttribute("login", login);
				if(login.getMem_admin_autho().equals("y")){
					url = "redirect:/pcl_list.da?dana=pcl_list";
				}
			}else{
				login.setMsg("해당 PW가 같지 않습니다.");
				login.setCmd(102);
			}
		}else if(list.size() > 1){
			login.setMsg("해당 ID가 여러개 존재 합니다.");
			login.setCmd(102);
		}
		if(login.getCmd() == 102){
			mv.addObject("login_chk_msg", login.getMsg());
		}
		
		mv.setViewName(url);
		
		return mv;
	}
	
	@RequestMapping(value="/logout.da")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("");
		String url = "redirect:/pro_main_prelist.da?dana=pro_main_prelist&pro_pcl_no=0101";
				
		request.getSession().removeAttribute("login");
		
		mv.setViewName(url);
		
		return mv;
	}
	
}
