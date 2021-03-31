package com.example.myproject.mapper;

import com.example.myproject.model.Wifimodel;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface Testmapper {

    List<Wifimodel> getTest() throws Exception;



}
