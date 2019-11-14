package com.xdl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xdl.bean.XdlEtKnowledgePoint;
import com.xdl.mapper.XdlEtKnowledgePointDAO;
@Service("knowledgePointService")
public class XdlEtKnowledgePointService {
	@Autowired
    private  XdlEtKnowledgePointDAO   knowledgePointDao;
    public   List<XdlEtKnowledgePoint>  knowledgePointAll(){
    	return  knowledgePointDao.findEtKnowledgePointAll();
    }
}
