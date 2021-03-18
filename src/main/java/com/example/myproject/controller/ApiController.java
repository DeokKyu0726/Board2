package com.example.myproject.controller;


import com.example.myproject.model.Test;
import com.example.myproject.repository.TestapiRepository;
import com.example.myproject.view.TestView;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.w3c.dom.stylesheets.LinkStyle;

import java.util.List;

@RestController
public class ApiController {

    @Autowired
    private TestapiRepository testapiRepository;


    @RequestMapping(value = "/api/apitest", method=RequestMethod.GET)
    @ResponseBody
    public TestView getTest(){

        List<Test> list = testapiRepository.findByCityIn();



        return TestView.convert(list.get(1));
    }

}
