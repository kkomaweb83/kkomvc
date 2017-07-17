package com.danacom.web.pro;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.danacom.mybatis.base.BaseDao;
import com.danacom.mybatis.mkr.MakerVo;
import com.danacom.mybatis.mkr.MkrDao;
import com.danacom.mybatis.pcl.PclDao;
import com.danacom.mybatis.pcl.ProClassVo;
import com.danacom.mybatis.pro.MemComVo;
import com.danacom.mybatis.pro.ProDao;
import com.danacom.mybatis.pro.ProTempVo;
import com.danacom.mybatis.pro.Pro_detVo;
import com.danacom.mybatis.pro.Pro_imgVo;
import com.danacom.mybatis.pro.ProductVo;
import com.danacom.util.CommonUtilsController;

@Controller
public class ProAdminController {
	@Autowired private ProDao proDao;
	@Autowired private BaseDao baseDao;
	@Autowired private MkrDao mkrDao;
	@Autowired private PclDao pclDao;
	@Autowired private PlatformTransactionManager transactionManager;
	
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
	public void setMkrDao(MkrDao mkrDao) {
		this.mkrDao = mkrDao;
	}
	public MkrDao getMkrDao() {
		return mkrDao;
	}
	public void setPclDao(PclDao pclDao) {
		this.pclDao = pclDao;
	}
	public PclDao getPclDao() {
		return pclDao;
	}
	public void setTransactionManager(PlatformTransactionManager transactionManager) {
		this.transactionManager = transactionManager;
	}
	public PlatformTransactionManager getTransactionManager() {
		return transactionManager;
	}
	
	@RequestMapping(value="/pro_admin_list.do")
	public ModelAndView pro_admin_list(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("pro/pro_admin_list");
		
		int total_cnt = 0;
		Map<String, Object> requestMap = new HashMap<>();
		requestMap.put("pro_pcl_no", request.getParameter("pro_pcl_no"));
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        TransactionStatus status = transactionManager.getTransaction(def);
		
		CommonUtilsController.setPageSetting(requestMap, request); // 페이징1
		List<ProductVo> pro_list = proDao.getProAdminList(requestMap);
		
		if(pro_list != null && pro_list.size() > 0){
			total_cnt = ((ProductVo)pro_list.get(0)).getTot_cont();
			if(total_cnt == -999){
				total_cnt = baseDao.get_found_rows();
			}
			requestMap.put("total_cnt", total_cnt);
		}
		CommonUtilsController.setPageSetting(requestMap, request); // 페이징2
		
		transactionManager.commit(status);
		
		mv.addObject("pro_list", pro_list);
		mv.addObject("total_cnt", total_cnt);
		
		return mv;
	}
	
	@RequestMapping(value="/pro_preInsert.do")
	public ModelAndView pro_preInsert(){
		return new ModelAndView("pro/pro_preInsert");
	}
	
	@RequestMapping(value="/pro_insert.do", method=RequestMethod.POST)
	public ModelAndView pro_insert(@ModelAttribute("proCommand")ProductVo proCommand, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("redirect:/pro_admin_list.do?dana=pro_admin_list&pro_pcl_no="+proCommand.getPro_pcl_no());
		
		try {
			int proMaxNo= proDao.getProMaxNo();
			proCommand.setPro_no(proMaxNo);
			
			String[] setp = proCommand.getStep();
			
			String pdt_name = ""; 
			String pdt_conent = "";
			String img_path = "/resources/product_img";
			
			proDao.proInsert(proCommand);
			proDao.psmInsert(proCommand);
			
			Pro_imgVo pmgCommand = new Pro_imgVo(); 
			pmgCommand.setPmg_pro_no(proMaxNo);
			
			InetAddress ip = InetAddress.getLocalHost();
			if("183.111.100.173".equals(ip.getHostAddress())){
				img_path = "/product_img";
			}
			
			String path = request.getSession().getServletContext().getRealPath(img_path);
			
			MultipartFile file_s1 = proCommand.getPmg_file_s1_mp();
			MultipartFile file_s2 = proCommand.getPmg_file_s2_mp();
			
			// 첨부파일 없을때
			if(file_s1.getOriginalFilename() != null && !"".equals(file_s1.getOriginalFilename())){
				pmgCommand.setPmg_file(file_s1.getOriginalFilename());
				// FileCopyUtils의 in, out 만들기
				byte[] in = file_s1.getBytes();
				File out = new File(path,pmgCommand.getPmg_file());
				FileCopyUtils.copy(in, out);
				
				pmgCommand.setPmg_idt_no(1);
				proDao.pmgInsert(pmgCommand);
			}
			
			// 첨부파일 없을때
			if(file_s2.getOriginalFilename() != null && !"".equals(file_s2.getOriginalFilename())){
				pmgCommand.setPmg_file(file_s2.getOriginalFilename());
				// FileCopyUtils의 in, out 만들기
				byte[] in = file_s2.getBytes();
				File out = new File(path,pmgCommand.getPmg_file());
				FileCopyUtils.copy(in, out);
				
				pmgCommand.setPmg_idt_no(2);
				proDao.pmgInsert(pmgCommand);
			}
			
			Pro_detVo pdtCommand = new Pro_detVo();
			for(int i = 0; i < setp.length; i++){
				String[] temp = setp[i].split(",");
				pdt_name = request.getParameter("pdt_step4_" + temp[0] + "_" + temp[1]);
				pdt_conent = request.getParameter("pdt_step51_" + temp[0] + "_" + temp[1]);
				pdtCommand.setPdt_name(pdt_name);
				pdtCommand.setPdt_conent(pdt_conent);
				pdtCommand.setPdt_pro_no(proMaxNo);
				if(!pdt_conent.equals("NULL")){
					proDao.pdtInsert(pdtCommand);
				}
			}
		
		} catch (Exception e) {
			System.out.println(e);
		}				
		
		return mv;
	}
	
