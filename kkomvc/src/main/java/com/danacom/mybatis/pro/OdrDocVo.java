package com.danacom.mybatis.pro;

import java.util.List;

public class OdrDocVo {
	
	private String dlv_zonecode;
	private String dlv_sendaddr;
	private String dlv_sendaddr2;
	private String dlv_sender;
	private String dlv_tel;
	private String dlv_sphone;
	private String dlv_msg;
	private String odr_no_max;
	private String del_no_max;
	private int pro_no;
	private int pro_milege;
	private int pro_realprice;
	private int pro_disprice;
	private String pro_sprice;
	private String odt_dprice;
	private String odr_no;
	private int useMileage;
	private List list;
	private String rad_equal;

	private String mem_id;
	private int mem_no;
	
	private String cpn_apply[];
	
	private int cpn_no;
	private int cpn_price;
	private String mem_name;
	private String mem_hp;
	private int useMileageTot;
	private String odr_way;
	
	private int s_pro_no[];
	private int s_pro_disprice[];	
	private int s_pro_milege[];
	private int s_odt_pro_part[];
	private int s_odt_count[];
	private int s_mem_no[];
	
	private int s_totPrice;
	private int s_totMilege;
	private int tot_finalPrice;
	
	private int odr_condition;
	private int odr_mem_no;
	private int odr_delfare;
	private int odr_mileage;
	private int odr_amount;
	
	private String odr_odate;
	private String odr_sdate;
	private String odr_cdate;
	private String odr_condition2;
	
	private int sct_pro_muti;
	
