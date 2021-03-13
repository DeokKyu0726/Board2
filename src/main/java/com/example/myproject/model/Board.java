package com.example.myproject.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@Entity(name = "board")
public class Board {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int INX;

    @Column(name = "datetime")
    private Date datetime;

    @Column(name = "title")
    private String title ;

    @Column(name = "content")
    private String content;
}
