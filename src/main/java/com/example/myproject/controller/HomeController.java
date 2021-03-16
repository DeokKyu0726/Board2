package com.example.myproject.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class HomeController {
    @RequestMapping("/")
    public String home() {
        return "index";
    }


    @RequestMapping("/board")
    public String board() {
        return "/BoardFol/board";
    }

    @RequestMapping("/notepad")
    public String notepad() {
        return "/BoardFol/notepad";
    }

    @RequestMapping("/fighting")
    public String fighting() {
        return "/BoardFol/fighting";
    }

    @RequestMapping("/programming")
    public String programming() {
        return "/BoardFol/programming";
    }
    @RequestMapping("/academy")
    public String academy() {
        return "/BoardFol/academy";
    }
}


