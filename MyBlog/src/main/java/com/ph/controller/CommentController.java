package com.ph.controller;

import com.ph.pojo.Blogger;
import com.ph.pojo.Comment;
import com.ph.pojo.Page;
import com.ph.service.CommentServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RequestMapping("/comment")
@Controller
public class CommentController {
    @Autowired
    CommentServices commentServices;

    @InitBinder
    public void init(WebDataBinder webDataBinder){
        //指定什么格式，前台传什么格式
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        simpleDateFormat.setLenient(false);
        webDataBinder.registerCustomEditor(Date.class,new CustomDateEditor(simpleDateFormat,false));
    }
    @ResponseBody
    @RequestMapping("/save")
    public Integer saveComment(@RequestBody Comment comment){
        if(comment.getCommentContent().equals("<p><br></p>")||comment.getCommentContent()=="<p><br></p>"){
            return 0;
        }
        comment.setCommentCreateTime(new Date());
        return commentServices.insertComment(comment);
    }

    @RequestMapping("/countUncheckedComments")
    @ResponseBody
    public Integer countComments(@RequestBody Integer bloggerId){
        return commentServices.countCommentsWithoutChecked(bloggerId);
    }
    @RequestMapping("/commentManage")
    public String commentManage(@RequestParam(value = "currPage",defaultValue = "1",required = false)int currPage, Model model, HttpSession session){
        Blogger blogger= (Blogger) session.getAttribute("blogger");
        List<Comment>comments=commentServices.queryCommentsWithBloggerId(blogger.getBloggerId());
        Page<Comment>page=commentServices.queryCommentsByPage(currPage,blogger.getBloggerId(),8);
        model.addAttribute("comments",comments);
        model.addAttribute("page",page);
        return "commentManage";
    }

    @RequestMapping("/delComment/{commentId}/{beforePage}")
    public String delComment(@PathVariable Integer commentId,@PathVariable Integer beforePage){
            commentServices.delCommentByCommentId(commentId);
            return "redirect:/comment/commentManage?currPage="+beforePage;
    }
    @RequestMapping("/delCommentAtPage/{commentId}/{articleId}/{beforePage}")
    public String delCommentAtPage(@PathVariable Integer commentId,@PathVariable Integer articleId,@PathVariable Integer beforePage){
        commentServices.delCommentByCommentId(commentId);
        String resPath="redirect:/article/articleDetail/"+articleId+"/"+beforePage;
        return resPath;
    }

}
