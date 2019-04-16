package com.ph.service;


import com.ph.pojo.Article;
import com.ph.pojo.Classify;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClassifyServices {
    //根据博主id查询所有分类
    List<Classify> queryAllClassifyWithBloggerId(Integer bloggerId);
    //添加分类
    Integer addClassify(Integer bloggerId,String classifyName);

    Integer countClassify(Integer classifyId);

    Integer countClassifyByName(String classifyName);

//    初始化文章列表
    List<Classify> initArticles(List<Classify> classifies);
}
