package com.ph.service.serviceImp;

import com.ph.mapper.CommentMapper;
import com.ph.pojo.Article;
import com.ph.pojo.Comment;
import com.ph.pojo.Page;
import com.ph.service.CommentServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("CommentServiceImp")
public class CommentServicesImp implements CommentServices {
    @Autowired
    CommentMapper commentMapper=null;
    @Override
    public Integer insertComment(Comment comment) {
        return commentMapper.insertComment(comment);
    }

    @Override
    public List<Comment> queryCommentsByArticleId(Integer articleId) {
        return commentMapper.queryCommentsByArticleId(articleId);
    }

    @Override
    public Integer countCommentsWithoutChecked(Integer bloggerId) {
        return commentMapper.countCommentsWithoutChecked(bloggerId);
    }

    @Override
    public List<Comment> queryCommentsWithBloggerId(Integer bloggerId) {
        return commentMapper.queryCommentsByBloggerId(bloggerId);
    }

    @Override
    public Page<Comment> queryCommentsByPage(int currPage, Integer bloggerId, int pageSize) {
        Page<Comment> page = new Page<>();
        page.setCurrPage(currPage);
        page.setPageSize(pageSize);
        page.setTotalCount(commentMapper.countComments(bloggerId));

        Double totalPage = Math.ceil(page.getTotalCount()/ (double)page.getPageSize());
        page.setTotalPage(totalPage.intValue());
        Integer start = (currPage-1)*pageSize;
        page.setLists(commentMapper.selectByPage(start,pageSize,bloggerId));
        return page;
    }

    @Override
    public Integer delCommentByCommentId(Integer commentId) {
        return  commentMapper.delCommentByCommentId(commentId);
    }

    @Override
    public Integer changeStatus(Integer articleId) {
        return commentMapper.changeStatus(articleId);
    }
}
