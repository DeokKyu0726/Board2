package com.example.myproject.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@Entity(name = "wifi")
public class Wifimodel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int INX;

    @Column(name = "PLACE")
    private String place;

    @Column(name = "JEJU")
    private String jeju ;

    @Column(name = "JEJU_LOCATION")
    private String jeju_location;

    @Column(name = "PURPOSE")
    private String purpose;

    @Column(name = "SERVICE")
    private String service;

    @Column(name = "ROAD_LOCATTION")
    private String road_location;

    @Column(name = "ADDRESS")
    private String address;

    @Column(name = "NUMBER")
    private String number;

    @Column(name = "LATITUDE")
    private String lattiude;

    @Column(name = "LONGTITUDE")
    private String longtitude;


}
