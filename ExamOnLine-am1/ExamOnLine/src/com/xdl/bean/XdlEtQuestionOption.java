package com.xdl.bean;

import java.io.Serializable;

public class XdlEtQuestionOption implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	public String toString() {
		return "XdlEtQuestionOption [question_2_option_id=" + question_2_option_id + ", question_id=" + question_id
				+ ", option_name=" + option_name + ", option_content=" + option_content + "]";
	}
	public XdlEtQuestionOption(int question_2_option_id, int question_id, String option_name, String option_content) {
		super();
		this.question_2_option_id = question_2_option_id;
		this.question_id = question_id;
		this.option_name = option_name;
		this.option_content = option_content;
	}
	public XdlEtQuestionOption() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getQuestion_2_option_id() {
		return question_2_option_id;
	}
	public void setQuestion_2_option_id(int question_2_option_id) {
		this.question_2_option_id = question_2_option_id;
	}
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	public String getOption_name() {
		return option_name;
	}
	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}
	public String getOption_content() {
		return option_content;
	}
	public void setOption_content(String option_content) {
		this.option_content = option_content;
	}
	private  int question_2_option_id;
	private  int question_id;
	private  String option_name;
	private  String option_content;  
}
