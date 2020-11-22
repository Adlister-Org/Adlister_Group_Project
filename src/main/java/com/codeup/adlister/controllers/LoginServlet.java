package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "controllers.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getSession().getAttribute("user") != null) {
//            String url = request.getRequestURL().toString();
//            response.sendRedirect(url);
            response.sendRedirect("/profile");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = DaoFactory.getUsersDao().findByUsername(username);

        ArrayList<String> errors = new ArrayList<>();
        // USERNAME
        if (username.isEmpty()) {
            errors.add("Username cannot be blank.");
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            return;
        } else if (user == null) {
            errors.add("Username does not exist");
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            return;
        }
        // PASSWORD
        boolean validAttempt = BCrypt.checkpw(password, user.getPassword());

        if (validAttempt) {
            request.getSession().setAttribute("user", user);
            if(request.getSession().getAttribute("url") == null) {
                response.sendRedirect("/ads");
            } else {
                String uri = request.getSession().getAttribute("url").toString();
                response.sendRedirect(uri);
            }
        } else {
            errors.add("Incorrect password");
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }
    }

}
