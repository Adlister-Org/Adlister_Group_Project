package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdServlet", urlPatterns = "/ad")
public class AdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        int id = (int) request.getAttribute("id");
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("ad", DaoFactory.getAdsDao().oneById(id));
        request.getRequestDispatcher("/WEB-INF/ads/ad.jsp").forward(request, response);
    }





}
