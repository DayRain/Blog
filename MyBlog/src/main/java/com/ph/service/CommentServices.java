package com.ph.service;

import com.ph.pojo.Comment;
import com.ph.pojo.Page;

import java.util.List;

public interface CommentServices {


    //添加一条评论
    Integer insertComment(Comment comment);

    //查找评论
    List<Comment> queryCommentsByArticleId(Integer articleId);

    //统计未读评论数目
    Integer countCommentsWithoutChecked(Integer bloggerId);

    List<Comment> queryCommentsWithBloggerId(Integer bloggerId);

    Page<Comment> queryCommentsByPage(int currPage, Integer bloggerId, int pageSize);

    Integer delCommentByCommentId(Integer commentId);

    Integer changeStatus(Integer articleId);
}
