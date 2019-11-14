package com.xdl.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xdl.bean.XdlEtQuestion;
import com.xdl.service.XdlEtQuestionService;
@Controller
public class XdlEtQuestionController {
	@Autowired
	private XdlEtQuestionService  questionService;
    @RequestMapping(value="/admin/questionAdd",method=RequestMethod.POST)
    @ResponseBody
	public  Map<String,String>  addQuestion(@RequestBody XdlEtQuestion  question) {
		Map<String, String>  message = new  HashMap<String, String>();
		System.out.println(question);
		try {
			questionService.questionAdd(question);
			message.put("result", "success");
		} catch (Exception e) {
			message.put("result", "failed");
			e.printStackTrace();
		}
		
		return  message;
	}
}
