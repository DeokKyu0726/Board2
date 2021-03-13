package com.example.myproject.controller;

import com.google.common.collect.Maps;
import com.example.myproject.model.Board;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.*;
import com.example.myproject.repository.Boardrepository;
import com.example.myproject.views.BoardControlView;

import java.util.Map;

@RestController
public class BoardControl {

    @Autowired
    private Boardrepository boardrepository;

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping(value= "/api/controls/board", method = RequestMethod.POST)
    @ResponseBody
    public BoardControlView setControl(

            @RequestParam(name = "title", required = true)
                String title,
            @RequestParam(name = "content", required = true)
                    String content

    ) {
        Map<String, String> types = Maps.newHashMap();

        types.put("TITLE", title);
        types.put("CONTENT", content);

       for (Map.Entry<String,String> entry : types.entrySet()){
           String type = entry.getKey();
           Board board1 = boardrepository.findByTitleAndContent(title, content);

           if (board1 != null){
               board1.setTitle(entry.getValue());
               board1.setContent(entry.getValue());

           }else{
               boardrepository.setControl(entry.getValue(), entry.getValue());
           }
       }

       return null;

    }

}


