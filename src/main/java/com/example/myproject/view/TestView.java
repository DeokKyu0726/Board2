package com.example.myproject.view;

import com.example.myproject.model.Test;
import com.google.common.collect.Lists;

import java.util.List;

public class TestView {

    private String id;

    private String city;

    private String phone;

    private String addressLine1;

    private String addressLine2;

    private String state;

    private String country;

    private String postalCode;

    private String territory;




    public static TestView convert( Test test1){




        TestView testView = new TestView();

        testView.id = test1.getOfficecode();

        testView.city = test1.getCity();

        testView.phone = test1.getPhone();

        testView.addressLine1 = test1.getAddressLine1();

        testView.addressLine2 = test1.getAddressLine2();

        testView.state = test1.getState();

        testView.country = test1.getCountry();

        testView.postalCode = test1.getPostalCode();

        testView.territory = test1.getTerritory();




        return testView;
    }
}
