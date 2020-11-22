package com.codeup.adlister.models;

public class Category {
    private long id;
    private String title;
    private int checked;


    public Category(long id, String title){
        this.id = id;
        this.title = title;
    }

    public long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getChecked() {
        return this.checked;
    }

    public void setChecked(int num) {
        this.checked = num;
    }
}
