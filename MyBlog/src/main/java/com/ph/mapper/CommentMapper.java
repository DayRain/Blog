package com.ph.mapper;

import com.ph.pojo.Article;
import com.ph.pojo.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentMapper {
    Integer insertComment(Comment comment);

    List<Comment> queryCommentsByArticleId(Integer articleId);

    Integer countComments(Integer bloggerId);


    List<Comment> queryCommentsByBloggerId(Integer bloggerId);

    List<Comment> selectByPage(@Param("start") Integer start, @Param("pageSize") int pageSize,@Param("bloggerId") Integer bloggerId);

    Integer delCommentByCommentId(Integer commentId);

    Integer countCommentsWithoutChecked(Integer bloggerId);

    Integer changeStatus(Integer articleId);
}
