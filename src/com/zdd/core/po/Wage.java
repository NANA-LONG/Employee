package com.zdd.core.po;

public class Wage {
	
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String bills_number;
	private String base_pay;
	private String username;
	private String insurances_pay;
	private String merit_pay;
	private String subsidy_pay;
	private String sendtime;
	private String overtime_pay;
	private Integer start;            // 起始行
	private Integer rows;             // 所取行数
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public String getBills_number() {
		return bills_number;
	}
	public void setBills_number(String bills_number) {
		this.bills_number = bills_number;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getBase_pay() {
		return base_pay;
	}
	public void setBase_pay(String base_pay) {
		this.base_pay = base_pay;
	}
	public String getInsurances_pay() {
		return insurances_pay;
	}
	public void setInsurances_pay(String insurances_pay) {
		this.insurances_pay = insurances_pay;
	}
	public String getMerit_pay() {
		return merit_pay;
	}
	public void setMerit_pay(String merit_pay) {
		this.merit_pay = merit_pay;
	}
	public String getSubsidy_pay() {
		return subsidy_pay;
	}
	public void setSubsidy_pay(String subsidy_pay) {
		this.subsidy_pay = subsidy_pay;
	}
	public String getSendtime() {
		return sendtime;
	}
	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}
	public String getOvertime_pay() {
		return overtime_pay;
	}
	public void setOvertime_pay(String overtime_pay) {
		this.overtime_pay = overtime_pay;
	}

}
