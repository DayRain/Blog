package com.ph.pojo;

import com.ph.pojo.Article;

import java.util.List;

public class Classify {
    private Integer classifyId;
    private Integer bloggerId;
    private  String classifyName;
    private List<Article>articles;

    public Integer getClassifyId() {
        return classifyId;
    }

    public void setClassifyId(Integer classifyId) {
        this.classifyId = classifyId;
    }

    public Integer getBloggerId() {
        return bloggerId;
    }

    public void setBloggerId(Integer bloggerId) {
        this.bloggerId = bloggerId;
    }

    public String getClassifyName() {
        return classifyName;
    }

    public void setClassifyName(String classifyName) {
        this.classifyName = classifyName;
    }

    public List<Article> getArticles() {
        return articles;
    }

    public void setArticles(List<Article> articles) {
        this.articles = articles;
    }

    @Override
    public String toString() {
        return "Classify{" +
                "classifyId=" + classifyId +
                ", bloggerId=" + bloggerId +
                ", classifyName=" + classifyName +
                ", articles=" + articles +
                '}';
    }
}
