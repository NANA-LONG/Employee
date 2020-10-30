package com.zdd.core.po;

public class Department {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String department_number;
	private String department_name;
	private Integer start;            // 起始行
	private Integer rows;             // 所取行数
	
	public String getDepartment_number() {
		return department_number;
	}
	public void setDepartment_number(String department_number) {
		this.department_number = department_number;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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

	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}

}
