package com.xdl.bean;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

public class XdlEtPaper implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    
	@Override
	public String toString() {
		return "XdlEtPaper [id=" + id + ", user_id=" + user_id + ", name=" + name + ", duration=" + duration
				+ ", total_point=" + total_point + ", pass_point=" + pass_point + ", is_visible=" + is_visible
				+ ", status=" + status + ", create_time=" + create_time + ", summary=" + summary + ", is_subjective="
				+ is_subjective + ", answer_sheet=" + answer_sheet + ", creator=" + creator + ", sum_score=" + sum_score
				+ ", difficulty=" + difficulty + ", questions=" + questions + ", questionTypeNum=" + questionTypeNum
				+ ", questionTypePoint=" + questionTypePoint + "]";
	}
	public XdlEtPaper(int id, int user_id, String name, int duration, int total_point, int pass_point, int is_visible,
			int status, Timestamp create_time, String summary, int is_subjective, String answer_sheet, String creator,
			double sum_score, double difficulty, List<XdlEtQuestion> questions) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.name = name;
		this.duration = duration;
		this.total_point = total_point;
		this.pass_point = pass_point;
		this.is_visible = is_visible;
		this.status = status;
		this.create_time = create_time;
		this.summary = summary;
		this.is_subjective = is_subjective;
		this.answer_sheet = answer_sheet;
		this.creator = creator;
		this.sum_score = sum_score;
		this.difficulty = difficulty;
		this.questions = questions;
	}
	public XdlEtPaper() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public int getTotal_point() {
		return total_point;
	}
	public void setTotal_point(int total_point) {
		this.total_point = total_point;
	}
	public int getPass_point() {
		return pass_point;
	}
	public void setPass_point(int pass_point) {
		this.pass_point = pass_point;
	}
	public int getIs_visible() {
		return is_visible;
	}
	public void setIs_visible(int is_visible) {
		this.is_visible = is_visible;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Timestamp getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public int getIs_subjective() {
		return is_subjective;
	}
	public void setIs_subjective(int is_subjective) {
		this.is_subjective = is_subjective;
	}
	public String getAnswer_sheet() {
		return answer_sheet;
	}
	public void setAnswer_sheet(String answer_sheet) {
		this.answer_sheet = answer_sheet;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public double getSum_score() {
		return sum_score;
	}
	public void setSum_score(double sum_score) {
		this.sum_score = sum_score;
	}
	public double getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(double difficulty) {
		this.difficulty = difficulty;
	}
	public List<XdlEtQuestion> getQuestions() {
		return questions;
	}
	public void setQuestions(List<XdlEtQuestion> questions) {
		this.questions = questions;
	}
	
	public Map<Integer, Integer> getQuestionTypeNum() {
		return questionTypeNum;
	}
	public void setQuestionTypeNum(Map<Integer, Integer> questionTypeNum) {
		this.questionTypeNum = questionTypeNum;
	}
	public Map<Integer, Double> getQuestionTypePoint() {
		return questionTypePoint;
	}
	public void setQuestionTypePoint(Map<Integer, Double> questionTypePoint) {
		this.questionTypePoint = questionTypePoint;
	}

	private  int id	;
	private  int user_id	;
	private  String name;
	private  int duration;
	private  int total_point;
	private  int pass_point	;
	private  int is_visible	;
	private  int status	;
	private  Timestamp create_time;
	private  String summary;
	private  int is_subjective;
	private  String answer_sheet;
	private  String creator;
	private  double sum_score;	
	private  double difficulty;	
    // 试卷中对应的试题
	private  List<XdlEtQuestion> questions;
	// 试题类型 和 对应数量 
	private  Map<Integer,Integer> questionTypeNum;
	// 试题类型 和 对应的分数 
	private   Map<Integer,Double>   questionTypePoint;  

}