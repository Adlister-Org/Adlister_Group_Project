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
import java.util.Calendar;
import java.util.List;

@WebServlet(name = "UpdateServlet", urlPatterns = "/update")
public class UpdateServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("adId"));
        List<Category> categories = DaoFactory.getAdsDao().allCategories();
        List<Category> selectedCategories = DaoFactory.getAdsDao().categoriesByAdId(id);

        for (Category cat : categories) {
            for (Category selCat : selectedCategories) {
                if (selCat.getId() == cat.getId()) {
                    cat.setChecked(1);
                }
            }
        }

        request.setAttribute("categories", categories);
        request.setAttribute("ad", DaoFactory.getAdsDao().oneById(id));
        request.setAttribute("current_cat", selectedCategories);

        request.getRequestDispatcher("/WEB-INF/ads/update_ad.jsp").forward(request, response);
        request.removeAttribute("current_cat");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long adId = Long.parseLong(request.getParameter("adId"));
        request.setAttribute("adId", DaoFactory.getAdsDao().oneById((int) adId));

        String title = request.getParameter("title");
        String description = request.getParameter("description");

        boolean inputHasErrors = title.isEmpty()
                || description.isEmpty()
                || description.length() > 255
                || title.length() > 50;

        if (inputHasErrors) {
            response.sendRedirect("/profile");
            return;
        }

        if (request.getParameterValues("cat-title") == null) {
            List<Category> other = DaoFactory.getAdsDao().categoryByName("Other");
            long id = 0;
            for (Category cat : other) {
                id = cat.getId();
            }
            DaoFactory.getAdsDao().deleteAdsCat(adId);
            DaoFactory.getAdsDao().insertAdsCat(adId, id);

        } else {
            String[] catSelected = request.getParameterValues("cat-title");
            List<String> list = Arrays.asList(catSelected);

            List<Long> aList = new ArrayList<>();
            for (String category_id : list) {
                aList.add(Long.parseLong(category_id));
            }

            DaoFactory.getAdsDao().deleteAdsCat(adId);

            for (long val_id : aList) {
                DaoFactory.getAdsDao().insertAdsCat(adId, val_id);
            }
        }

        DaoFactory.getAdsDao().updateAd(title, description, adId);
        response.sendRedirect("ad?id=" + adId);
    }
}
