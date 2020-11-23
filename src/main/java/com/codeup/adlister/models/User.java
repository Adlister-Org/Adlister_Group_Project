package com.codeup.adlister.models;

import org.mindrot.jbcrypt.BCrypt;

public class User {
    private long id;
    private String username;
    private String email;
    private String password;
    private String image;

    //anything
    public User() {}

    //insert
    public User(String username, String email, String password, String image) {
        this.username = username;
        this.email = email;
        //        good example of encapsulation, sets pw as hashpw
        this.setPassword(password);
        this.image = image;
    }

    //select
    public User(long id, String username, String email, String password, String image) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.image = image;
    }


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImage() {
        return image;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = BCrypt.hashpw(password, BCrypt.gensalt());
    }
}
