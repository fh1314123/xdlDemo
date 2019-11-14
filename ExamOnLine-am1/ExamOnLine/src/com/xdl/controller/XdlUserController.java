package com.xdl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xdl.bean.XdlEtPaper;
import com.xdl.service.XdlEtExamPaperService;
@Controller
public class XdlUserController {
	@Autowired
    private XdlEtExamPaperService  paperService;
	/** 根据试卷的id 显示考试试卷 */
	@RequestMapping("/user/paper/{id}")
	public  String toExamPaperPreView(@PathVariable int  id) {
		// 根据id 获取到试卷信息 
		XdlEtPaper  paper = paperService.paperInfoById(id);
		System.out.println(paper);
		return  "user/examing";
	}
}
