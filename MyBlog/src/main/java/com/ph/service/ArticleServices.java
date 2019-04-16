package com.ph.service;

import com.ph.pojo.Article;
import com.ph.pojo.Page;

import java.util.List;

public interface ArticleServices {

   List<Article> selectArticlesByBloggerId(Integer bloggerId);

    Integer insertArticle(Article article);

    Integer delArticleById(Integer articleId);

    List<Article> selectArticlesAfterPaging(Integer beforePages, Integer articlesOfpage, Integer bloggerId);

    Article getArticleByArticleId(Integer articleId);

    Page<Article>findByPage(Integer currPage,Integer bloggerId,Integer pageSize);

    //首页查找反回的结果集
    Page<Article> findByPageWithCondition(int currPage, Integer bloggerId, int pageSize,String keyWords);

    Integer changeStatus(Integer articleId);

    Integer updateArticle(Article article);

    List<Article>getArticlesByClassifyName(String classifyName,Integer bloggerId);

    Page<Article> findByPageWithClassifyName(int currPage, Integer bloggerId, int pageSize,String classifyName);
}
