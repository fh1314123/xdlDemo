package com.xdl.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xdl.bean.XdlEtQuestion;
import com.xdl.bean.XdlEtQuestionOption;

public interface XdlEtQuestionDAO {
    int   insertEtQuestion(XdlEtQuestion  question);
    /** 调用一次只能插入一个知识点  */
    int   insertQuestionPoint(@Param("question_id")int  question_id,
    	@Param("point_id") int point_id);
    int  insertQuestionOption(XdlEtQuestionOption  option);
    List<XdlEtQuestion> getQuestionListByQuestionTypeAndQuestionNum(
    	@Param("question_type_id")int  question_type_id,
    	@Param("question_num")int question_num);
}
