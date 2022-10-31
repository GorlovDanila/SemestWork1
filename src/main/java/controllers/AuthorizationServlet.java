package controllers;

import models.AnimEntity;
import utility.database.PostgresConnectionProvider;
import models.UserEntity;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utility.cryptography.BCrypt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Servlets.AuthorizationServlet", urlPatterns = "/authorization")
public class AuthorizationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext servletContext = req.getServletContext();
        if(servletContext.getAttribute("userIsExists") != null) {
            req.setAttribute("userIsExists", servletContext.getAttribute("userIsExists"));
        }
        req.getRequestDispatcher("/WEB-INF/views/authorization_page.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Connection connection = PostgresConnectionProvider.getConnection();
        boolean flagUserIsExists = false;
        UserEntity currentUser = new UserEntity();
        try {
            if (req.getParameter("personLogin") != null && req.getParameter("personPassword") != null && !req.getParameter("personLogin").equals("") && !req.getParameter("personPassword").equals("")) {
                List<UserEntity> users = new ArrayList<>();
                boolean flagPasswordTrue = false;
                boolean flagLoginTrue = false;
                String sqlQuery = "SELECT password, role FROM users WHERE login = ?";
                PreparedStatement statement = connection.prepareStatement(sqlQuery);
                statement.setString(1, req.getParameter("personLogin"));
                ResultSet resultSet = statement.executeQuery();
                currentUser.setLogin(req.getParameter("personLogin"));
                while (resultSet.next()) {
                    flagLoginTrue = true;
                    UserEntity user = new UserEntity();
                    user.setLogin(req.getParameter("personLogin"));
                    user.setPassword(resultSet.getString("password"));
                    user.setRole(resultSet.getString("role"));
                    users.add(user);
                }
                if (users.size() > 0) {
                    for (UserEntity user : users) {
                        if (BCrypt.passwordDecryptHash(req.getParameter("personPassword"), user.getPassword())) {
                            flagPasswordTrue = true;
                            currentUser.setRole(user.getRole());
                            currentUser.setPassword(req.getParameter("personPassword"));
                            currentUser.setListViewed(new ArrayList<AnimEntity>());

                            break;
                        }
                    }
                }
                if (flagLoginTrue && flagPasswordTrue) {
                    req.getSession().setAttribute("currentListViewed", currentUser.getListViewed());
                    req.getSession().setAttribute("currentLogin", req.getParameter("personLogin"));
                    req.getSession().setAttribute("currentPassword", req.getParameter("personPassword"));
                    req.getSession().setAttribute("currentRole", currentUser.getRole());
                    flagUserIsExists = true;
                }
                ServletContext servletContext = req.getServletContext();
                servletContext.setAttribute("userIsExists", flagUserIsExists);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);

        }
        if(flagUserIsExists && currentUser.getRole().equals("default")) {
            resp.sendRedirect("/");
        } else if(flagUserIsExists && currentUser.getRole().equals("admin")) {
            resp.sendRedirect("/admin");
        } else {
            resp.sendRedirect("/registration");
        }
    }
}
