package com.example.myproject.model;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@Entity(name = "offices")
public class Test  {

    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    @Column(name = "officecode")
    private Long officecode;

    @Column(name = "city")
    private String city;

    @Column (name = "phone")
    private String phone;

    @Column (name = "addressline1")
    private String addressLine1;

    @Column (name = "addressline2")
    private String addressLine2;

    @Column (name = "state")
    private String state;

    @Column (name = "country")
    private String country;

    @Column (name = "postalcode")
    private String postalCode;

    @Column (name = "territory")
    private String territory;

}
