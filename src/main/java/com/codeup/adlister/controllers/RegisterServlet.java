package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.MySQLUsersDao;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null){
            response.sendRedirect("/profile");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");


        // validate input
        boolean inputHasErrors = false;

        ArrayList<String> errors = new ArrayList<>();

        if (username.isEmpty()){
            inputHasErrors = true;
            String usernameEmpty = "You must enter a username";
            errors.add(usernameEmpty);
        } else {
            User user = DaoFactory.getUsersDao().findByUsername(username);
            if (user != null) {

               String usernameExists = "Username is already in use";
                errors.add(usernameExists);
                inputHasErrors = true;
            }
        }

        if (email.isEmpty()){
            inputHasErrors = true;
            String usernameEmpty = "You must enter an email";
            errors.add(usernameEmpty);
        } else {
            User user = DaoFactory.getUsersDao().findByEmail(email);
            if (user != null) {
                inputHasErrors = true;
                String emailExists = "Email is already in use";
                errors.add(emailExists);
            }
        }

        if (password.isEmpty()){
            inputHasErrors = true;
            String passwordEmpty = "You must enter a password";
            errors.add(passwordEmpty);
        } else if ((!password.equals(passwordConfirmation))){
            inputHasErrors = true;
            String passwordMismatch = "Password inputs must match";
            errors.add(passwordMismatch);
        }


        if (inputHasErrors) {
            request.setAttribute("errors", errors);
//            response.sendRedirect("/register");
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            return;
        }

        // create and save a new user
        User user = new User(username, email, password);
        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");
    }
}
