package com.ph.controller;

import com.ph.pojo.Blogger;
import com.ph.pojo.Message;
import com.ph.service.MessageServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@RequestMapping("/message")
@Controller
public class MessageController {
    @Autowired
    MessageServices messageServices;
    @RequestMapping("/toLeaveMessage")
    public String toLeaveMessage(){
        return "message";
    }
    @ResponseBody
    @RequestMapping("/messageSave")
    public Integer messageSave(@RequestBody Message message){
        message.setMessageCreateTime(new Date());
        return messageServices.insertMessage(message);
    }

    @RequestMapping("/toDetailMessages")
    public String toDetail(HttpSession session, Model model){
        Blogger blogger= (Blogger) session.getAttribute("blogger");
        List<Message>messages=messageServices.queryPublicViaBloggerId(blogger.getBloggerId());
        model.addAttribute("messages",messages);
        return "detailMessages";
    }
    @RequestMapping("/messageManage")
    public String messageManage(HttpSession session, Model model){
        Blogger blogger= (Blogger) session.getAttribute("blogger");
        List<Message>messages=messageServices.queryAllViaBloggerId(blogger.getBloggerId());
        model.addAttribute("messages",messages);
        return "messageManage";
    }
    @RequestMapping("/delMessage/{messageId}")
    public ModelAndView delMessage(@PathVariable Integer messageId){
       Integer res =messageServices.delMessageViaId(messageId);
        System.out.println(res);
        return new ModelAndView("redirect:/message/messageManage");
    }

    @RequestMapping("/chmod/{messageId}/{messageOpen}")
    public ModelAndView changeMod(@PathVariable("messageId") Integer messageId,@PathVariable("messageOpen") Integer messageOpen){

        if(messageOpen==0){
            messageServices.changeToOpen(messageId);
        }else{
            messageServices.changeToSecret(messageId);
        }
        return new ModelAndView("redirect:/message/messageManage");
    }
}
