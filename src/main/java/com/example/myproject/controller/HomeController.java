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

    @RequestMapping("/board")
    public String board() { return "/boardFol/board"; }

    @RequestMapping("/boardForm")
    public String boardForm() { return "/boardFormFol/boardForm"; }

    @RequestMapping("/insert")
    public String insert() { return "/boardFormFol/insert"; }

    @RequestMapping("/boardup")
    public String boardup() { return "/boardFormFol/boardupdate"; }

    @RequestMapping("/proc")
    public String proc() { return "/boardFormFol/boardupdateproc"; }

    @RequestMapping("/Detail")
    public String Detail() { return "/boardFormFol/Detail"; }
}


