package com.xdl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xdl.bean.XdlEtAdmin;
import com.xdl.bean.XdlEtKnowledgePoint;
import com.xdl.service.XdlEtAdminService;
import com.xdl.service.XdlEtKnowledgePointService;

@Controller
@RequestMapping("/admin")
public class XdlEtAdminController {
	  @Autowired
	  private XdlEtAdminService  adminService;
	  @Autowired
	  private XdlEtKnowledgePointService  pointService;
	  @RequestMapping("/toLogin")
      public  String toLogin() {
    	  return "admin/login";
      }
	  /** 登录成功 跳转到试题添加页面  不成功  提示登录失败  */
	  @RequestMapping("/login")
	  public  String  login(String name,String password,HttpServletRequest request) {
		  XdlEtAdmin  admin  = adminService.login(name, password);
		  if(admin != null) {
			  List<XdlEtKnowledgePoint>  knowlegePoints = pointService.knowledgePointAll();
			  request.setAttribute("knowlegePoints", knowlegePoints);
			  request.getSession().setAttribute("admin", admin);
			  return  "admin/question-add";
		  }
		  request.setAttribute("msg", "登录失败");
		  return  "admin/login";
	  }
	  
}
