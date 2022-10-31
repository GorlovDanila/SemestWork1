package controllers;

import models.AnimEntity;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.UserEntity;

import java.io.IOException;

@WebServlet(name = "Servlets.AnimeServlet", urlPatterns = "/title")
public class AnimeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext servletContext = req.getServletContext();
        if(servletContext.getAttribute("myAnim") != null) {
            req.setAttribute("myAnimEntity", servletContext.getAttribute("myAnim"));
            UserEntity currentUser = (UserEntity) req.getSession().getAttribute("currentUser");
            if(currentUser.getListViewed().size() > 0) {
                boolean flagToUnic = true;
                AnimEntity currentAnim = (AnimEntity) servletContext.getAttribute("myAnim");
                for(int i = 0; i < currentUser.getListViewed().size(); i++) {
                    if (currentUser.getListViewed().get(i).getId() == currentAnim.getId()) {
                        flagToUnic = false;
                        break;
                    }
                }
                if(flagToUnic) {
                    currentUser.getListViewed().add((AnimEntity) servletContext.getAttribute("myAnim"));
                }
            } else {
                currentUser.getListViewed().add((AnimEntity) servletContext.getAttribute("myAnim"));
            }
        }
        req.getRequestDispatcher("/WEB-INF/views/anime_page.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String myAnimId = req.getParameter("myTitle");
        AnimEntity myAnim = (AnimEntity) req.getSession().getAttribute(myAnimId);
        req.getSession().removeAttribute(myAnimId);
        ServletContext servletContext = req.getServletContext();
        servletContext.setAttribute("myAnim", myAnim);
        resp.sendRedirect("/title");
    }
}
