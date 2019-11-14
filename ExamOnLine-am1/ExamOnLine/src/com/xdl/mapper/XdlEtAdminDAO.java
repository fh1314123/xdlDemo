package com.xdl.mapper;

import org.apache.ibatis.annotations.Param;

import com.xdl.bean.XdlEtAdmin;

public interface XdlEtAdminDAO {
     XdlEtAdmin   findEtAdminByNameAndPassword(
    	 @Param("name")String  name,
    	 @Param("password")String password);
}
