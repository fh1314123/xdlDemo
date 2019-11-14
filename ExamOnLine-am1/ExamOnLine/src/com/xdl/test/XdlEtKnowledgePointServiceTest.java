package com.xdl.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xdl.service.XdlEtAdminService;
import com.xdl.service.XdlEtKnowledgePointService;

public class XdlEtKnowledgePointServiceTest {

	public static void main(String[] args) {
		ApplicationContext  app  = 
				new ClassPathXmlApplicationContext("applicationContext.xml");
	     XdlEtKnowledgePointService pointService =  
	    		app.getBean("knowledgePointService",
	        	XdlEtKnowledgePointService.class);
	     System.out.println(pointService.knowledgePointAll());

	}

}
