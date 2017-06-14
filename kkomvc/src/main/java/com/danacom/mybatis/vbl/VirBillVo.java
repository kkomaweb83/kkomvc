package com.danacom.mybatis.vbl;

import java.util.List;

public class VirBillVo{
	
	private int vbl_no;
	private int vbl_mem_no;
	private String vbl_bor_answer;
	private String vbl_title;
	private String vbl_date;
	private int vbb_no;
	private String vbb_content;
	
	private int firstRow ;
	private int lastRow;
	private String page;
	private int proOrderCode;
	
	private List ist;
	private int maker;
	private String search_pcl_no[];
	private String pst_pro_no[];
	private String pcl_no;
	
	private int sct_pro_part;
	private int sct_pro_muti;
	
	private String searchKey;
	private String searchValue;
	
	private int tot_cont;
	
	public VirBillVo() {
	}

	public int getVbl_no() {
		return vbl_no;
	}

	public void setVbl_no(int vbl_no) {
		this.vbl_no = vbl_no;
	}

	public int getVbl_mem_no() {
		return vbl_mem_no;
	}

	public void setVbl_mem_no(int vbl_mem_no) {
		this.vbl_mem_no = vbl_mem_no;
	}

	public String getVbl_bor_answer() {
		return vbl_bor_answer;
	}

	public void setVbl_bor_answer(String vbl_bor_answer) {
		this.vbl_bor_answer = vbl_bor_answer;
	}

	public String getVbl_title() {
		return vbl_title;
	}

	public void setVbl_title(String vbl_title) {
		this.vbl_title = vbl_title;
	}

	public String getVbl_date() {
		return vbl_date;
	}

	public void setVbl_date(String vbl_date) {
		this.vbl_date = vbl_date;
	}

	public int getVbb_no() {
		return vbb_no;
	}

	public void setVbb_no(int vbb_no) {
		this.vbb_no = vbb_no;
	}

	public String getVbb_content() {
		return vbb_content;
	}

	public void setVbb_content(String vbb_content) {
		this.vbb_content = vbb_content;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}

	public int getLastRow() {
		return lastRow;
	}

	public void setLastRow(int lastRow) {
		this.lastRow = lastRow;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public int getProOrderCode() {
		return proOrderCode;
	}

	public void setProOrderCode(int proOrderCode) {
		this.proOrderCode = proOrderCode;
	}

	public List getIst() {
		return ist;
	}

	public void setIst(List ist) {
		this.ist = ist;
	}

	public int getMaker() {
		return maker;
	}

	public void setMaker(int maker) {
		this.maker = maker;
	}

	public String[] getSearch_pcl_no() {
		return search_pcl_no;
	}

	public void setSearch_pcl_no(String[] search_pcl_no) {
		this.search_pcl_no = search_pcl_no;
	}

	public String[] getPst_pro_no() {
		return pst_pro_no;
	}

	public void setPst_pro_no(String[] pst_pro_no) {
		this.pst_pro_no = pst_pro_no;
	}

	public String getPcl_no() {
		return pcl_no;
	}

	public void setPcl_no(String pcl_no) {
		this.pcl_no = pcl_no;
	}

	public int getSct_pro_part() {
		return sct_pro_part;
	}

	public void setSct_pro_part(int sct_pro_part) {
		this.sct_pro_part = sct_pro_part;
	}

	public int getSct_pro_muti() {
		return sct_pro_muti;
	}

	public void setSct_pro_muti(int sct_pro_muti) {
		this.sct_pro_muti = sct_pro_muti;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public int getTot_cont() {
		return tot_cont;
	}

	public void setTot_cont(int tot_cont) {
		this.tot_cont = tot_cont;
	}
	
}
