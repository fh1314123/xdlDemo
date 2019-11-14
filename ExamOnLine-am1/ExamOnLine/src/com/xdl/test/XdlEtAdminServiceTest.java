package com.xdl.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xdl.service.XdlEtAdminService;

public class XdlEtAdminServiceTest {

	public static void main(String[] args) {
		ApplicationContext  app  = 
			new ClassPathXmlApplicationContext("applicationContext.xml");
        XdlEtAdminService adminService =  app.getBean("adminService",
        	XdlEtAdminService.class);
        System.out.println(adminService.login("abc", "123"));
	}

}
