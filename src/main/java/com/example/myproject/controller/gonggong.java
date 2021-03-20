package com.example.myproject.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

@RestController
public class gonggong {

    @GetMapping("/apitest")
    public String testhttp(){

        StringBuffer result = new StringBuffer();

        try{
            String urlstr ="https://open.jejudatahub.net/api/proxy/Dtb18ta1btbD1Da1a81aaDttab6tDabb/teot5ocr5t1t5t5_0_t55t5jop2r5j0t";

            URL url = new URL(urlstr);

            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setRequestMethod("GET");

            BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(),"UTF-8"));

            String returnLine;

            result.append("<xmp>");
            while ((returnLine = br.readLine()) !=null){
                result.append(returnLine+ "\n");
            }
            urlConnection.disconnect();

        }catch (Exception e){
            e.printStackTrace();
        }


        return result+"</xmp>";
    }
}
