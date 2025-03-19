<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quên Mật Khẩu</title>
        <style>
            body {
                background-color: #838383;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            .wrapper {
                background: #1A1D23;
                padding: 2rem;
                border-radius: 20px;
                box-shadow: 0 2px 15px rgba(0, 0, 0, 0.3);
                width: 90%;
                max-width: 480px;
                text-align: center;
                display: none;
            }
            .wrapper.active {
                display: block;
            }
            .wrapper-header h1 {
                color: #FFFFFF;
                font-size: 1.8rem;
            }
            .form-group {
                display: flex;
                flex-direction: column;
                margin-bottom: 1.5rem;
            }
            .form-group label {
                color: #FFFFFF;
                font-weight: 500;
                margin-bottom: 0.5rem;
            }
            .form-group input {
                padding: 0.75rem 1rem;
                border: 1px solid #3E434D;
                border-radius: 8px;
                background: #2A2E37;
                color: #FFFFFF;
            }
            .submit-btn {
                width: 100%;
                padding: 0.9rem 1rem;
                background: #00C968;
                color: #FFFFFF;
                border: none;
                border-radius: 8px;
                font-size: 1.1rem;
                cursor: pointer;
            }
            .error-message {
                color: red;
                font-size: 0.9rem;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>


        <div class="wrapper modal active" id="forgotPasswordModal">
            <div class="wrapper-header">
                <h1>Quên mật khẩu</h1>
            </div>
            <div class="form-content">
                <form id="forgetPassForm" action="${pageContext.request.contextPath}/ForgotPasswordServlet" method="post">
                    <input type="hidden" name="action" value="SendOTP">
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" name="email" placeholder="Nhập Email" required />
                        <p class="help-text">Chúng tôi sẽ gửi OTP vào email của bạn.</p>
                    </div>
                    <button type="submit" class="submit-btn">Gửi OTP</button>
                </form>
            </div>
        </div>

        <div class="wrapper modal" id="otpModal">
            <input type="hidden" name="action" value="verifyOTP">
            <div class="wrapper-header">
                <h1>Nhập mã OTP</h1>
            </div>
            <div class="form-content">
                <form id="otpForm" action="${pageContext.request.contextPath}/ForgotPasswordServlet" method="post">
                    <input type="hidden" name="action" value="verifyOTP">
                    <div class="form-group">
                        <label>Nhập mã OTP:</label>
                        <input type="text" name="otp" required>
                        <input type="hidden" name="email" value="${sessionScope.email}">
                    </div>
                    <button type="submit" class="submit-btn">Xác nhận</button>
                    <% if (request.getParameter("error") != null) { %>
                    <p class="error-message">Mã OTP không chính xác. Vui lòng thử lại!</p>
                    <% } %>
                </form>
            </div>
        </div>


        <div class="wrapper modal" id="resetPasswordModal">
            <div class="wrapper-header">
                <h1>Đặt lại mật khẩu</h1>
            </div>
            <div class="form-content">
                <form action="${pageContext.request.contextPath}/ForgotPasswordServlet" method="post">
                    <div class="form-group">
                        <input type="hidden" name="action" value="resetPassword">
                        <label>Mật khẩu mới:</label>
                        <input type="password" name="newPassword" required>
                        <input type="hidden" name="email" value="${sessionScope.email}">
                    </div>
                    <button type="submit" class="submit-btn">Đặt lại mật khẩu</button>
                </form>
            </div>
        </div>
    <c:if test="${not empty param.error}">
        <p style="color: red;">${param.error}</p>
    </c:if>

    <script>
        function showModal(modalId) {
            document.querySelectorAll('.modal').forEach(modal => modal.classList.remove('active'));
            document.getElementById(modalId).classList.add('active');
        }

        <% if (request.getParameter("step") != null) {%>
        showModal("<%= request.getParameter("step")%>");
        <% }%>
    </script>

</body>
</html>
