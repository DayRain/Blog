package com.ph.pojo;

import java.util.Date;
import java.util.List;

public class Blogger {
    private Integer bloggerId;
    private String bloggerName;
    private String bloggerMail;
    private Date bloggerCreateDate;
    private String bloggerPassword;
    private Date lastLogintime;
    private List<Article>articles;
    private String loginTimeOfString;

    public Integer getBloggerId() {
        return bloggerId;
    }

    public void setBloggerId(Integer bloggerId) {
        this.bloggerId = bloggerId;
    }

    public String getBloggerName() {
        return bloggerName;
    }

    public void setBloggerName(String bloggerName) {
        this.bloggerName = bloggerName;
    }

    public String getBloggerMail() {
        return bloggerMail;
    }

    public void setBloggerMail(String bloggerMail) {
        this.bloggerMail = bloggerMail;
    }

    public Date getBloggerCreateDate() {
        return bloggerCreateDate;
    }

    public void setBloggerCreateDate(Date bloggerCreateDate) {
        this.bloggerCreateDate = bloggerCreateDate;
    }

    public String getBloggerPassword() {
        return bloggerPassword;
    }

    public void setBloggerPassword(String bloggerPassword) {
        this.bloggerPassword = bloggerPassword;
    }

    public Date getLastLogintime() {
        return lastLogintime;
    }

    public void setLastLogintime(Date lastLogintime) {
        this.lastLogintime = lastLogintime;
    }

    public List<Article> getArticles() {
        return articles;
    }

    public void setArticles(List<Article> articles) {
        this.articles = articles;
    }

    public String getLoginTimeOfString() {
        return loginTimeOfString;
    }

    public void setLoginTimeOfString(String loginTimeOfString) {
        this.loginTimeOfString = loginTimeOfString;
    }

    @Override
    public String toString() {
        return "Blogger{" +
                "bloggerId=" + bloggerId +
                ", bloggerName='" + bloggerName + '\'' +
                ", bloggerMail='" + bloggerMail + '\'' +
                ", bloggerCreateDate=" + bloggerCreateDate +
                ", bloggerPassword='" + bloggerPassword + '\'' +
                ", lastLogintime=" + lastLogintime +
                ", articles=" + articles +
                ", loginTimeOfString='" + loginTimeOfString + '\'' +
                '}';
    }
}
