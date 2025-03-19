package Controller;

import com.sendgrid.*;
import java.io.IOException;
import java.util.Random;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.ConfigLoader;

@WebServlet(name = "ForgotPasswordServlet", urlPatterns = {"/ForgotPasswordServlet"})
public class FogotPasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/auth/forgotPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        System.out.println("currentAction: " + action);
        if ("SendOTP".equals(action)) {
            String email = request.getParameter("email");
            String otp = generateOTP();

            session.setAttribute("otp", otp);
            session.setAttribute("email", email);
            boolean sent = sendEmail(email, otp);

            if (sent == true) {
                request.setAttribute("message", "OTP sent to " + email + "sucess");
                response.sendRedirect("auth/forgotPassword.jsp?step=otpModal");
            } else {
                request.setAttribute("error", "Failed to send OTP, try again");
                request.getRequestDispatcher("/auth/forgotPassword.jsp").forward(request, response);
            }

        } else if ("verifyOTP".equals(action)) {
            String userInput = request.getParameter("otp");
            String OTP = (String) session.getAttribute("otp");

            if (OTP != null && OTP.equals(userInput)) {
                request.setAttribute("message", "OTP verified successfully");
                session.removeAttribute("otp");
                response.sendRedirect("auth/forgotPassword.jsp?step=resetPasswordModal");

            } else {
                request.setAttribute("error", "Invalid OTP. Try again.");
                request.getRequestDispatcher("/auth/forgotPassword.jsp").forward(request, response);
            }

        } else if ("resetPassword".equals(action)) {
            String newPassword = request.getParameter("newPassword");
            String email = (String) session.getAttribute("email");

            if (email != null && newPassword != null && !newPassword.isEmpty()) {
                // TODO: Cập nhật mật khẩu trong database (Cần triển khai)
                session.removeAttribute("email");
                response.sendRedirect("auth/login.jsp?message=password_reset_success");
            } else {
                response.sendRedirect("auth/forgotPassword.jsp?step=resetPasswordModal&error=invalid_password");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String generateOTP() {
        Random random = new Random();
        return String.valueOf(100000 + random.nextInt(900000));
    }

    private boolean sendEmail(String recipientEmail, String otp) {
        String apiKey = ConfigLoader.getProperty("sendgrid.api.key");
        String verifiedEmail = "your emaiil";

        System.out.println("apikey " + apiKey);
        System.out.println("email sender: " + verifiedEmail);
        Email from = new Email(verifiedEmail);
        String subject = "Password Reset OTP";
        Email to = new Email(recipientEmail);
        Content content = new Content("text/plain", "Your OTP for password reset is: " + otp);
        Mail mail = new Mail(from, subject, to, content);

        SendGrid sg = new SendGrid(apiKey);
        Request request = new Request();
        try {
            request.setMethod(Method.POST);
            request.setEndpoint("mail/send");
            request.setBody(mail.build());
            Response response = sg.api(request);

            System.out.println("Response Status Code: " + response.getStatusCode());
            System.out.println("Response Body: " + response.getBody());

            return response.getStatusCode() == 202;
        } catch (IOException ex) {
            ex.printStackTrace();
            return false;
        }
    }
}
