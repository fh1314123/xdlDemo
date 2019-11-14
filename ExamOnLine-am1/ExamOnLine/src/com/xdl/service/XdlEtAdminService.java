package com.xdl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xdl.bean.XdlEtAdmin;
import com.xdl.mapper.XdlEtAdminDAO;
@Service("adminService")
public class XdlEtAdminService {
	@Autowired
    private  XdlEtAdminDAO  adminDao;
    public  XdlEtAdmin   login(String name,String password) {
    	return  adminDao.findEtAdminByNameAndPassword(name, password);
    }
}
