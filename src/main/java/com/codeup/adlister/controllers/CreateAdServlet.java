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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/profile");
            return;
        }
        request.setAttribute("categories", DaoFactory.getAdsDao().allCategories());

        request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
            .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User sessionUser = (User) request.getSession().getAttribute("user");

        String[] catSelected = request.getParameterValues("cat-title");
        List<String> list = Arrays.asList(catSelected);
        List<Long> aList = new ArrayList<>();
        for (String category_id : list) {
            aList.add(Long.parseLong(category_id));
        }

        Ad ad = new Ad(
            sessionUser.getId(),
            request.getParameter("title"),
            request.getParameter("description")
        );


        long id = DaoFactory.getAdsDao().insert(ad);
        for(long val_id : aList) {
            DaoFactory.getAdsDao().insertAdsCat(id, val_id);
        }
        response.sendRedirect("/ads");
    }
}
