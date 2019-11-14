package com.xdl.mapper;

import org.apache.ibatis.annotations.Param;

import com.xdl.bean.XdlEtPaper;

public interface XdlEtPaperDAO {
    int  insertEtPaper(XdlEtPaper  paper);
    int  insertEtPaperQuestion(@Param("paper_id")int  paper_id,
    		@Param("question_id")int question_id,
    		@Param("order_num")int order_num,
    		@Param("question_score")double question_score); 
    XdlEtPaper  getEtPaperById(int  id);
}
