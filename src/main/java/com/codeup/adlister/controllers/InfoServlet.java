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
        request.getRequestDispatcher("/WEB-INF/user/info.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        long userID = Long.parseLong(request.getParameter("userId"));
        String updateEmail = request.getParameter("email");
        String updatePassword = request.getParameter("password");


        boolean invalidPassword = updatePassword.isEmpty();
        boolean invalidEmail = updateEmail.isEmpty();

        if  (invalidEmail){
            response.sendRedirect("/info");
            return;
        }

        if (invalidPassword) {
            DaoFactory.getUsersDao().updateUserEmail(updateEmail, userID);
        } else {
            DaoFactory.getUsersDao().updateUserPassword(updatePassword, userID);
        }
        response.sendRedirect("/logout");

    }

//    $2a$10$P64uBJT55Dm0BUIpp1WgluK7M54xKVLp5FHrxSmxTfA1uIxx48MlG


}
