package com.example.myproject.controller;

import com.example.myproject.model.Wifimodel;
import com.example.myproject.repository.WifiRepository;
import com.example.myproject.view.WifiView;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class WifiInfo {


    @Autowired
    private WifiRepository wifiRepository;

    @RequestMapping(value = "/api/wifi", method = RequestMethod.GET)
    @ResponseBody
    public List<WifiView> getWifi(){// db에 쿼리를 날려 api에 보여주는 함수

        List<Wifimodel> list = wifiRepository.findByINXIn(Lists.newArrayList(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24)); //id를 정해 1부터 24번 inx에서 가지고옴

        return WifiView.convert(list);
    }

    @RequestMapping(value = "/api/trends1", method = RequestMethod.GET)
    @ResponseBody
    public WifiView getTrends1() {
        Wifimodel wifimodel = wifiRepository.findTopByOrderByINXDesc();
        return WifiView.convert(wifimodel);


    }
}
