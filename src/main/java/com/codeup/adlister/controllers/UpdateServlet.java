package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateServlet", urlPatterns = "/update")
public class UpdateServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("adId"));
        request.setAttribute("ad", DaoFactory.getAdsDao().oneById(id));
        request.getRequestDispatcher("/WEB-INF/ads/update_ad.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long adId = Long.parseLong(request.getParameter("adId"));
        request.setAttribute("adId", DaoFactory.getAdsDao().oneById((int)adId));

        String title = request.getParameter("title");
        String description = request.getParameter("description");


        boolean inputHasErrors = title.isEmpty()
                || description.isEmpty()
                || description.length() > 255
                || title.length() > 50;

        if (inputHasErrors) {
            //request.setAttribute("redirect", redirect);
            response.sendRedirect("/profile");
            return;
        }

        DaoFactory.getAdsDao().updateAd(title, description, adId);
        response.sendRedirect("/profile");
    }
}
