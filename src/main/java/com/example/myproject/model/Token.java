package com.example.myproject.model;

import lombok.*;

import javax.persistence.*;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "tokens")
public class Token {
    @Id
    private int INX;

    @Column(name = "userId")
    private int userId;

    @Column(name = "token")
    private String token;
}
