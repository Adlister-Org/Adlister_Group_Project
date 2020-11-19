package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "InfoServlet", urlPatterns = "/info")
public class InfoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        User sessionUser = (User) request.getSession().getAttribute("user");
//        request.setAttribute("user1", DaoFactory.getUsersDao().findByUsername(((User) request.getSession().getAttribute("user")).getUsername()));
        request.getRequestDispatcher("/WEB-INF/user/info.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}
