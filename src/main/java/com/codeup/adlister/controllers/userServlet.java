package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "userServlet", urlPatterns = "/user")
public class userServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String userId = request.getParameter("id");
            List<Ad> listToLoop =  (List<Ad>) DaoFactory.getAdsDao().getByUserId(Long.parseLong(userId));

            request.setAttribute("ads", listToLoop);
            request.setAttribute("userName", request.getParameter("userName"));
            request.getRequestDispatcher("/WEB-INF/user/user.jsp").forward(request, response);
    }
}
