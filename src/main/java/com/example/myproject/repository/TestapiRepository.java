package com.example.myproject.repository;

import com.example.myproject.model.Test;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TestapiRepository extends JpaRepository<Test, Integer> {

    Test findTop1ByOAndOfficecode(String officecode);
}
