package com.zdd.core.po;

import java.sql.Timestamp;

public class Award {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String number;
	private String name;
	private String reason;
	private String explains;
	private String createtime;
	private Integer start;            // 起始行
	private Integer rows;             // 所取行数
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
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	public String getExplains() {
		return explains;
	}
	public void setExplains(String explains) {
		this.explains = explains;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public void setCreatetime(Timestamp timeStamp) {
		// TODO Auto-generated method stub
		
	}

}
