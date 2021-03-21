package com.example.myproject.view;


import com.example.myproject.model.Wifimodel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.commons.compress.utils.Lists;

import java.text.SimpleDateFormat;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class WifiView {

    private int id;
    private int inx;
    private String place;
    private String jeju;
    private String jeju_locattion;
    private String purpose;
    private String service;
    private String road_locattion;
    private String address;
    private String numbber;
    private String lattitude;
    private String longtitude;

    public static List<WifiView> convert(List<Wifimodel> objects){
        List<WifiView> results = Lists.newArrayList();

        for (Wifimodel wifimodel : objects){
            WifiView view = new WifiView();
            view.id = wifimodel.getINX();
            view.place = wifimodel.getPlace();
            view.jeju= String.valueOf(wifimodel.getJeju());
            view.jeju_locattion = String.valueOf(wifimodel.getJeju_location());
            view.purpose = String.valueOf(wifimodel.getPurpose());
            view.service = String.valueOf(wifimodel.getService());
            view.road_locattion = String.valueOf(wifimodel.getRoad_location());
            view.address = String.valueOf(wifimodel.getAddress());
            view.numbber = String.valueOf(wifimodel.getNumber());
            view.lattitude = String.valueOf(wifimodel.getLattiude());
            view.longtitude = String.valueOf(wifimodel.getLongtitude());

            results.add(view);
        }
        return results;
    }

    public static WifiView convert(Wifimodel obj){
        WifiView wifiView = new WifiView();

        wifiView.id = obj.getINX();
        wifiView.place = obj.getPlace();
        wifiView.jeju = obj.getJeju();
        wifiView.jeju_locattion = obj.getJeju_location();
        wifiView.purpose = obj.getPurpose();
        wifiView.service = obj.getService();
        wifiView.road_locattion = obj.getRoad_location();
        wifiView.address = obj.getAddress();
        wifiView.numbber = obj.getNumber();
        wifiView.lattitude = obj.getLattiude();
        wifiView.longtitude = obj.getLongtitude();


        return wifiView;
    }


}
