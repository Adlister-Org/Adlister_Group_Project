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
        String confirmPassword = request.getParameter("confirm-password");


        boolean invalidPassword = !confirmPassword.equals(updatePassword);
        boolean emptyPassword = updatePassword.isEmpty();
        boolean invalidEmail = updateEmail.isEmpty() || !updateEmail.contains(".");

        if  (invalidEmail || invalidPassword){
            response.sendRedirect("/info");
            return;
        }

        if (!emptyPassword) {
            DaoFactory.getUsersDao().updateUserPassword(updatePassword, userID);
        }
        DaoFactory.getUsersDao().updateUserEmail(updateEmail, userID);
        response.sendRedirect("/logout");

    }

//    $2a$10$veBYkS3kkyXAmsg3GjSjzuRdfLUZdaeA6so111lBcIYBP.KwrCp3W



}
