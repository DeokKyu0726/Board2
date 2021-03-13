package com.example.myproject.repository;


import com.example.myproject.model.Board;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;


public interface Boardrepository extends JpaRepository<Board, Integer> {


    Board findByTitleAndContent(String title, String content);

    @Modifying
    @Transactional
    @Query(value = "INSERT INTO board (title, content) VALUES (?1, ?2,)", nativeQuery=true)
    int setControl(String title, String content);



}
