package controllers;

import utility.database.GetDataFromDB;
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
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "Servlets.RegistrationServlet", urlPatterns = "/registration")
public class RegistrationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext servletContext = req.getServletContext();
        if (servletContext.getAttribute("flagUnic") != null) {
            req.setAttribute("flagUnic", servletContext.getAttribute("flagUnic"));
        }
        if (req.getSession().getAttribute("currentUser") != null) {
            req.getSession().setAttribute("currentUser", null);
            req.getSession().removeAttribute("currentUser");
        }
        req.getRequestDispatcher("/WEB-INF/views/registration_page.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Connection connection = PostgresConnectionProvider.getConnection();
        boolean flagUnic = true;
        boolean flagIsNotEmpty = false;
        try {
            if (req.getParameter("personLogin") != null && req.getParameter("personPassword") != null && !req.getParameter("personLogin").equals("") && !req.getParameter("personPassword").equals("")) {
                flagIsNotEmpty= true;
                List<UserEntity> userEntities = GetDataFromDB.getAllUsers();
                if (userEntities.size() > 0) {
                    for (UserEntity userEntity : userEntities) {
                        if (req.getParameter("personLogin").equals(userEntity.getLogin()) && BCrypt.passwordDecryptHash(req.getParameter("personPassword"), userEntity.getPassword())) {
                            flagUnic = false;
                        }
                    }
                }
                if (flagUnic) {
                    String sqlQuery = "INSERT INTO users (login, password, role) VALUES(?, ?, ?)";
                    PreparedStatement statement = connection.prepareStatement(sqlQuery);
                    statement.setString(1, req.getParameter("personLogin"));
                    statement.setString(2, BCrypt.passwordCryptHash(req.getParameter("personPassword")));
                    statement.setString(3, "default");
                    statement.execute();
                    String isRememberUser = req.getParameter("checkedToRememberUser");
                    if (isRememberUser != null) {
                        req.getSession().setAttribute("currentLogin", req.getParameter("personLogin"));
                        req.getSession().setAttribute("currentPassword", req.getParameter("personPassword"));
                        req.getSession().setAttribute("currentRole", "default");
                    }
                }
                ServletContext servletContext = req.getServletContext();
                servletContext.setAttribute("flagUnic", flagUnic);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if (flagUnic && flagIsNotEmpty) {
            resp.sendRedirect("/");
        } else {
            resp.sendRedirect("/authorization");
        }
    }
}
