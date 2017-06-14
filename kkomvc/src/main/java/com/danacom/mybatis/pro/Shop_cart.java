package com.danacom.mybatis.pro;

public class Shop_cart {
	private int sct_no;
	private int sct_pro_no;
	private int sct_count;
	private int sct_mem_no;
	
	private int sct_pro_part;
	private int sct_pro_muti;
	
	private int vbl_mem_no;
	private String pst_pro_no[];
	
	private Shop_proVO sct_proVO;
	
	public int getSct_no() {
		return sct_no;
	}
	public void setSct_no(int sct_no) {
		this.sct_no = sct_no;
	}
	public int getSct_pro_no() {
		return sct_pro_no;
	}
	public void setSct_pro_no(int sct_pro_no) {
		this.sct_pro_no = sct_pro_no;
	}
	public int getSct_count() {
		return sct_count;
	}
	public void setSct_count(int sct_count) {
		this.sct_count = sct_count;
	}
	public int getSct_mem_no() {
		return sct_mem_no;
	}
	public void setSct_mem_no(int sct_mem_no) {
		this.sct_mem_no = sct_mem_no;
	}
	public int getSct_pro_part() {
		return sct_pro_part;
	}
	public void setSct_pro_part(int sct_pro_part) {
		this.sct_pro_part = sct_pro_part;
	}
	public Shop_proVO getSct_proVO() {
		return sct_proVO;
	}
	public void setSct_proVO(Shop_proVO sct_proVO) {
		this.sct_proVO = sct_proVO;
	}
	public int getSct_pro_muti() {
		return sct_pro_muti;
	}
	public void setSct_pro_muti(int sct_pro_muti) {
		this.sct_pro_muti = sct_pro_muti;
	}
	public int getVbl_mem_no() {
		return vbl_mem_no;
	}
	public void setVbl_mem_no(int vbl_mem_no) {
		this.vbl_mem_no = vbl_mem_no;
	}
	public String[] getPst_pro_no() {
		return pst_pro_no;
	}
	public void setPst_pro_no(String[] pst_pro_no) {
		this.pst_pro_no = pst_pro_no;
	}
	
	
}
