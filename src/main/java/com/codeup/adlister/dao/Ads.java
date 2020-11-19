package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();

    List<Ad> all(String param);
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    Ad oneById(int id);

    List<Ad> getByUserId(int id);

    void updateAd(String title, String description, long adId);

    void deleteAd(long id);

}
