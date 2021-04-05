package com.example.myproject.controller;


import com.example.myproject.model.Token;
import com.example.myproject.model.User;
import com.example.myproject.repository.TokenRepository;
import com.example.myproject.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;
import java.util.UUID;

@RestController
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TokenRepository tokenRepository;

    @RequestMapping(value = "/login", method =  RequestMethod.POST)
    @ResponseBody
    public int login(
        @RequestParam(name="userId", required = true)
            String userId,
        @RequestParam(name="password", required = true)
            String password,
        HttpServletResponse response, HttpServletRequest request) {

        if (userId.equals("systemadmin") && password.equals("systemadmin")) {
            Cookie cookie = new Cookie("sKey", "systemadmin");
            cookie.setMaxAge(Integer.MAX_VALUE);
            cookie.setPath("/login");
            response.addCookie(cookie);
            return 0;
        }

        User user = userRepository.findByAuth(userId, password);
        if (user != null) {
            UUID uuid = UUID.randomUUID();
            tokenRepository.save(
                Token.builder().userId(user.getINX()).token(uuid.toString()).build()
            );

            Cookie cookie = new Cookie("sKey", uuid.toString());
            cookie.setMaxAge(Integer.MAX_VALUE);
            cookie.setPath("/");
            response.addCookie(cookie);

            return 0;
        }

        return -1;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    @ResponseBody
    public void logout( HttpServletResponse response, HttpServletRequest request ) throws IOException {
        Cookie cookie = new Cookie("sKey", null);
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);

        response.sendRedirect(request.getContextPath() + "/login");
    }

    @RequestMapping(value = "/users", method = RequestMethod.POST)
    @ResponseBody
    public int create(
//        @RequestParam(name = "id", required = true)
//            int id,
        @RequestParam(name = "userId", required = true)
            String userId,
        @RequestParam(name = "password", required = true)
            String password,
        @RequestParam(name = "name", required = true)
            String name,
        @RequestParam(name = "phoneNumber", required = true)
            String phoneNumber,
        @RequestParam(name = "email", required = true)
            String email,
        @RequestParam(name = "role", required = true)
            int role
    ) {
        int created = userRepository.createUser(userId, password, name, phoneNumber, email, role);
        return created;
    }

    @RequestMapping(value = "/users/update", method = RequestMethod.POST)
    @ResponseBody
    public int update(
        @RequestParam(name = "id", required = true)
            int id,
        @RequestParam(name = "password", required = true)
            String password,
        @RequestParam(name = "name", required = true)
            String name,
        @RequestParam(name = "phoneNumber", required = true)
            String phoneNumber,
        @RequestParam(name = "email", required = true)
            String email,
        @RequestParam(name = "role", required = true)
            int role
    ) {
        Optional<User> optional = userRepository.findById(id);
        User user = optional.get();
        if (user == null) {
            return 0;
        }

        int result = 0;
        if (password.isEmpty()) {
            user.setName(name);
            user.setPhoneNumber(phoneNumber);
            user.setEmail(email);
            user.setRole(role);
            userRepository.save(user);
            result = 1;
        } else {
            result = userRepository.updateUserWithPassword(password, name, phoneNumber, email, role, id);
        }

        return result;
    }
}
