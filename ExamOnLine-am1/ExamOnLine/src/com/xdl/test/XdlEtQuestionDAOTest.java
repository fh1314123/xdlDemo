package com.xdl.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xdl.mapper.XdlEtQuestionDAO;

public class XdlEtQuestionDAOTest {

	public static void main(String[] args) {
		ApplicationContext  app  = 
		 new ClassPathXmlApplicationContext("applicationContext.xml");
        XdlEtQuestionDAO  dao = app.getBean(XdlEtQuestionDAO.class);
        System.out.println(dao.getQuestionListByQuestionTypeAndQuestionNum(1,
        	3));
	}

}
