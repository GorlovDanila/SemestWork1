package controllers;

import utility.database.GetDataFromDB;
import utility.database.PostgresConnectionProvider;
import models.AnimEntity;
import models.AuthorEntity;
import models.UserEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;


@WebServlet(name = "AdminPageServlet", urlPatterns = "/admin")
public class AdminPageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<AuthorEntity> author = GetDataFromDB.getAuthorsTableData();
            req.setAttribute("authorList", author);
            List<AnimEntity> animes = GetDataFromDB.getAnimTableData();
            req.setAttribute("animList", animes);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (req.getSession().getAttribute("currentUser") != null) {
            UserEntity user = (UserEntity) req.getSession().getAttribute("currentUser");
            if (user.getRole().equals("default")) {
                resp.sendRedirect("/");
            } else {
                req.getRequestDispatcher("/WEB-INF/views/admin_page.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Connection connection = PostgresConnectionProvider.getConnection();
        String sqlQuery = "";
        PreparedStatement statement;
        try {
            List<AuthorEntity> authors = GetDataFromDB.getAuthorsTableData();
            List<AnimEntity> anims = GetDataFromDB.getAnimTableData();
            if (req.getParameter("nameNewAuthor") != null && !req.getParameter("nameNewAuthor").equals("") && req.getParameter("infoNewAuthor") != null && !req.getParameter("infoNewAuthor").equals("") && req.getParameter("titleNewAnime") != null && !req.getParameter("titleNewAnime").equals("") && req.getParameter("newAnimeGenre") != null && !req.getParameter("newAnimeGenre").equals("") && req.getParameter("yearNewAnime") != null && !req.getParameter("yearNewAnime").equals("") && req.getParameter("typeNewAnime") != null && !req.getParameter("typeNewAnime").equals("") && req.getParameter("statusNewAnime") != null && !req.getParameter("statusNewAnime").equals("")) {
                sqlQuery = "INSERT INTO authors(name, info) VALUES(?,?)";
                statement = connection.prepareStatement(sqlQuery);
                statement.setString(1, req.getParameter("nameNewAuthor"));
                statement.setString(2, req.getParameter("infoNewAuthor"));
                statement.execute();

                sqlQuery = "INSERT INTO animes(title, genre, author, type, status, year, link_to_image, link) VALUES(?,?,?,?,?,?,?,?)";
                statement = connection.prepareStatement(sqlQuery);
                statement.setString(1, req.getParameter("titleNewAnime"));
                statement.setString(2, req.getParameter("newAnimeGenre"));
                statement.setString(3, req.getParameter("nameNewAuthor"));
                statement.setString(4, req.getParameter("typeNewAnime"));
                statement.setString(5, req.getParameter("statusNewAnime"));
                statement.setString(6, req.getParameter("yearNewAnime"));
                statement.setString(7, "/resources/images/working.jpg");
                statement.setString(8, "/resources/videos/miku.mp4");
                statement.execute();
            }
            if (req.getParameter("nameDeleteAuthor") != null && !req.getParameter("nameDeleteAuthor").equals("Выберите имя автора для удаления") && req.getParameter("titleAnimeDelete") != null && !req.getParameter("titleAnimeDelete").equals("Выберите название аниме для удаления")) {
                long id_author_delete = 0;
                long id_anim_delete = 0;
                if (authors.size() > 0) {
                    for (AuthorEntity author : authors) {
                        if (author.getName().equals(req.getParameter("nameDeleteAuthor"))) {
                            id_author_delete = author.getId();
                            break;
                        }
                    }
                }
                sqlQuery = "DELETE FROM authors WHERE id = ?";
                statement = connection.prepareStatement(sqlQuery);
                statement.setLong(1, id_author_delete);
                statement.execute();
                if (anims.size() > 0) {
                    for (AnimEntity anim : anims) {
                        if (anim.getTitle().equals(req.getParameter("titleAnimeDelete"))) {
                            id_anim_delete = anim.getId();
                        }
                    }
                }
                sqlQuery = "DELETE FROM animes WHERE id = ?";
                statement = connection.prepareStatement(sqlQuery);
                statement.setLong(1, id_anim_delete);
                statement.execute();
            }
            if (req.getParameter("NameLastAuthor") != null && !req.getParameter("NameLastAuthor").equals("Выберите имя автора для изменения") && req.getParameter("NameNewAuthor") != null && !req.getParameter("NameNewAuthor").equals("") && req.getParameter("InfoLastAuthor") != null && !req.getParameter("InfoLastAuthor").equals("Выберите информацию об авторе для изменения") && req.getParameter("InfoNewAuthor") != null && !req.getParameter("InfoNewAuthor").equals("")) {
                long id_author_edit = 0;
                if (authors.size() > 0) {
                    for (AuthorEntity author : authors) {
                        if (author.getName().equals(req.getParameter("NameLastAuthor")) && author.getInfo().equals(req.getParameter("InfoLastAuthor"))) {
                            id_author_edit = author.getId();
                            break;
                        }
                    }
                    sqlQuery = "UPDATE authors SET name = ?, info = ? WHERE id = ?";
                    statement = connection.prepareStatement(sqlQuery);
                    statement.setString(1, req.getParameter("NameNewAuthor"));
                    statement.setString(2, req.getParameter("InfoNewAuthor"));
                    statement.setLong(3, id_author_edit);
                    statement.execute();

                    long id_anim_edit = 0;
                    if (anims.size() > 0) {
                        for (AnimEntity anim : anims) {
                            if (anim.getAuthor().equals(req.getParameter("NameLastAuthor"))) {
                                id_anim_edit = anim.getId();
                            }
                        }
                        sqlQuery = "UPDATE animes SET author = ? WHERE id = ?";
                        statement = connection.prepareStatement(sqlQuery);
                        statement.setString(1, req.getParameter("NameNewAuthor"));
                        statement.setLong(2, id_anim_edit);
                        statement.execute();
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("/admin");
    }

}
