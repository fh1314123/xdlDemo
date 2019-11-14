package com.xdl.service;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xdl.bean.XdlEtQuestion;
import com.xdl.bean.XdlEtQuestionOption;
import com.xdl.mapper.XdlEtQuestionDAO;

@Service("questionService")
public class XdlEtQuestionService {
	@Autowired
    private  XdlEtQuestionDAO  questionDao;
    @Transactional
	public  void   questionAdd(XdlEtQuestion  question) {
		
		int  qf = questionDao.insertEtQuestion(question);
		int  pf=0;
		// 考虑添加 试题对应的知识点  
		List<Integer>  points = question.getPointList();
		for (Integer point_id : points) {
			pf = questionDao.insertQuestionPoint(question.getId(), point_id);
			if (pf == 0) {
				break;
			}
		}
		// TODO 添加选项 
		int  of = 1;
		Map<String, String>  options =  question.getOptionsMap();
		for(Entry<String, String> entry : options.entrySet()) {
			XdlEtQuestionOption  option = new XdlEtQuestionOption(0,
				question.getId(), entry.getKey(), entry.getValue());
			of = questionDao.insertQuestionOption(option);
			if(of == 0) {
				break;
			}
		}
		
		//pf = 0;
		if(0 == qf || 0 == pf || 0 == of) {
			throw  new RuntimeException("试题添加失败");
		}
		
		
	}
}