	@RequestMapping(value="/propdtpresel.do")
	public ModelAndView propdtpresel(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("pro/pro_preInsert");
		
		String mkr_pcl_no2 = request.getParameter("pcl_no");
		
		List<MakerVo> mkrList = mkrDao.getMkrList(mkr_pcl_no2);
		
		ProClassVo pclVO = null;
		List<ProClassVo> tempList = null;
		List<ProClassVo> pclList = pclDao.getPclList(mkr_pcl_no2);
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
		
		ProductVo proCom = new ProductVo(); 
		proCom.setPro_pcl_no(mkr_pcl_no2);
		
		mv.addObject("mkrList", mkrList);
		mv.addObject("pclList", pclList);
		mv.addObject("proCom", proCom);
		
		return mv;
	}
	
	@RequestMapping(value="/pro_admin_view.do")
	public ModelAndView pro_admin_view(@ModelAttribute("proCom")ProductVo proCom, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("pro/pro_admin_view");
		
		ProductVo proVo = proDao.getProVo(proCom.getPro_no());
		MakerVo mkrVo = new MakerVo();
		mkrVo.setList(mkrDao.getMkrList(proCom.getPro_pcl_no()));
		mkrVo.setMkr_no(proVo.getPro_mkr_no());
		
		String pmg_file_s = proDao.getPmgFile(proCom.getPro_no(), 1);
		String pmg_file_b = proDao.getPmgFile(proCom.getPro_no(), 2);
		
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
						}else{
							pclVO.setPcl_next_no("NULL");
						}
					}
				}
			}
		}
		
		mv.addObject("proVo", proVo);
		mv.addObject("pclList", pclList);
		mv.addObject("mkrVo", mkrVo);
		mv.addObject("pmg_file_s", pmg_file_s);
		mv.addObject("pmg_file_b", pmg_file_b);
		mv.addObject("odt_cont", proVo.getTot_cont()); // 주문여부 확인 : 존재하면 삭제불가
		mv.addObject("sct_cont", proVo.getCis_no()); // 장바구니여부 확인 : 존재하면 삭제불가
		
		return mv;
	}
	
	@RequestMapping(value="/pro_update.do", method=RequestMethod.POST)
	public ModelAndView pro_update(@ModelAttribute("proCommand")ProductVo proCommand, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("redirect:/pro_admin_list.do?dana=pro_admin_list&pro_pcl_no="+proCommand.getPro_pcl_no());
		
		try {
			int proMaxNo= proCommand.getPro_no();
			
			String[] setp = proCommand.getStep();
			
			String pdt_name = ""; 
			String pdt_conent = "";
			String img_path = "/resources/product_img";
			
			proDao.proUpdate(proCommand);
			proDao.psmUpdate(proCommand);
			
			Pro_imgVo pmgCommand = new Pro_imgVo(); 
			pmgCommand.setPmg_pro_no(proMaxNo);
			
			InetAddress ip = InetAddress.getLocalHost();
			if("183.111.100.173".equals(ip.getHostAddress())){
				img_path = "/product_img";
			}
			
			String path = request.getSession().getServletContext().getRealPath(img_path);
			
			MultipartFile file_s1 = proCommand.getPmg_file_s1_mp();
			MultipartFile file_s2 = proCommand.getPmg_file_s2_mp();
			
			// 첨부파일 없을때
			if(file_s1.getOriginalFilename() != null && !"".equals(file_s1.getOriginalFilename())){
				pmgCommand.setPmg_file(file_s1.getOriginalFilename());
				// FileCopyUtils의 in, out 만들기
				byte[] in = file_s1.getBytes();
				File out = new File(path,pmgCommand.getPmg_file());
				FileCopyUtils.copy(in, out);
				
				pmgCommand.setPmg_idt_no(1);
				proDao.pmgUpdate(pmgCommand);
			}
			
			// 첨부파일 없을때
			if(file_s2.getOriginalFilename() != null && !"".equals(file_s2.getOriginalFilename())){
				pmgCommand.setPmg_file(file_s2.getOriginalFilename());
				// FileCopyUtils의 in, out 만들기
				byte[] in = file_s2.getBytes();
				File out = new File(path,pmgCommand.getPmg_file());
				FileCopyUtils.copy(in, out);
				
				pmgCommand.setPmg_idt_no(2);
				proDao.pmgUpdate(pmgCommand);
			}
			
			proDao.pdtDelete(proMaxNo);
			
			Pro_detVo pdtCommand = new Pro_detVo();
			for(int i = 0; i < setp.length; i++){
				String[] temp = setp[i].split(",");
				pdt_name = request.getParameter("pdt_step4_" + temp[0] + "_" + temp[1]);
				pdt_conent = request.getParameter("pdt_step51_" + temp[0] + "_" + temp[1]);
				pdtCommand.setPdt_name(pdt_name);
				pdtCommand.setPdt_conent(pdt_conent);
				pdtCommand.setPdt_pro_no(proMaxNo);
				if(!pdt_conent.equals("NULL")){
					proDao.pdtInsert(pdtCommand);
				}
			}
		
		} catch (Exception e) {
			System.out.println(e);
		}				
		
		return mv;
	}
	
	@RequestMapping(value="/pro_delete.do", method=RequestMethod.POST)
	public ModelAndView pro_delete(@ModelAttribute("proCommand")ProductVo proCommand, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("redirect:/pro_admin_list.do?dana=pro_admin_list&pro_pcl_no="+proCommand.getPro_pcl_no());
		
		int proMaxNo = proCommand.getPro_no();
		TransactionStatus status = null;
		
		try{
		
			DefaultTransactionDefinition def = new DefaultTransactionDefinition();
	        status = transactionManager.getTransaction(def);
	        
			proDao.pdtDelete(proMaxNo);
			proDao.pmgDelete(proMaxNo);
			proDao.psmDelete(proMaxNo);
			proDao.proDelete(proMaxNo);
			
			// 장바구니 삭제 추가 SCT_PRO_NO
	        proDao.sctProDelete(proMaxNo);
			
			transactionManager.commit(status);
		
		}catch (Exception e) {
			transactionManager.rollback(status);
			mv.addObject("error_msg", e);
			
			System.out.println(">>>>>>>>>>>>>>>>>>>>> kkomaweb : " + e);
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping(value="/mem_admin_list.do")
	public ModelAndView mem_admin_list(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("pro/mem_admin_list");
		
		int total_cnt = 0;
		Map<String, Object> requestMap = new HashMap<>();
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        TransactionStatus status = transactionManager.getTransaction(def);
		
		CommonUtilsController.setPageSetting(requestMap, request); // 페이징1
		List<MemComVo> mem_list = proDao.getMemAdminList(requestMap);
		
		if(mem_list != null && mem_list.size() > 0){
			total_cnt = ((MemComVo)mem_list.get(0)).getTot_cont();
			if(total_cnt == -999){
				total_cnt = baseDao.get_found_rows();
			}
			requestMap.put("total_cnt", total_cnt);
		}
		CommonUtilsController.setPageSetting(requestMap, request); // 페이징2
		
		transactionManager.commit(status);
		
		mv.addObject("mem_list", mem_list);
		mv.addObject("total_cnt", total_cnt);
		
		return mv;
	}
	
	@RequestMapping(value="/download.do")
	public void getDownload(HttpServletRequest request, HttpServletResponse response){
		
		try {
			String img_path = "/resources/product_img";
			
			InetAddress ip = InetAddress.getLocalHost();
			if("183.111.100.173".equals(ip.getHostAddress())){
				img_path = "/product_img";
			}
			
			String path = request.getSession().getServletContext().getRealPath(img_path);
			String file_name = request.getParameter("file_name");
			String encoded_path = URLEncoder.encode(file_name, "utf-8");
			
			// 브로우저 설정
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename="+encoded_path);
			
			File file = new File(path + "/" + new String(file_name.getBytes("utf-8")));
			FileInputStream fis = new FileInputStream(file);
			BufferedInputStream in = new BufferedInputStream(fis);
			
			OutputStream out = response.getOutputStream();
			FileCopyUtils.copy(in, out);
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
}
