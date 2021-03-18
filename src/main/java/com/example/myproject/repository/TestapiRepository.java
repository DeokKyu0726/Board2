package com.example.myproject.repository;

import com.example.myproject.model.Test;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TestapiRepository extends JpaRepository<Test, Integer> {

    Test findTop1ByOAndOfficecode(String officecode);

    List<Test> findByCityIn();




}
