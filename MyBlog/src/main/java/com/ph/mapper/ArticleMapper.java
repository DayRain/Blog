package com.ph.mapper;

import com.ph.pojo.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleMapper {
    //查询博主文章
    List<Article> selectArticleByBloggerId(@Param("bloggerId") Integer bloggerId);

    //插入一篇文章
    Integer insertArticle(Article article);

    //根据文章的id删除文章
    Integer delArticleById(@Param("articleId") Integer articleId);

    List<Article> selectArticlesAfterPaging(@Param("beforePages") Integer beforePages, @Param("articlesOfpage") Integer articlesOfpage, @Param(("bloggerId")) Integer bloggerId);

    //通过文章id获取文章
    Article getArticleByArticleId(Integer articleId);

    //根绝博主id查文章的总数
    Integer countArticlesByBloggerId(Integer bloggerId);

    //分页查询
    List<Article> selectByPage(@Param("start") Integer start,@Param("size") Integer size,@Param("bloggerId")Integer bloggerId);

    Integer countArticlesSearchByBloggerId(@Param("bloggerId") Integer bloggerId, @Param("keyWords") String keyWords);

    List<Article> selectArticlesSearchByPage(@Param("start") Integer start,@Param("pageSize") int pageSize,@Param("bloggerId") Integer bloggerId, @Param("keyWords") String keyWords);

    Integer changeStatus(Integer articleId);

    Integer updateArticle(Article article);

    //根据分类名，获取文章
    List<Article>getArticlesByClassifyName(@Param("classifyName") String classifyName,@Param("bloggerId") Integer bloggerId);

    Integer countArticlesByClassifyName(@Param("bloggerId") Integer bloggerId,@Param("classifyName") String classifyName);

    List<Article> selectArticlesByClassifyName(@Param("start") Integer start,@Param("pageSize")int pageSize,@Param("bloggerId")Integer bloggerId,@Param("classifyName")String classifyName);
}
