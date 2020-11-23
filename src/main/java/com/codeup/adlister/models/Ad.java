package com.codeup.adlister.models;

import java.util.List;

public class Ad {
    private long id;
    private long userId;
    private String title;
    private String description;
    private List<String> categories;
    private String image;

    public Ad(long userId, String title, String description, List<String> categories, String image) {
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.categories = categories;
        this.image = image;
    }

    public Ad(long id, long userId, String title, String description, String image) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.image = image;
    }
    // CreateAdServlet
    public Ad(long userId, String title, String description, String image) {
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.image = image;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<String> getCategories() {
        return categories;
    }

    public void setCategories(List<String> categories) {
        this.categories = categories;
    }


    public String getImage() {
        return this.image;
    }
}
