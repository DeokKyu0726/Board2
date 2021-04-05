package com.example.myproject.repository;

import com.example.myproject.model.Token;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TokenRepository extends JpaRepository<Token, Integer> {
  Token findTop1ByToken(String token);
}
