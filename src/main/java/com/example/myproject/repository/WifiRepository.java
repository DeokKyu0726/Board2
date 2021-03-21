package com.example.myproject.repository;



import com.example.myproject.model.Wifimodel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;

public interface WifiRepository extends JpaRepository<Wifimodel, Integer> {

   List<Wifimodel> findByINXIn(List<Integer> ids);


   Wifimodel findTopByOrderByINXDesc();

}
