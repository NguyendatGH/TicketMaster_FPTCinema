<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: 'Segoe UI', Arial, sans-serif;
                background-color: #838383;
                color: #333;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                margin: 0;
            }

            .container {
                max-width: 450px;
                width: 100%;
                background: #ffffff;
                padding: 25px;
                border-radius: 12px;
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            }

            .wrapper::-webkit-scrollbar {
                display: none;
            }

            /* --- Modal Container --- */
            .wrapper {
                scrollbar-width: none;
                -ms-overflow-style: none;
                background: #1A1D23;        /* Dark background */
                padding: 2rem;
                border-radius: 20px;
                box-shadow: 0 2px 15px rgba(0, 0, 0, 0.3);
                width: 90%;
                max-width: 480px;          /* Narrower width for a neat look */
                max-height: 90vh;
                position: relative;
                overflow-y: auto;
            }

            /* --- Modal Header --- */
            .wrapper-header{
                text-align: center;
                margin-bottom: 1rem;
            }

            .modal-icon {
                width: 80px;
                height: 80px;
                margin: 0 auto 0.5rem;
                display: block;
                object-fit: contain;
            }

            .wrapper-header h1 {
                color: #FFFFFF;
                font-size: 1.8rem;
                margin: 0;
            }

            /* --- Form Content --- */
            .form-content {
                margin-top: 1rem;
            }

            /* --- Form Group: each label + input on its own line --- */
            .form-group {
                display: flex;
                flex-direction: column;
                margin-bottom: 1.5rem;
            }

            /* --- Labels --- */
            .form-group label {
                color: #FFFFFF;
                font-weight: 500;
                margin-bottom: 0.5rem;
                font-size: 1rem;
            }

            /* --- Inputs --- */
            .form-group input,
            .form-group select {
                padding: 0.75rem 1rem;
                border: 1px solid #3E434D;
                border-radius: 8px;
                font-size: 1rem;
                background: #2A2E37;
                color: #FFFFFF;
            }

            .form-group input::placeholder {
                color: #8D9197;
                font-size: 0.95rem;
            }

            .form-group input:focus {
                border-color: #4299e1;
                outline: none;
            }

            /* --- Radio Buttons (Nam/Nữ) --- */
            .gender-group {
                display: flex;
                gap: 1rem;
            }

            .gender-option {
                display: flex;
                align-items: center;
                gap: 0.4rem;
                font-size: 1rem;
                color: #FFFFFF;
            }

            /* --- Terms --- */
            .terms {
                display: flex;
                align-items: flex-start;
                color: #FFFFFF;
                gap: 0.5rem;
                margin-bottom: 1.5rem;
            }

            .terms input[type="checkbox"] {
                margin-top: 3px;
                width: 16px;
                height: 16px;
            }

            /* --- Submit Button --- */
            .submit-btn {
                width: 100%;
                padding: 0.9rem 1rem;
                background: #00C968; /* Bright green button */
                color: #FFFFFF;
                border: none;
                border-radius: 8px;
                font-size: 1.1rem;
                font-weight: 600;
                cursor: pointer;
                transition: background 0.3s, transform 0.3s;
            }

            .submit-btn:hover {
                background: #00B65D;
                transform: translateY(-2px);
            }

            /* --- Login Link --- */
            .login-link {
                color: #FFFFFF;
                text-align: center;
                margin-top: 1.5rem;
                font-size: 0.95rem;
            }

            .login-link a {
                color: #4299e1;
                text-decoration: none;
                font-weight: 600;
            }

            /* --- Error Message --- */
            .error {
                color: #e53e3e;
                font-size: 0.9rem;
                margin-top: 0.5rem;
                display: none;
            }

        </style>
    </head>
    <body>
        <div class="wrapper">
            <div class="modal">

                <div class="wrapper-header">
                    <img src="icons/fpt.png" alt="Company Logo" class="modal-icon">
                    <h1>Đăng nhập</h1>
                </div>
                <div class="form-content">
                    <form id="loginForm" action="${pageContext.request.contextPath}/LoginServlet" method="post">

                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" name="email" placeholder="Nhập Email" required />
                        </div>
                        <div class="form-group">
                            <label>Mật khẩu</label>
                            <input type="password" name="password" placeholder="Nhập Mật khẩu" required />
                        </div>
                        <div>
                            <input type="checkbox" name="rememberMe" id="rememberMe">
                            <label for="rememberMe" class="checkbox-label">Remember me</label>
                        </div>
                        <button type="submit" class="submit-btn">Đăng nhập</button>
                    </form>

                    <div class="register-link">
                        Bạn chưa có tài khoản? <a href="<%= request.getContextPath()%>/auth/register.jsp">Đăng ký ngay</a>
                    </div>
                    <div class="fogetPassword">
                        <a href="<%= request.getContextPath()%>/auth/forgetPassword.jsp"> Quên mật khẩu? </a>
                    </div>
                    <%
                        String errMessage = (String) request.getAttribute("errorMessage");
                        if (errMessage != null) {
                    %>
                    <p class="error"><%= errMessage%></p>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
