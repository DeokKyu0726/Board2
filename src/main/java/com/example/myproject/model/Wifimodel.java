package com.example.myproject.model;

import lombok.*;

import javax.persistence.*;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Wifimodel {

    private int INX;

    private String place;

    private String jeju ;

    private String jeju_location;

    private String purpose;

    private String service;

    private String road_location;

    private String address;

    private String number;

    private String lattiude;

    private String longtitude;


}
