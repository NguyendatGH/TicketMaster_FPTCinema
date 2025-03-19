
package Controller;

import DAO.Auth;
import modal.User;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
@MultipartConfig
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/auth/register.jsp";
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String password = request.getParameter("password");

       
        int role_id = 1;//dfault
        User u = new User(username, password, email, role_id);

        int user_id = Auth.CreateAccount(u);
        if (user_id != -1) {

            System.out.println("user_id"+ user_id);
            System.out.println("~~~~~Register successfully");
            response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        } else {
            System.out.println("error when create new user");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
