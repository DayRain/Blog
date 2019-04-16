package com.ph.service.serviceImp;

import com.ph.mapper.ArticleMapper;
import com.ph.pojo.Article;
import com.ph.pojo.Page;
import com.ph.service.ArticleServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("articleServiceImp")
public class ArticleServiceImp implements ArticleServices {
   @Autowired
   ArticleMapper articleMapper = null;
    @Override
    public List<Article> selectArticlesByBloggerId(Integer bloggerId) {

        return articleMapper.selectArticleByBloggerId(bloggerId);
    }

    @Override
    public Integer insertArticle(Article article) {
        return articleMapper.insertArticle(article);
    }

    @Override
    public Integer delArticleById(Integer articleId) {
        return articleMapper.delArticleById(articleId);
    }

    @Override
    public List<Article> selectArticlesAfterPaging(Integer beforePages, Integer articlesOfpage, Integer bloggerId) {
        return articleMapper.selectArticlesAfterPaging(beforePages,articlesOfpage,bloggerId);
    }

    @Override
    public Article getArticleByArticleId(Integer articleId) {
        return articleMapper.getArticleByArticleId(articleId);
    }

    @Override
    public Page<Article> findByPage(Integer currPage,Integer bloggerId,Integer pageSize) {
        Page<Article> page = new Page<>();
        page.setCurrPage(currPage);
        page.setPageSize(pageSize);
        page.setTotalCount(articleMapper.countArticlesByBloggerId(bloggerId));

        Double totalPage = Math.ceil(page.getTotalCount()/(double)page.getPageSize());
        page.setTotalPage(totalPage.intValue());
        Integer start = (currPage-1)*pageSize;
        page.setLists(articleMapper.selectByPage(start,pageSize,bloggerId));
        return page;
    }

    @Override
    public Page<Article> findByPageWithCondition(int currPage, Integer bloggerId, int pageSize,String keyWords) {
        Page<Article> page = new Page<>();
        page.setCurrPage(currPage);
        page.setPageSize(pageSize);
        page.setTotalCount(articleMapper.countArticlesSearchByBloggerId(bloggerId,keyWords));

        Double totalPage = Math.ceil(page.getTotalCount()/(double)page.getPageSize());
        page.setTotalPage(totalPage.intValue());
        Integer start = (currPage-1)*pageSize;
        page.setLists(articleMapper.selectArticlesSearchByPage(start,pageSize,bloggerId,keyWords));
        return page;
    }

    @Override
    public Integer changeStatus(Integer articleId) {
        return articleMapper.changeStatus(articleId);
    }

    @Override
    public Integer updateArticle(Article article) {
        return articleMapper.updateArticle(article);
    }

    @Override
    public List<Article> getArticlesByClassifyName(String classifyName, Integer bloggerId) {
        return articleMapper.getArticlesByClassifyName(classifyName,bloggerId);
    }
    @Override
    public Page<Article> findByPageWithClassifyName(int currPage, Integer bloggerId, int pageSize,String classifyName) {
        Page<Article> page = new Page<>();
        page.setCurrPage(currPage);
        page.setPageSize(pageSize);
        page.setTotalCount(articleMapper.countArticlesByClassifyName(bloggerId,classifyName));

        Double totalPage = Math.ceil(page.getTotalCount()/(double)page.getPageSize());
        page.setTotalPage(totalPage.intValue());
        Integer start = (currPage-1)*pageSize;
        page.setLists(articleMapper.selectArticlesByClassifyName(start,pageSize,bloggerId,classifyName));
        return page;
    }
}
