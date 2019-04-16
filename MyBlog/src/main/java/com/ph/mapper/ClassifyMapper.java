package com.ph.mapper;

import com.ph.pojo.Classify;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClassifyMapper {

    //根据博主id查询所有分类
    List<Classify>queryAllClassifyWithBloggerId(Integer bloggerId);
    //添加分类
    Integer addClassify(@Param("bloggerId") Integer bloggerId,@Param("classifyName") String classifyName);

    Integer countClassify(Integer classifyId);

    Integer countClassifyByName(String classifyName);
}
