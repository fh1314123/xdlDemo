package com.xdl.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xdl.bean.XdlEtPaper;
import com.xdl.service.XdlEtExamPaperService;

@Controller
public class XdlEtExamPaperController {
	 @Autowired
	 private  XdlEtExamPaperService   paperService;
	 
	 @RequestMapping("/admin/toUserList")
     public  String  toUserList() {
    	 return  "admin/user-list";
     }
	 
	 @RequestMapping("/admin/toAddUser")
     public  String  toAddUser() {
    	 return  "admin/add-user";
     }
	 
	 @RequestMapping("/admin/toExamPaperList")
     public  String  toExamPaperList() {
    	 return  "admin/exampaper-list";
     }
	 @RequestMapping("/admin/toExamPaperPreView")
     public  String  toExamPaperPreView() {
    	 return  "admin/exampaper-preview";
     }
	 @RequestMapping("/admin/toExamPaperAdd")
     public  String  toExamPaperAdd() {
    	 return  "admin/exampaper-add";
     }
	 /** 生成试卷的方法 */
	 @RequestMapping(value="/admin/examPaperAdd",method=RequestMethod.POST)
	 @ResponseBody
	 public  Map<String, Object>  examPaperAdd(@RequestBody XdlEtPaper  paper){
		 Map<String, Object>   message = new HashMap<String, Object>();
		 paper.setQuestions(
			paperService.paperQuestions(paper.getQuestionTypeNum()));
		 System.out.println(paper);
		 // 把试卷存入数据库  
		 try {
			paperService.paperAdd(paper);
			message.put("result", "success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			message.put("result", "failed");
		}
		 return  message; 
	 }
	 
}
