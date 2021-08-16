package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String passWord = request.getParameter("password");

        request.getSession().setAttribute("userNameLogin", userName);
        Cookie cookie = new Cookie("userName", userName);
        Cookie cookiePass = new Cookie("passWord", passWord);
        cookie.setMaxAge(60);
        cookiePass.setMaxAge(60);
        response.addCookie(cookie);
        response.addCookie(cookiePass);

        response.sendRedirect("menu.jsp");
    }
}
