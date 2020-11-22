package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "userServlet", urlPatterns = "/user")
public class userServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String userId = request.getParameter("id");
            request.setAttribute("ads", DaoFactory.getAdsDao().getByUserId(Long.parseLong(userId)));
            request.setAttribute("userName", request.getParameter("userName"));
            request.getRequestDispatcher("/WEB-INF/user/user.jsp").forward(request, response);
    }
}