	public String getDlv_sendaddr() {
		return dlv_sendaddr;
	}
	public void setDlv_sendaddr(String dlv_sendaddr) {
		this.dlv_sendaddr = dlv_sendaddr;
	}
	public String getDlv_sender() {
		return dlv_sender;
	}
	public void setDlv_sender(String dlv_sender) {
		this.dlv_sender = dlv_sender;
	}
	public String getDlv_tel() {
		return dlv_tel;
	}
	public void setDlv_tel(String dlv_tel) {
		this.dlv_tel = dlv_tel;
	}
	public String getDlv_sphone() {
		return dlv_sphone;
	}
	public void setDlv_sphone(String dlv_sphone) {
		this.dlv_sphone = dlv_sphone;
	}
	public String getDlv_msg() {
		return dlv_msg;
	}
	public void setDlv_msg(String dlv_msg) {
		this.dlv_msg = dlv_msg;
	}
	public String getOdr_no_max() {
		return odr_no_max;
	}
	public void setOdr_no_max(String odr_no_max) {
		this.odr_no_max = odr_no_max;
	}
	public String getDel_no_max() {
		return del_no_max;
	}
	public void setDel_no_max(String del_no_max) {
		this.del_no_max = del_no_max;
	}
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public int getPro_milege() {
		return pro_milege;
	}
	public void setPro_milege(int pro_milege) {
		this.pro_milege = pro_milege;
	}
	public int getPro_realprice() {
		return pro_realprice;
	}
	public void setPro_realprice(int pro_realprice) {
		this.pro_realprice = pro_realprice;
	}
	public int getPro_disprice() {
		return pro_disprice;
	}
	public void setPro_disprice(int pro_disprice) {
		this.pro_disprice = pro_disprice;
	}
	public String getPro_sprice() {
		return pro_sprice;
	}
	public void setPro_sprice(String pro_sprice) {
		this.pro_sprice = pro_sprice;
	}
	public String getOdt_dprice() {
		return odt_dprice;
	}
	public void setOdt_dprice(String odt_dprice) {
		this.odt_dprice = odt_dprice;
	}
	public String getOdr_no() {
		return odr_no;
	}
	public void setOdr_no(String odr_no) {
		this.odr_no = odr_no;
	}
	public int getUseMileage() {
		return useMileage;
	}
	public void setUseMileage(int useMileage) {
		this.useMileage = useMileage;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public String getRad_equal() {
		return rad_equal;
	}
	public void setRad_equal(String rad_equal) {
		this.rad_equal = rad_equal;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String[] getCpn_apply() {
		return cpn_apply;
	}
	public void setCpn_apply(String[] cpn_apply) {
		this.cpn_apply = cpn_apply;
	}
	public int getCpn_price() {
		return cpn_price;
	}
	public void setCpn_price(int cpn_price) {
		this.cpn_price = cpn_price;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_hp() {
		return mem_hp;
	}
	public void setMem_hp(String mem_hp) {
		this.mem_hp = mem_hp;
	}
	public int getUseMileageTot() {
		return useMileageTot;
	}
	public void setUseMileageTot(int useMileageTot) {
		this.useMileageTot = useMileageTot;
	}
	public String getOdr_way() {
		return odr_way;
	}
	public void setOdr_way(String odr_way) {
		this.odr_way = odr_way;
	}
	public int[] getS_pro_no() {
		return s_pro_no;
	}
	public void setS_pro_no(int[] s_pro_no) {
		this.s_pro_no = s_pro_no;
	}
	public int[] getS_pro_disprice() {
		return s_pro_disprice;
	}
	public void setS_pro_disprice(int[] s_pro_disprice) {
		this.s_pro_disprice = s_pro_disprice;
	}
	public int[] getS_pro_milege() {
		return s_pro_milege;
	}
	public void setS_pro_milege(int[] s_pro_milege) {
		this.s_pro_milege = s_pro_milege;
	}
	public int[] getS_odt_pro_part() {
		return s_odt_pro_part;
	}
	public void setS_odt_pro_part(int[] s_odt_pro_part) {
		this.s_odt_pro_part = s_odt_pro_part;
	}
	public int[] getS_odt_count() {
		return s_odt_count;
	}
	public void setS_odt_count(int[] s_odt_count) {
		this.s_odt_count = s_odt_count;
	}
	public int getS_totPrice() {
		return s_totPrice;
	}
	public void setS_totPrice(int price) {
		s_totPrice = price;
	}
	public int getS_totMilege() {
		return s_totMilege;
	}
	public void setS_totMilege(int milege) {
		s_totMilege = milege;
	}
	public int[] getS_mem_no() {
		return s_mem_no;
	}
	public void setS_mem_no(int[] s_mem_no) {
		this.s_mem_no = s_mem_no;
	}
	public int getCpn_no() {
		return cpn_no;
	}
	public void setCpn_no(int cpn_no) {
		this.cpn_no = cpn_no;
	}
	public int getTot_finalPrice() {
		return tot_finalPrice;
	}
	public void setTot_finalPrice(int tot_finalPrice) {
		this.tot_finalPrice = tot_finalPrice;
	}
	public int getOdr_condition() {
		return odr_condition;
	}
	public void setOdr_condition(int odr_condition) {
		this.odr_condition = odr_condition;
	}
	public int getOdr_mem_no() {
		return odr_mem_no;
	}
	public void setOdr_mem_no(int odr_mem_no) {
		this.odr_mem_no = odr_mem_no;
	}
	public int getOdr_delfare() {
		return odr_delfare;
	}
	public void setOdr_delfare(int odr_delfare) {
		this.odr_delfare = odr_delfare;
	}
	public int getOdr_mileage() {
		return odr_mileage;
	}
	public void setOdr_mileage(int odr_mileage) {
		this.odr_mileage = odr_mileage;
	}
	public int getOdr_amount() {
		return odr_amount;
	}
	public void setOdr_amount(int odr_amount) {
		this.odr_amount = odr_amount;
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
	public String getOdr_condition2() {
		return odr_condition2;
	}
	public void setOdr_condition2(String odr_condition2) {
		this.odr_condition2 = odr_condition2;
	}
	public int getSct_pro_muti() {
		return sct_pro_muti;
	}
	public void setSct_pro_muti(int sct_pro_muti) {
		this.sct_pro_muti = sct_pro_muti;
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
