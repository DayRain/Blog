package com.ph.controller;

import com.ph.pojo.Article;
import com.ph.pojo.Classify;
import com.ph.pojo.Comment;
import com.ph.pojo.Message;
import com.ph.service.ArticleServices;
import com.ph.service.ClassifyServices;
import com.ph.service.CommentServices;
import com.ph.service.MessageServices;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Vector;

@RequestMapping("/article")
@Controller
public class ArticleController {
    @Autowired
    ArticleServices articleServices;

    @Autowired
    CommentServices commentServices;

    @Autowired
    ClassifyServices classifyServices;

    @Autowired
    MessageServices messageServices;

    @InitBinder
    public void init(WebDataBinder webDataBinder){
        //指定什么格式，前台传什么格式
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        simpleDateFormat.setLenient(false);
        webDataBinder.registerCustomEditor(Date.class,new CustomDateEditor(simpleDateFormat,false));
    }
//    @ResponseBody
//    @RequestMapping("/initMainPage")
//    public List<Article> initMainPage(@RequestBody Integer bloggerId){
//        List<Article>list = articleServices.selectArticlesByBloggerId(bloggerId);
//        if(list.size()<=5){
//            return list;
//        }else{
//            List<Article>list1=new Vector<>();
//            for(int i=0;i<5;i++){
//                list1.add(list.get(i));
//            }
//            return list1;
//        }
//    }

    @ResponseBody
    @RequestMapping("/save")
    public Integer saveArticle(@RequestBody Article article){

        if(article.getClassifyName()==null || article.getClassifyName().equals("")){
//            添加到默认分类
            article.setClassifyName("默认");
        }else{
            Integer count = classifyServices.countClassifyByName(article.getClassifyName());
            if(count==0){
                //添加新的类别
                classifyServices.addClassify(article.getWriterId(),article.getClassifyName());
            }
        }

        if(article.getArticleId()!=null){
            //修改
            return articleServices.updateArticle(article);
        }else{
            //插入新的数据
            article.setArticleCreateTime(new Date());
            return  articleServices.insertArticle(article);
        }

    }

    @ResponseBody
    @RequestMapping("/articleList")
    public List<Article> initArticleList(@RequestBody Integer bloggerId){
        List<Article>list = articleServices.selectArticlesByBloggerId(bloggerId);
        return list;
    }

    @RequestMapping("/delArticle/{articleId}")
    public String delArticle(@PathVariable Integer articleId){
        Integer res = articleServices.delArticleById(articleId);
        return "redirect:/blogger/backstage";
    }

//    @ResponseBody
//    @RequestMapping("/pagingNextArticles/{nowPages}")
//    public List<Article> getArticlesAfterNextPaging( @RequestBody Integer bloggerId,@PathVariable Integer nowPages){
//        Integer articlesOfpage = 5;//每页多少记录
//        Integer beforePages = nowPages * articlesOfpage;
//        List<Article>list = articleServices.selectArticlesAfterPaging(beforePages,articlesOfpage,bloggerId);
//        return list;
//    }

//    @ResponseBody
//    @RequestMapping("/pagingPreArticles/{nowPages}")
//    public List<Article> getArticlesAfterPrePaging( @RequestBody Integer bloggerId,@PathVariable Integer nowPages){
//        Integer articlesOfpage = 5;//每页多少记录
//        Integer beforePages = (nowPages-2) * articlesOfpage;
//        List<Article>list = articleServices.selectArticlesAfterPaging(beforePages,articlesOfpage,bloggerId);
//        return list;
//    }

    @RequestMapping("/articleDetail/{articleId}/{beforePage}")
    public String showArticleDetail(@PathVariable Integer articleId, @PathVariable Integer beforePage, Model model){

        Article article = articleServices.getArticleByArticleId(articleId);
        articleServices.changeStatus(article.getArticleId());//阅读数加1
        commentServices.changeStatus(article.getArticleId());//评论已读
        model.addAttribute("article",article);
        model.addAttribute("beforePage",beforePage);
        List<Comment>list=commentServices.queryCommentsByArticleId(articleId);
        List<Classify>classifies=classifyServices.queryAllClassifyWithBloggerId(article.getWriterId());
        classifies=classifyServices.initArticles(classifies);
        List<Message>messages= messageServices.queryPublicViaBloggerId(article.getWriterId());
        if(messages.size()>3){
            messages=messages.subList(0,3);
        }
        model.addAttribute("comments",list);
        model.addAttribute("classify",classifies);
        model.addAttribute("messages",messages);
        return "showArticle";
    }
}
