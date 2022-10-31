package controllers;

import models.AnimEntity;
import models.AuthorEntity;
import models.GenreEntity;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utility.database.GetDataFromDB;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "MainPageServlet", urlPatterns = "")
public class MainPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<AnimEntity> anime;
        List<String> listForFilter;
        ServletContext servletContext = req.getServletContext();
        try {
            if (servletContext.getAttribute("finalList") != null) {
                anime = (List<AnimEntity>) servletContext.getAttribute("finalList");
            } else {
                anime = GetDataFromDB.getAnimTableData();
            }

            listForFilter = GetDataFromDB.getAnimTableData().stream().map(AnimEntity::getYear).distinct().collect(Collectors.toList());
            req.setAttribute("listForFilterYears", listForFilter);
            listForFilter = GetDataFromDB.getGenresTableData().stream().map(GenreEntity::getName).distinct().collect(Collectors.toList());
            req.setAttribute("listForFilterGenres", listForFilter);
            listForFilter = GetDataFromDB.getAnimTableData().stream().map(AnimEntity::getType).distinct().collect(Collectors.toList());
            req.setAttribute("listForFilterTypes", listForFilter);
            listForFilter = GetDataFromDB.getAnimTableData().stream().map(AnimEntity::getStatus).distinct().collect(Collectors.toList());
            req.setAttribute("listForFilterStatus", listForFilter);
            listForFilter = GetDataFromDB.getAuthorsTableData().stream().map(AuthorEntity::getName).distinct().collect(Collectors.toList());
            req.setAttribute("listForFilterAuthors", listForFilter);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        for (AnimEntity elem : anime) {
            req.getSession().setAttribute(String.valueOf(elem.getId()), elem);
        }
        req.setAttribute("animList", anime);
        req.getRequestDispatcher("/WEB-INF/views/main_page.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<AnimEntity> finalAnimeList = new ArrayList<>();
        try {
            List<AnimEntity> animeListTemplate = GetDataFromDB.getAnimTableData();
            if (!req.getParameter("selectedYear").equals("Выберите год")) {
                finalAnimeList = conditionAnimeList(req.getParameter("selectedYear"), "Year", animeListTemplate);
            }

            if (!req.getParameter("selectedGenre").equals("Выберите жанр")) {
                finalAnimeList = conditionAnimeList(req.getParameter("selectedGenre"), "Genre", animeListTemplate);
            }

            if (!req.getParameter("selectedType").equals("Выберите тип")) {
                finalAnimeList = conditionAnimeList(req.getParameter("selectedType"), "Type", animeListTemplate);
            }

            if (!req.getParameter("selectedStatus").equals("Выберите статус")) {
                finalAnimeList = conditionAnimeList(req.getParameter("selectedStatus"), "Status", animeListTemplate);
            }

            if (!req.getParameter("selectedAuthor").equals("Выберите создателя")) {
                finalAnimeList = conditionAnimeList(req.getParameter("selectedAuthor"), "Author", animeListTemplate);
            }
        } catch (SQLException | ClassNotFoundException | NoSuchMethodException | InvocationTargetException |
                 IllegalAccessException e) {
            e.printStackTrace();
        }
        if (finalAnimeList.size() > 0) {
            ServletContext servletContext = req.getServletContext();
            servletContext.setAttribute("finalList", finalAnimeList);
        }
        resp.sendRedirect("/");
    }

    public static List<AnimEntity> conditionAnimeList(String parameter, String type, List<AnimEntity> animeListTemplate) throws ClassNotFoundException, NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        List<AnimEntity> result = new ArrayList<>();
        List<String> parameters;
        String myParameter = Arrays.stream(parameter.split("\r")).toList().get(0);
        Class<?> animEntityClass = Class.forName("models.AnimEntity");
        String nameMethod = "get" + type;
        Method method = animEntityClass.getDeclaredMethod(nameMethod);

        for (int i = 0; i < animeListTemplate.size() || i == 0; i++) {
            if (type.equals("Genre")) {
                parameters = Arrays.stream(method.invoke(animeListTemplate.get(i)).toString().split(", ")).toList();
                for (int j = 0; j < parameters.size() || j == 0; j++) {
                    if (myParameter.equals(parameters.get(j))) {
                        result.add(animeListTemplate.get(i));
                    }
                }
            } else {
                if (method.invoke(animeListTemplate.get(i)).equals(myParameter)) {
                    result.add(animeListTemplate.get(i));
                }
            }
        }
        return result;
    }
}
