package com.example.myproject.controller;


import com.example.myproject.model.Test;
import com.example.myproject.repository.TestapiRepository;
import com.example.myproject.view.TestView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @Autowired
    private TestapiRepository testapiRepository;




    @RequestMapping(value = "/api/tes2t", method = RequestMethod.GET)
    @ResponseBody
    public TestView getTest(){



        Test test1 = testapiRepository.findTop1ByOAndOfficecode("1");




        return TestView.convert(test1);
    }
}
