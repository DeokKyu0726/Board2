package com.example.myproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class HomeController {


    @RequestMapping("/")
    public String home() {
        return "index";


    }

    @RequestMapping("/seogwipo")
    public String fighting() {
        return "/SeogwipoFol/seogwipo";
    }

    @RequestMapping("/jejusi")
    public String programming() {
        return "/JejusiFol/jejusi";
    }
}


