package com.xdl.bean;

import java.io.Serializable;

public class XdlEtKnowledgePoint implements Serializable{
	
	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;
	@Override
	public String toString() {
		return "XdlEtKnowledgePoint [point_id=" + point_id + ", point_name=" + point_name + ", memo=" + memo
				+ ", state=" + state + "]";
	}
	public XdlEtKnowledgePoint(int point_id, String point_name, String memo, int state) {
		super();
		this.point_id = point_id;
		this.point_name = point_name;
		this.memo = memo;
		this.state = state;
	}
	public XdlEtKnowledgePoint() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getPoint_id() {
		return point_id;
	}
	public void setPoint_id(int point_id) {
		this.point_id = point_id;
	}
	public String getPoint_name() {
		return point_name;
	}
	public void setPoint_name(String point_name) {
		this.point_name = point_name;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	private  int  point_id;
	private  String point_name;
	private  String memo;
	private  int  state;
}
