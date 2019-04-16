package com.ph.service.serviceImp;

import com.ph.mapper.ArticleMapper;
import com.ph.mapper.ClassifyMapper;
import com.ph.pojo.Article;
import com.ph.pojo.Classify;
import com.ph.service.ArticleServices;
import com.ph.service.ClassifyServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassifyServiceImp implements ClassifyServices {

    @Autowired
    private ClassifyMapper classifyMapper;
    @Autowired
    private ArticleMapper articleMapper;
    @Override
    public List<Classify> queryAllClassifyWithBloggerId(Integer bloggerId) {
        return classifyMapper.queryAllClassifyWithBloggerId(bloggerId);
    }

    @Override
    public Integer addClassify(Integer bloggerId, String classifyName) {
        return classifyMapper.addClassify(bloggerId,classifyName);
    }

    @Override
    public Integer countClassify(Integer classifyId) {
        return classifyMapper.countClassify(classifyId);
    }

    @Override
    public Integer countClassifyByName(String classifyName) {
        return classifyMapper.countClassifyByName(classifyName);
    }

    @Override
    public List<Classify> initArticles(List<Classify> classifies) {

        for(Classify u:classifies){
            u.setArticles(articleMapper.getArticlesByClassifyName(u.getClassifyName(),u.getBloggerId()));
        }
        return classifies;
    }
}
