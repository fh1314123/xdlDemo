package com.xdl.bean;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

public class XdlEtQuestion implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
   
    
	
	@Override
	public String toString() {
		return "XdlEtQuestion [id=" + id + ", description=" + description + ", question_type_id=" + question_type_id
				+ ", points=" + points + ", group_id=" + group_id + ", is_visible=" + is_visible + ", create_time="
				+ create_time + ", creator=" + creator + ", last_modify=" + last_modify + ", answer=" + answer
				+ ", expose_times=" + expose_times + ", right_times=" + right_times + ", wrong_times=" + wrong_times
				+ ", difficulty=" + difficulty + ", analysis=" + analysis + ", reference=" + reference
				+ ", examing_point=" + examing_point + ", keyword=" + keyword + ", pointList=" + pointList
				+ ", optionsMap=" + optionsMap + ", question_score=" + question_score + "]";
	}
	public XdlEtQuestion(int id, String description, int question_type_id, Timestamp create_time, String creator) {
		super();
		this.id = id;
		this.description = description;
		this.question_type_id = question_type_id;
		this.create_time = create_time;
		this.creator = creator;
	}
	public XdlEtQuestion(int id, String description, int question_type_id, int points, int group_id, int is_visible,
			Timestamp create_time, String creator, Timestamp last_modify, String answer, int expose_times,
			int right_times, int wrong_times, double difficulty, String analysis, String reference,
			String examing_point, String keyword) {
		super();
		this.id = id;
		this.description = description;
		this.question_type_id = question_type_id;
		this.points = points;
		this.group_id = group_id;
		this.is_visible = is_visible;
		this.create_time = create_time;
		this.creator = creator;
		this.last_modify = last_modify;
		this.answer = answer;
		this.expose_times = expose_times;
		this.right_times = right_times;
		this.wrong_times = wrong_times;
		this.difficulty = difficulty;
		this.analysis = analysis;
		this.reference = reference;
		this.examing_point = examing_point;
		this.keyword = keyword;
	}
	public XdlEtQuestion() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getQuestion_type_id() {
		return question_type_id;
	}
	public void setQuestion_type_id(int question_type_id) {
		this.question_type_id = question_type_id;
	}
	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public int getIs_visible() {
		return is_visible;
	}
	public void setIs_visible(int is_visible) {
		this.is_visible = is_visible;
	}
	public Timestamp getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public Timestamp getLast_modify() {
		return last_modify;
	}
	public void setLast_modify(Timestamp last_modify) {
		this.last_modify = last_modify;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getExpose_times() {
		return expose_times;
	}
	public void setExpose_times(int expose_times) {
		this.expose_times = expose_times;
	}
	public int getRight_times() {
		return right_times;
	}
	public void setRight_times(int right_times) {
		this.right_times = right_times;
	}
	public int getWrong_times() {
		return wrong_times;
	}
	public void setWrong_times(int wrong_times) {
		this.wrong_times = wrong_times;
	}
	public double getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(double difficulty) {
		this.difficulty = difficulty;
	}
	public String getAnalysis() {
		return analysis;
	}
	public void setAnalysis(String analysis) {
		this.analysis = analysis;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public String getExaming_point() {
		return examing_point;
	}
	public void setExaming_point(String examing_point) {
		this.examing_point = examing_point;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public List<Integer> getPointList() {
		return pointList;
	}
	public void setPointList(List<Integer> pointList) {
		this.pointList = pointList;
	}

	public Map<String, String> getOptionsMap() {
		return optionsMap;
	}
	public void setOptionsMap(Map<String, String> optionsMap) {
		this.optionsMap = optionsMap;
	}
    
	public double getQuestion_score() {
		return question_score;
	}
	public void setQuestion_score(double question_score) {
		this.question_score = question_score;
	}

	private  int id;
	private  String description;
	private  int question_type_id;
	private  int points;
	private  int group_id;
	private  int is_visible;
	private  Timestamp create_time;
	private  String creator;
	private  Timestamp last_modify;
	private  String answer;
	private  int expose_times;
	private  int right_times;
	private  int wrong_times;
	private  double difficulty;
	private  String  analysis;
	private  String reference;
	private  String examing_point;
	private  String keyword;
	// 设置存放知识点id 的列表
	private  List<Integer>  pointList;
	// 存放选项的 Map
	private  Map<String,String> optionsMap; 
	// 具体试卷中 一个问题对应的分数
	private   double   question_score;
}





