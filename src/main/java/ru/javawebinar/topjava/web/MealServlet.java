package ru.javawebinar.topjava.web;

import org.slf4j.Logger;
import ru.javawebinar.topjava.model.MealTo;
import ru.javawebinar.topjava.util.MealsUtil;
import ru.javawebinar.topjava.util.TimeUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import static org.slf4j.LoggerFactory.getLogger;

public class MealServlet extends HttpServlet {
    private static final Logger log = getLogger(UserServlet.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        log.debug("redirect to meals");

        List<MealTo> meals = MealsUtil.getMeals().stream()
                .map(meal -> MealsUtil.createTo(meal, meal.getCalories() > 500))
                .collect(Collectors.toList());

        request.setAttribute("meals", meals);
        request.setAttribute("formatter", TimeUtil.formatter);
        request.getRequestDispatcher("/meals.jsp").forward(request, response);
    }
}
