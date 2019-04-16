package com.ph.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/test")
public class TestController {
   @RequestMapping("/m1")
    public String m1(HttpSession httpSession){
        httpSession.setAttribute("sessionTest","session ........");
       return "test";
    }
}
