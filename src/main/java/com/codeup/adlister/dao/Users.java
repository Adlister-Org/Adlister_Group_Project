package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.sql.SQLException;
import java.util.List;

public interface Users {
    User findByUsername(String username);
    Long insert(User user);
    User findByEmail(String email);
    void updateUserEmail(String email, long id);
    void updateUserPassword(String password, long id);
    User findById(long id);
}
