package com.danacom.mybatis.vbl;

public class BtlVo {
	// battle
	private String btl_no;
	private String btl_sdate;
	private String btl_cdate;
	private String btl_title;
	private String btl_content;
	// vbl_btl_join
	private String vbj_no;
	private String vbj_btl_no;
	private String vbj_grade;
	private String vbj_mem_no;
	private String vbj_title;
	// vbj_det
	private String vbd_no;
	private String vbd_quantity;
	private String vbd_vbj_no;
	private String vbd_pro_no;
	// product
	private String vds_no;
	private String vds_quantity;
	private String pro_no;
	private String pro_name;
	private String pro_disprice;
	private String pro_milege;
	private String pro_regdate;
	private String mkr_name;
	private String pcl_name;
	private String psm_conent;
	private String pmg_file;
	// member
	private String mem_no;
	private String mem_id;
	private String totDisprice;
	// vir_bill_board
	private String vbb_no;
	
	private int tot_cont;
	
	public String getVbb_no() {
		return vbb_no;
	}
	public void setVbb_no(String vbb_no) {
		this.vbb_no = vbb_no;
	}
	public String getVbj_title() {
		return vbj_title;
	}
	public void setVbj_title(String vbj_title) {
		this.vbj_title = vbj_title;
	}
	public String getTotDisprice() {
		return totDisprice;
	}
	public void setTotDisprice(String totDisprice) {
		this.totDisprice = totDisprice;
	}
	public String getMem_no() {
		
		return mem_no;
	}
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getVbj_no() {
		return vbj_no;
	}
	public void setVbj_no(String vbj_no) {
		this.vbj_no = vbj_no;
	}
	public String getVbj_btl_no() {
		return vbj_btl_no;
	}
	public void setVbj_btl_no(String vbj_btl_no) {
		this.vbj_btl_no = vbj_btl_no;
	}
	public String getVbj_grade() {
		return vbj_grade;
	}
	public void setVbj_grade(String vbj_grade) {
		this.vbj_grade = vbj_grade;
	}
	public String getVbj_mem_no() {
		return vbj_mem_no;
	}
	public void setVbj_mem_no(String vbj_mem_no) {
		this.vbj_mem_no = vbj_mem_no;
	}
	public String getVbd_no() {
		return vbd_no;
	}
	public void setVbd_no(String vbd_no) {
		this.vbd_no = vbd_no;
	}
	public String getVbd_quantity() {
		return vbd_quantity;
	}
	public void setVbd_quantity(String vbd_quantity) {
		this.vbd_quantity = vbd_quantity;
	}
	public String getVbd_vbj_no() {
		return vbd_vbj_no;
	}
	public void setVbd_vbj_no(String vbd_vbj_no) {
		this.vbd_vbj_no = vbd_vbj_no;
	}
	public String getVbd_pro_no() {
		return vbd_pro_no;
	}
	public void setVbd_pro_no(String vbd_pro_no) {
		this.vbd_pro_no = vbd_pro_no;
	}
	public String getVds_no() {
		return vds_no;
	}
	public void setVds_no(String vds_no) {
		this.vds_no = vds_no;
	}
	public String getVds_quantity() {
		return vds_quantity;
	}
	public void setVds_quantity(String vds_quantity) {
		this.vds_quantity = vds_quantity;
	}
	public String getPro_no() {
		return pro_no;
	}
	public void setPro_no(String pro_no) {
		this.pro_no = pro_no;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_disprice() {
		return pro_disprice;
	}
	public void setPro_disprice(String pro_disprice) {
		this.pro_disprice = pro_disprice;
	}
	public String getPro_milege() {
		return pro_milege;
	}
	public void setPro_milege(String pro_milege) {
		this.pro_milege = pro_milege;
	}
	public String getPro_regdate() {
		return pro_regdate;
	}
	public void setPro_regdate(String pro_regdate) {
		this.pro_regdate = pro_regdate;
	}
	public String getMkr_name() {
		return mkr_name;
	}
	public void setMkr_name(String mkr_name) {
		this.mkr_name = mkr_name;
	}
	public String getPcl_name() {
		return pcl_name;
	}
	public void setPcl_name(String pcl_name) {
		this.pcl_name = pcl_name;
	}
	public String getPsm_conent() {
		return psm_conent;
	}
	public void setPsm_conent(String psm_conent) {
		this.psm_conent = psm_conent;
	}
	public String getPmg_file() {
		return pmg_file;
	}
	public void setPmg_file(String pmg_file) {
		this.pmg_file = pmg_file;
	}
	public String getBtl_no() {
		return btl_no;
	}
	public void setBtl_no(String btl_no) {
		this.btl_no = btl_no;
	}
	public String getBtl_sdate() {
		return btl_sdate;
	}
	public void setBtl_sdate(String btl_sdate) {
		this.btl_sdate = btl_sdate;
	}
	public String getBtl_cdate() {
		return btl_cdate;
	}
	public void setBtl_cdate(String btl_cdate) {
		this.btl_cdate = btl_cdate;
	}
	public String getBtl_title() {
		return btl_title;
	}
	public void setBtl_title(String btl_title) {
		this.btl_title = btl_title;
	}
	public String getBtl_content() {
		return btl_content;
	}
	public void setBtl_content(String btl_content) {
		this.btl_content = btl_content;
	}
	public int getTot_cont() {
		return tot_cont;
	}
	public void setTot_cont(int tot_cont) {
		this.tot_cont = tot_cont;
	}
}
