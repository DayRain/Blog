package com.ph.controller;

import com.ph.pojo.Blogger;
import com.ph.pojo.Classify;
import com.ph.service.ClassifyServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/classify")
public class ClassifyController {
    @Autowired
    ClassifyServices classifyServices;

    @ResponseBody
    @RequestMapping("/getClassify")
    public List<Classify> getClassify(@RequestBody Blogger blogger){
        List<Classify> classify=null;
        if(blogger != null && blogger.getBloggerId()!=null){
            classify=classifyServices.queryAllClassifyWithBloggerId(blogger.getBloggerId());
        }
        return  classify;
    }
}
