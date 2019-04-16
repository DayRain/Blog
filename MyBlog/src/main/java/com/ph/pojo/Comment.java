package com.ph.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Comment {
    private Integer commentId;
    private Integer articleId;
    private String commentContent;
    private String commentEmail;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date commentCreateTime;
    private String commentName;
    private Integer commentChecked;//是否已读
    private String articleTitle;//被迫加上

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public String getCommentEmail() {
        return commentEmail;
    }

    public void setCommentEmail(String commentEmail) {
        this.commentEmail = commentEmail;
    }

    public Date getCommentCreateTime() {
        return commentCreateTime;
    }

    public void setCommentCreateTime(Date commentCreateTime) {
        this.commentCreateTime = commentCreateTime;
    }

    public String getCommentName() {
        return commentName;
    }

    public void setCommentName(String commentName) {
        this.commentName = commentName;
    }

    public Integer getCommentChecked() {
        return commentChecked;
    }

    public void setCommentChecked(Integer commentChecked) {
        this.commentChecked = commentChecked;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "commentId=" + commentId +
                ", articleId=" + articleId +
                ", commentContent='" + commentContent + '\'' +
                ", commentEmail='" + commentEmail + '\'' +
                ", commentCreateTime=" + commentCreateTime +
                ", commentName='" + commentName + '\'' +
                ", commentChecked=" + commentChecked +
                '}';
    }
}
