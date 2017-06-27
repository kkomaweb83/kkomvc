package com.danacom.util;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections4.MapUtils;

public class CommonUtilsController {
	
	//  페이징 정보 셋팅
    public static void setPageSetting(Map<String, Object> requestMap, HttpServletRequest request){
    	int nowPage = 1; // 현재페이지
    	int numPerPage = 10; // 한 페이지에 게시되는 원글의 수
    	int begin = 1; // 시작번호
    	int end = 10;  // 끝번호
    	int totalRecord = 0; // 총 게시물의 수(원글의 수)
    	int totalPage = 0; // 전체 페이지의수
    	int pagePerBlock = 5; // 블럭당 표현되는 페이지의 수
    	
    	requestMap.put("cPage", request.getParameter("cPage"));
    	requestMap.put("numPerPage", request.getParameter("numPerPage"));
    	requestMap.put("pagePerBlock", request.getParameter("pagePerBlock"));
    	
    	nowPage			= MapUtils.getIntValue( requestMap, "cPage",        1); // 현재 링크 페이지 번호
    	numPerPage		= MapUtils.getIntValue( requestMap, "numPerPage",   10); // 한페이지에 나오는 리스트 갯수
    	totalRecord     = MapUtils.getIntValue( requestMap, "total_cnt",    1);  // 전체 갯수
    	pagePerBlock    = MapUtils.getIntValue( requestMap, "pagePerBlock", 5);  // 페이지 블럭 갯수
    	
    	begin = (nowPage - 1) * numPerPage + 1;
    	end = (begin - 1) + numPerPage;
    	
    	totalPage = totalRecord / numPerPage ;
	    if( totalRecord % numPerPage != 0 ) totalPage ++ ;
    	
    	requestMap.put("begin", begin);
    	requestMap.put("begin_ms", (begin-1));
    	requestMap.put("end", end);
    	requestMap.put("numPerPage", numPerPage);
    	
    	request.setAttribute("p_totalPage", totalPage);
    	request.setAttribute("p_nowPage", nowPage);
    	request.setAttribute("p_pagePerBlock", pagePerBlock);
    }

}
