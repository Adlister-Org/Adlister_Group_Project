package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;
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
            request.getSession().setAttribute("url", request.getRequestURI());
            response.sendRedirect("/login");
            return;
        }
        request.setAttribute("categories", DaoFactory.getAdsDao().allCategories());

        request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, NullPointerException, ServletException {
        User sessionUser = (User) request.getSession().getAttribute("user");

        String imgCheck = request.getParameter("imgUrl");
        if (imgCheck.isEmpty()) {
            imgCheck = "https://i.ibb.co/XjBKjvF/ezgif-com-gif-maker.gif";
        }

        String title = request.getParameter("title");
        String description = request.getParameter("description");

        boolean inputHasErrors = false;
        ArrayList<String> errors = new ArrayList<>();

        if (title.isEmpty()) {
            inputHasErrors = true;
            errors.add("Title cannot be blank");
        }

        if (description.isEmpty()) {
            inputHasErrors = true;
            errors.add("Description cannot be blank");
        }

        if (description.length() > 255) {
            inputHasErrors = true;
            errors.add("Description too long. Exceeded 255 characters");
        }

        if (title.length() > 50) {
            inputHasErrors = true;
            errors.add("Title too long. Exceeded 50 characters");
        }

        if (inputHasErrors) {
            request.setAttribute("errors", errors);
            request.setAttribute("title", title);
            request.setAttribute("description", description);
            request.setAttribute("categories", DaoFactory.getAdsDao().allCategories());
            request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);
            return;
        }

        Ad ad = new Ad(
                sessionUser.getId(),
                request.getParameter("title"),
                request.getParameter("description"),
                imgCheck
        );

        long id = DaoFactory.getAdsDao().insert(ad);

        if (request.getParameterValues("cat-title") == null) {
            List<Category> other = DaoFactory.getAdsDao().categoryByName("Other");
            long otherId = 0;
            for (Category cat : other) {
                otherId = cat.getId();
            }
            DaoFactory.getAdsDao().insertAdsCat(id, otherId);

        } else {
            String[] catSelected = request.getParameterValues("cat-title");
            List<String> list = Arrays.asList(catSelected);

            List<Long> aList = new ArrayList<>();
            for (String category_id : list) {
                aList.add(Long.parseLong(category_id));
            }

            for (long val_id : aList) {
                DaoFactory.getAdsDao().insertAdsCat(id, val_id);
            }
        }

        response.sendRedirect("/ads");
    }
}
