package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();

    List<Ad> all(String param);
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    Ad oneById(long id);

    List<Ad> getByUserId(int id);

    void updateAd(String title, String description, long adId);

    void deleteAd(long id);

    public List<Category> allCategories();

    void insertAdsCat(long id, long val_id);

    List<Category> categoriesByAdId(long id);
}
