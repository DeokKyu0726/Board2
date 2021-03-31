package com.example.myproject.Service;

import com.example.myproject.mapper.Testmapper;
import com.example.myproject.model.Wifimodel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Service
public class TestService {

    @Autowired
    Testmapper testmapper;

    public List<Wifimodel> getTest() throws Exception {
        return testmapper.getTest();
    }




}
