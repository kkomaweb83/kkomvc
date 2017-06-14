package com.danacom.mybatis.pro;

import java.util.List;

public class MpVo {
	private String mem_no;
	private String mem_id;
	private String mem_name;
	private String mem_email;
	private String mem_addr;
	private String mem_tel;
	private String mem_mil;
	
	private String mll_no;
	private String mll_mem_no;
	private String mll_date;
	private String mll_content;
	private String mll_incoming;
	private String mll_outgoing;
	
	private String odt_no;
	private String odt_pro_no;
	private String odt_count;
	private String odt_rprice;
	private String odt_dprice;
	private String odt_coupno;
	private String odt_sprice;
	private String odt_smileage;
	private String odt_pvalchk;
	private String odt_pro_part;
	private String odt_condition;
	private String odt_odr_no;
	private String odt_dlv_no;
	private String odt_dpr_no;
	private String odt_dst_no;
	
	private String odr_no;
	private String odr_mem_no;
	private String odr_delfare;
	private String odr_mileage;
	private String odr_amount;
	private String odr_way;
	private String odr_odate;
	private String odr_sdate;
	private String odr_cdate;
	private String odr_condition;
	private String odr_condition2;
	private String odr_cby_no;

	private String dlv_zonecode;
	private String dlv_sendaddr;
	private String dlv_sendaddr2;
	private List list;
	
	private int tot_cont;
	
