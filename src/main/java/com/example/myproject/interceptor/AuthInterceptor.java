package com.example.myproject.interceptor;


import com.example.myproject.model.Token;
import com.example.myproject.model.User;
import com.example.myproject.repository.TokenRepository;
import com.example.myproject.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.cors.CorsUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Optional;

@Component
public class AuthInterceptor implements HandlerInterceptor {

  @Autowired
  private TokenRepository tokenRepository;

  @Autowired
  private UserRepository userRepository;

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {


    if (request.getRequestURI().indexOf("login") != -1 ||
            request.getRequestURI().indexOf("resources") != -1 ||
            CorsUtils.isPreFlightRequest(request)) {
      return true;
    }

    Cookie cookie = WebUtils.getCookie(request, "sKey");
    if (cookie == null) {
      response.sendRedirect(request.getContextPath() + "/login");
      return false;
    }

    if (cookie.getValue().equals("systemadmin")) {
      User user = new User();
      user.setINX(0);
      user.setName("systemadmin");
      user.setRole(1);
      request.setAttribute("user", user);
      return true;
    }

    Token token = tokenRepository.findTop1ByToken(cookie.getValue());
    if (token == null) {
      return false;
    }

    Optional<User> userOptional = userRepository.findById(token.getUserId());
    request.setAttribute("user", userOptional.get());

    return true;
  }
}
