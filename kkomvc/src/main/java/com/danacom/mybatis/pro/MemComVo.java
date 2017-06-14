package com.danacom.mybatis.pro;

public class MemComVo{
	
	private int mem_no;
	private String mem_id;
	private String mem_pass;
	private String mem_name;
	private String mem_email;
	private String mem_hp;
	private String mem_tel;
	private String mem_zonecode;
	private String mem_addr;
	private String mem_addr2;
	private int mem_mil;
	private String mem_rdate;
	private String mem_admin_autho;
	private String msg;
	private int cmd;
	
	private int tot_cont;
	
	public MemComVo() {
	}
	public MemComVo(int mem_no, String mem_id, String mem_pass, String mem_name, String mem_email, String mem_hp,
			String mem_tel, String mem_zonecode, String mem_addr, String mem_addr2, int mem_mil, String mem_rdate,
			String mem_admin_autho, String msg, int cmd) {
		super();
		this.mem_no = mem_no;
		this.mem_id = mem_id;
		this.mem_pass = mem_pass;
		this.mem_name = mem_name;
		this.mem_email = mem_email;
		this.mem_hp = mem_hp;
		this.mem_tel = mem_tel;
		this.mem_zonecode = mem_zonecode;
		this.mem_addr = mem_addr;
		this.mem_addr2 = mem_addr2;
		this.mem_mil = mem_mil;
		this.mem_rdate = mem_rdate;
		this.mem_admin_autho = mem_admin_autho;
		this.msg = msg;
		this.cmd = cmd;
	}


	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pass() {
		return mem_pass;
	}

	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
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

	public String getMem_hp() {
		return mem_hp;
	}

	public void setMem_hp(String mem_hp) {
		this.mem_hp = mem_hp;
	}

	public int getMem_mil() {
		return mem_mil;
	}

	public void setMem_mil(int mem_mil) {
		this.mem_mil = mem_mil;
	}

	public String getMem_rdate() {
		return mem_rdate;
	}

	public void setMem_rdate(String mem_rdate) {
		this.mem_rdate = mem_rdate;
	}

	public String getMem_admin_autho() {
		return mem_admin_autho;
	}

	public void setMem_admin_autho(String mem_admin_autho) {
		this.mem_admin_autho = mem_admin_autho;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	public int getCmd() {
		return cmd;
	}

	public void setCmd(int cmd) {
		this.cmd = cmd;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}


	public String getMem_zonecode() {
		return mem_zonecode;
	}


	public void setMem_zonecode(String mem_zonecode) {
		this.mem_zonecode = mem_zonecode;
	}


	public String getMem_addr2() {
		return mem_addr2;
	}


	public void setMem_addr2(String mem_addr2) {
		this.mem_addr2 = mem_addr2;
	}
	public int getTot_cont() {
		return tot_cont;
	}
	public void setTot_cont(int tot_cont) {
		this.tot_cont = tot_cont;
	}
	
}
