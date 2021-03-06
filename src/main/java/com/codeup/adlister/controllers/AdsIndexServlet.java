package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.AdsIndexServlet", urlPatterns = "/ads")
public class AdsIndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().setAttribute("url", request.getRequestURI());

        String search = request.getParameter("search");
        String filter = request.getParameter("filter");
        request.setAttribute("stickySearch", search);
        request.setAttribute("stickyFilter", filter);
        if (search == null && filter == null) {
            request.setAttribute("ads", DaoFactory.getAdsDao().all());
        } else if (filter == null) {
            request.setAttribute("ads", DaoFactory.getAdsDao().all(search));
        } else if(search == null && filter.equals("all")){
            request.setAttribute("ads", DaoFactory.getAdsDao().all());
        } else {
            request.setAttribute("ads", DaoFactory.getAdsDao().adsByCategoryId(Long.parseLong(filter)));

        }

        request.setAttribute("categories", DaoFactory.getAdsDao().allCategories());
        request.getRequestDispatcher("/WEB-INF/ads/ads.jsp").forward(request, response);

    }
}
