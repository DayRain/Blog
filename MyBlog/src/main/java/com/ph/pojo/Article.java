package com.ph.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
import java.util.List;

public class Article {
    private Integer articleId;
    private String articleTitle;
    private Integer writerId;
    //或者 @DateTimeFormat
    @JsonFormat( pattern="yyyy-MM-dd HH:mm:ss")
    private Date articleCreateTime;
    private String articleContent;
    private Integer articlePageview;
    private String classifyName;
    private Integer articleComments;
    private List<Comment>comments;

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }

    public Integer getWriterId() {
        return writerId;
    }

    public void setWriterId(Integer writerId) {
        this.writerId = writerId;
    }

    public Date getArticleCreateTime() {
        return articleCreateTime;
    }

    public void setArticleCreateTime(Date articleCreateTime) {
        this.articleCreateTime = articleCreateTime;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent;
    }

    public Integer getArticlePageview() {
        return articlePageview;
    }

    public void setArticlePageview(Integer articlePageview) {
        this.articlePageview = articlePageview;
    }

    public String getClassifyName() {
        return classifyName;
    }

    public void setClassifyName(String classifyName) {
        this.classifyName = classifyName;
    }

    public Integer getArticleComments() {
        return articleComments;
    }

    public void setArticleComments(Integer articleComments) {
        this.articleComments = articleComments;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    @Override
    public String toString() {
        return "Article{" +
                "articleId=" + articleId +
                ", articleTitle='" + articleTitle + '\'' +
                ", writerId=" + writerId +
                ", articleCreateTime=" + articleCreateTime +
                ", articleContent='" + articleContent + '\'' +
                ", articlePageview=" + articlePageview +
                ", classifyId='" + classifyName + '\'' +
                ", articleComments=" + articleComments +
                '}';
    }
}
