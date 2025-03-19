/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.Auth;
import modal.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author rio
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/auth/login.jsp";
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Checking for auto-login...");

        String email = null;
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie c : cookies) {
                if ("user_email".equals(c.getName())) {
                    email = c.getValue();
                    break;
                }
            }
        }

        if (email != null) {
            try {
                User u = Auth.getUserByEmail(email);
                if (u != null) {
                    System.out.println("Auto-login user: " + u.getEmail());
                    response.sendRedirect(request.getContextPath() + "/HomeServlet");
                    return;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");
        boolean isChecked = "on".equals(rememberMe);
        User u = Auth.getUser(email, password);
        if (u == null) {
            request.setAttribute("errorMessage", "Invalid email or password");
            request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
        } else {
            System.out.println("User from DB: " + u);

            if (isChecked) {
                Cookie userCookie = new Cookie("user_email", email);
                userCookie.setMaxAge(7 * 24 * 60 * 60); 
                response.addCookie(userCookie);
            }

            response.sendRedirect(request.getContextPath() + "/HomeServlet");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
