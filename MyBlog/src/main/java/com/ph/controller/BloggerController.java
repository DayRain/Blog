package com.ph.controller;

import com.ph.pojo.*;
import com.ph.service.ArticleServices;
import com.ph.service.BloggerServices;
import com.ph.service.ClassifyServices;
import com.ph.service.MessageServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PreDestroy;
import javax.jws.WebParam;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@SessionAttributes(value = {"blogger"})
@RequestMapping("/blogger")
@Controller
public class BloggerController {
    @Autowired
    private BloggerServices bloggerServices;

    @Autowired
    private ArticleServices articleServices;

    @Autowired
    private ClassifyServices classifyServices;

    @Autowired
    private MessageServices messageServices;

    private static Blogger staticBlogger=null;

    @PreDestroy
    private void beforeDestroy(){
        if(staticBlogger != null){
            staticBlogger.setLastLogintime(new Date());
            bloggerServices.updateLoginTime(staticBlogger);
        }
    }

    @RequestMapping("/main")
    public String toMainPage(@RequestParam(value = "currPage",defaultValue = "1",required = false) int currPage,Model model,HttpSession session){
        Page<Article> page;
        Blogger blogger;
        List<Classify>classifies;
        List<Message>messages;
        if(session.getAttribute("blogger") == null){
           //游客状态
            blogger = new Blogger();
            blogger.setBloggerId(1);
            model.addAttribute("blogger",blogger);
        }else{
            blogger = (Blogger) session.getAttribute("blogger");
        }
        page= articleServices.findByPage(currPage,blogger.getBloggerId(),5);
        classifies= classifyServices.queryAllClassifyWithBloggerId(blogger.getBloggerId());
        classifyServices.initArticles(classifies);
        messages= messageServices.queryPublicViaBloggerId(blogger.getBloggerId());
        if(messages.size()>3){
            messages=messages.subList(0,3);
        }
        model.addAttribute("article",page.getLists());
        model.addAttribute("page",page);
        model.addAttribute("classify",classifies);
        model.addAttribute("messages",messages);
        return "bloggerMain";
    }
    @RequestMapping("/backstage")
    public String toBackStage(@RequestParam(value = "currPage",defaultValue = "1",required = false)int currPage,Model model,HttpSession session){
        Blogger blogger = (Blogger) session.getAttribute("blogger");
        Page<Article> page= articleServices.findByPage(currPage,blogger.getBloggerId(),8);
        model.addAttribute("article",page.getLists());
        model.addAttribute("page",page);
        return "bloggerBackStage";
    }
    @RequestMapping("/writeBlog")
    public String toWriteBlog(@RequestParam(value = "articleId",defaultValue = "0",required = false)Integer articleId, Model model,HttpSession session){
        Blogger blogger = (Blogger) session.getAttribute("blogger");
        List<Classify>list = classifyServices.queryAllClassifyWithBloggerId(blogger.getBloggerId());
        if(list != null){
            model.addAttribute("classify",list);
        }
        if(articleId >0){
            model.addAttribute("article",articleServices.getArticleByArticleId(articleId));
        }
        return "writeBlog";
    }
    @RequestMapping("/login")
    public String toLogin(){

        return "bloggerLogin";
    }
    @ResponseBody
    @RequestMapping("/checkInfo")
    public Blogger dealWithLogin(@RequestBody Blogger blogger, Model model,HttpSession httpSession){

        if(!blogger.getBloggerMail().equals("") && !blogger.getBloggerPassword().equals("")){
            blogger = bloggerServices.checkInfo(blogger);
            if(blogger != null){
                if(blogger.getLastLogintime() == null){
                    blogger.setLastLogintime(new Date());
                    bloggerServices.updateLoginTime(blogger);
                }
                model.addAttribute("blogger",blogger);
            }
        }
        return blogger;
    }

    @RequestMapping("/searchMain")
    public String searchMain(@RequestParam(value = "currPage",defaultValue = "1",required = false) int currPage,@RequestParam(value = "keyWords")String keyWords, Model model,HttpSession session){
        Page<Article> page;
        List<Classify>classifies;
        List<Message>messages;
        Blogger blogger = (Blogger) session.getAttribute("blogger");
        page= articleServices.findByPageWithCondition(currPage,blogger.getBloggerId(),1000,keyWords);
        page.setCurrPage(currPage);
        page.setTotalPage(currPage);//强制不分页，设计弊端的体现，首页分页依赖下一页上一页，或者说控制器接口耦合大
        classifies=classifyServices.queryAllClassifyWithBloggerId(blogger.getBloggerId());
        classifyServices.initArticles(classifies);
        messages=messageServices.queryPublicViaBloggerId(blogger.getBloggerId());
        model.addAttribute("article",page.getLists());
        model.addAttribute("page",page);
        model.addAttribute("classify",classifies);
        model.addAttribute("messages",messages);
        return "bloggerMain";
    }

    @RequestMapping("/mainAfterClassify/{classifyName}")
    public String mainAfterClassify(@RequestParam(value = "currPage",defaultValue = "1",required = false)Integer currPage,@PathVariable String classifyName,HttpSession session,Model model){
        Page<Article> page;
        List<Classify>classifies;
        List<Message>messages;
        Blogger blogger = (Blogger) session.getAttribute("blogger");
        page= articleServices.findByPageWithClassifyName(currPage,blogger.getBloggerId(),1000,classifyName);
        page.setCurrPage(currPage);
        page.setTotalPage(currPage);//强制不分页，设计弊端的体现，首页分页依赖下一页上一页，或者说控制器接口耦合大
        classifies=classifyServices.queryAllClassifyWithBloggerId(blogger.getBloggerId());
        classifyServices.initArticles(classifies);
        messages=messageServices.queryPublicViaBloggerId(blogger.getBloggerId());
        if(messages.size()>3){
            messages.subList(0,3);
        }
        model.addAttribute("article",page.getLists());
        model.addAttribute("page",page);
        model.addAttribute("classify",classifies);
        model.addAttribute("messages",messages);
        return "bloggerMain";
    }
    @RequestMapping("/aboutMe")
    public String aboutMe(){

        return "aboutMe";
    }
}
