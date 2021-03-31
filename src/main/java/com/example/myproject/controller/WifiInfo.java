package com.example.myproject.controller;


import com.example.myproject.Service.TestService;
import com.example.myproject.model.Wifimodel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;


@Controller
public class WifiInfo {
    @Autowired
    private TestService testService;

    @RequestMapping("/index1")
    private void getTest() throws Exception {
        List<Wifimodel>test = testService.getTest();
        for(int i = 0; i < test.size(); i++) {
            System.out.println(test.get(i).toString());
        }




    }



}