	public String getMll_no() {
		return mll_no;
	}
	public void setMll_no(String mll_no) {
		this.mll_no = mll_no;
	}
	public String getMll_mem_no() {
		return mll_mem_no;
	}
	public void setMll_mem_no(String mll_mem_no) {
		this.mll_mem_no = mll_mem_no;
	}
	public String getMll_date() {
		return mll_date;
	}
	public void setMll_date(String mll_date) {
		this.mll_date = mll_date;
	}
	public String getMll_content() {
		return mll_content;
	}
	public void setMll_content(String mll_content) {
		this.mll_content = mll_content;
	}
	public String getMll_incoming() {
		return mll_incoming;
	}
	public void setMll_incoming(String mll_incoming) {
		this.mll_incoming = mll_incoming;
	}
	public String getMll_outgoing() {
		return mll_outgoing;
	}
	public void setMll_outgoing(String mll_outgoing) {
		this.mll_outgoing = mll_outgoing;
	}
	public String getOdt_no() {
		return odt_no;
	}
	public void setOdt_no(String odt_no) {
		this.odt_no = odt_no;
	}
	public String getOdt_pro_no() {
		return odt_pro_no;
	}
	public void setOdt_pro_no(String odt_pro_no) {
		this.odt_pro_no = odt_pro_no;
	}
	public String getOdt_count() {
		return odt_count;
	}
	public void setOdt_count(String odt_count) {
		this.odt_count = odt_count;
	}
	public String getOdt_rprice() {
		return odt_rprice;
	}
	public void setOdt_rprice(String odt_rprice) {
		this.odt_rprice = odt_rprice;
	}
	public String getOdt_dprice() {
		return odt_dprice;
	}
	public void setOdt_dprice(String odt_dprice) {
		this.odt_dprice = odt_dprice;
	}
	public String getOdt_coupno() {
		return odt_coupno;
	}
	public void setOdt_coupno(String odt_coupno) {
		this.odt_coupno = odt_coupno;
	}
	public String getOdt_sprice() {
		return odt_sprice;
	}
	public void setOdt_sprice(String odt_sprice) {
		this.odt_sprice = odt_sprice;
	}
	public String getOdt_smileage() {
		return odt_smileage;
	}
	public void setOdt_smileage(String odt_smileage) {
		this.odt_smileage = odt_smileage;
	}
	public String getOdt_pvalchk() {
		return odt_pvalchk;
	}
	public void setOdt_pvalchk(String odt_pvalchk) {
		this.odt_pvalchk = odt_pvalchk;
	}
	public String getOdt_pro_part() {
		return odt_pro_part;
	}
	public void setOdt_pro_part(String odt_pro_part) {
		this.odt_pro_part = odt_pro_part;
	}
	public String getOdt_condition() {
		return odt_condition;
	}
	public void setOdt_condition(String odt_condition) {
		this.odt_condition = odt_condition;
	}
	public String getOdt_odr_no() {
		return odt_odr_no;
	}
	public void setOdt_odr_no(String odt_odr_no) {
		this.odt_odr_no = odt_odr_no;
	}
	public String getOdt_dlv_no() {
		return odt_dlv_no;
	}
	public void setOdt_dlv_no(String odt_dlv_no) {
		this.odt_dlv_no = odt_dlv_no;
	}
	public String getOdt_dpr_no() {
		return odt_dpr_no;
	}
	public void setOdt_dpr_no(String odt_dpr_no) {
		this.odt_dpr_no = odt_dpr_no;
	}
	public String getOdt_dst_no() {
		return odt_dst_no;
	}
	public void setOdt_dst_no(String odt_dst_no) {
		this.odt_dst_no = odt_dst_no;
	}
	public String getOdr_no() {
		return odr_no;
	}
	public void setOdr_no(String odr_no) {
		this.odr_no = odr_no;
	}
	public String getOdr_mem_no() {
		return odr_mem_no;
	}
	public void setOdr_mem_no(String odr_mem_no) {
		this.odr_mem_no = odr_mem_no;
	}
	public String getOdr_delfare() {
		return odr_delfare;
	}
	public void setOdr_delfare(String odr_delfare) {
		this.odr_delfare = odr_delfare;
	}
	public String getOdr_mileage() {
		return odr_mileage;
	}
	public void setOdr_mileage(String odr_mileage) {
		this.odr_mileage = odr_mileage;
	}
	public String getOdr_amount() {
		return odr_amount;
	}
	public void setOdr_amount(String odr_amount) {
		this.odr_amount = odr_amount;
	}
	public String getOdr_way() {
		return odr_way;
	}
	public void setOdr_way(String odr_way) {
		this.odr_way = odr_way;
	}
	public String getOdr_odate() {
		return odr_odate;
	}
	public void setOdr_odate(String odr_odate) {
		this.odr_odate = odr_odate;
	}
	public String getOdr_sdate() {
		return odr_sdate;
	}
	public void setOdr_sdate(String odr_sdate) {
		this.odr_sdate = odr_sdate;
	}
	public String getOdr_cdate() {
		return odr_cdate;
	}
	public void setOdr_cdate(String odr_cdate) {
		this.odr_cdate = odr_cdate;
	}
	public String getOdr_condition() {
		return odr_condition;
	}
	public void setOdr_condition(String odr_condition) {
		this.odr_condition = odr_condition;
	}
	public String getOdr_cby_no() {
		return odr_cby_no;
	}
	public void setOdr_cby_no(String odr_cby_no) {
		this.odr_cby_no = odr_cby_no;
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
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public String getDlv_sendaddr() {
		return dlv_sendaddr;
	}
	public void setDlv_sendaddr(String dlv_sendaddr) {
		this.dlv_sendaddr = dlv_sendaddr;
	}
	public String getMem_mil() {
		return mem_mil;
	}
	public void setMem_mil(String mem_mil) {
		this.mem_mil = mem_mil;
	}
	public int getTot_cont() {
		return tot_cont;
	}
	public void setTot_cont(int tot_cont) {
		this.tot_cont = tot_cont;
	}
	public String getOdr_condition2() {
		return odr_condition2;
	}
	public void setOdr_condition2(String odr_condition2) {
		this.odr_condition2 = odr_condition2;
	}
	public String getDlv_zonecode() {
		return dlv_zonecode;
	}
	public void setDlv_zonecode(String dlv_zonecode) {
		this.dlv_zonecode = dlv_zonecode;
	}
	public String getDlv_sendaddr2() {
		return dlv_sendaddr2;
	}
	public void setDlv_sendaddr2(String dlv_sendaddr2) {
		this.dlv_sendaddr2 = dlv_sendaddr2;
	}
}
