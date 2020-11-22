package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdServlet", urlPatterns = "/ad")
public class AdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        long id = Integer.parseInt(request.getParameter("id"));
        request.getSession().setAttribute("url", request.getRequestURI() + "?id=" + id);

        // Grab the creator(user) of the ad by user id that found by accessing the requested Ad
        Ad ad = DaoFactory.getAdsDao().oneById(id);
        request.setAttribute("userAd", DaoFactory.getUsersDao().findById(ad.getUserId()));

        request.setAttribute("ad", DaoFactory.getAdsDao().oneById(id));
        request.setAttribute("categories", DaoFactory.getAdsDao().categoriesByAdId(id));
        request.getRequestDispatcher("/WEB-INF/ads/ad.jsp").forward(request, response);

    }

}
