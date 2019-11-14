package com.xdl.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xdl.bean.XdlEtPaper;
import com.xdl.bean.XdlEtQuestion;
import com.xdl.mapper.XdlEtPaperDAO;
import com.xdl.mapper.XdlEtQuestionDAO;
@Service
public class XdlEtExamPaperService {
	 @Autowired
     private  XdlEtQuestionDAO   questionDao;
	 @Autowired
     private  XdlEtPaperDAO   paperDao;
	 /** 根据试题类型 和 试题的个数 产生试卷对应的试题列表 */
	 public  List<XdlEtQuestion>  paperQuestions(Map<Integer, Integer> qustionTypeNums){
		 List<XdlEtQuestion> questions  = new ArrayList<XdlEtQuestion>();
		 for(Entry<Integer, Integer> entry : qustionTypeNums.entrySet()) {
			  questions.addAll(questionDao.getQuestionListByQuestionTypeAndQuestionNum(
					 entry.getKey(), entry.getValue()));
		 }
		 return  questions;
	 }
	 /** 把试卷信息和 试卷对应的试题信息 存入数据库 */
	 @Transactional
	 public  void  paperAdd(XdlEtPaper  paper) {
		 int  pf = paperDao.insertEtPaper(paper);
		 int  qf = 0;
		 Map<Integer, Double>  scores = paper.getQuestionTypePoint();
		 List<XdlEtQuestion> questions = paper.getQuestions();
		 int  qcount = questions.size();
		 for(int i=0;i<qcount;i++) {
			  XdlEtQuestion  question =  questions.get(i); 
			  qf = paperDao.insertEtPaperQuestion(paper.getId(),
				  question.getId(), i, scores.get(question.getQuestion_type_id()));
			  if(qf==0) {
				  break;
			  }
		 }
		 //qf = 0;
		 if(0 == pf || 0 == qf ) {
			 throw  new RuntimeException("试卷添加失败");
		 }
	 }
	 /** 根据id 查询 试卷信息 */
	 public  XdlEtPaper    paperInfoById(int id) {
		 return  paperDao.getEtPaperById(id);
	 }
}




