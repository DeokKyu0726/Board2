package com.example.myproject.repository;


import com.example.myproject.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;

public interface UserRepository extends JpaRepository<User, Integer> {

  @Query(value = "SELECT * FROM users WHERE user_id=?1 AND password=password(?2) LIMIT 1", nativeQuery = true)
  User findByAuth(String userId, String password);

  @Modifying(clearAutomatically = true)
  @Transactional
  @Query(value = "INSERT INTO users(user_id, password, name, phone_number, email, role) VALUES(?1, password(?2), ?3, ?4, ?5, ?6)", nativeQuery = true)
  int createUser(String userId, String password, String name, String phoneNumber, String email, int role);

  @Modifying(clearAutomatically = true)
  @Transactional
  @Query(value = "UPDATE users SET password=password(?1), name=?2, phone_number=?3, email=?4, role=?5 WHERE INX=?6", nativeQuery = true)
  int updateUserWithPassword(String password, String name, String phoneNumber, String email, int role, int id);

  List<User> findByPhoneNumberIsNotNull();
}
