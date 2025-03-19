<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Đăng ký</title>
        <style>
/*            body {
                font-family: 'Segoe UI', Arial, sans-serif;
                background-color: #838383;
                color: #333;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                margin: 0;
            }*/
              .wrapper::-webkit-scrollbar {
                display: none;
            }


            .wrapper {
                background: #1A1D23;
                padding: 2rem;
                border-radius: 20px;
                box-shadow: 0 2px 15px rgba(0, 0, 0, 0.3);
                width: 90%;
                max-width: 480px;
                max-height: 90vh;
                position: relative;
                overflow-y: auto;
            }

            .wrapper-header {
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

            .form-group {
                display: flex;
                flex-direction: column;
                margin-bottom: 1.5rem;
            }

            .form-group label {
                color: #FFFFFF;
                font-weight: 500;
                margin-bottom: 0.5rem;
                font-size: 1rem;
            }

            .form-group input,
            .form-group select {
                padding: 0.75rem 1rem;
                border: 1px solid #3E434D;
                border-radius: 8px;
                font-size: 1rem;
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
                font-weight: 600;
                cursor: pointer;
                transition: background 0.3s, transform 0.3s;
            }

            .submit-btn:hover {
                background: #00B65D;
                transform: translateY(-2px);
            }

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
            <div class="wrapper-header">
                <img src="icons/fpt.png" alt="Company Logo" class="modal-icon">
                <h1>Đăng ký tài khoản</h1>
            </div>
            <div class="form-content">
                <form id="registerForm" action="${pageContext.request.contextPath}/RegisterServlet" method="post">
                    <div class="form-group">
                        <label>Họ và Tên</label>
                        <input type="text" name="username" placeholder="Nhập Họ và Tên" required />
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" name="email" placeholder="Nhập Email" required />
                    </div>
                    <div class="form-group">
                        <label>Số điện thoại</label>
                        <input type="tel" name="phone" placeholder="Nhập Số điện thoại" required />
                    </div>
                    <div class="form-group">
                        <div class="gender-group">
                            <label class="gender-option">
                                <input type="radio" name="gender" value="male" required /> Nam
                            </label>
                            <label class="gender-option">
                                <input type="radio" name="gender" value="female" /> Nữ
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Ngày sinh</label>
                        <input type="date" name="dob" required />
                    </div>
                    <div class="form-group">
                        <label>Mật khẩu</label>
                        <input type="password" id="password" name="password" placeholder="Nhập Mật khẩu" required />
                    </div>
                    <div class="form-group">
                        <label>Nhập lại mật khẩu</label>
                        <input type="password" id="confirmPassword" placeholder="Nhập lại Mật khẩu" required />
                        <div class="error" id="passwordError">Mật khẩu không khớp!</div>
                    </div>
                    <div class="terms">
                        <input type="checkbox" id="terms" required />
                        <label for="terms">Tôi đồng ý với điều khoản</label>
                    </div>
                    <button type="submit" class="submit-btn">Đăng Ký</button>
                </form>
                <div class="login-link">
                    Bạn đã có tài khoản? <a href="<%= request.getContextPath()%>/auth/login.jsp">Đăng nhập</a>
                </div>
                <button type="button" class="home-btn" onclick="goHome()">Quay lại Trang Chủ</button>
            </div>
        </div>

        <script>
            document.getElementById("registerForm").addEventListener("submit", function (event) {
                const password = document.getElementById("password").value;
                const confirmPassword = document.getElementById("confirmPassword").value;
                const passwordError = document.getElementById("passwordError");

                if (password !== confirmPassword) {
                    event.preventDefault();
                    passwordError.style.display = "block";
                } else {
                    passwordError.style.display = "none";
                }
            });

            function goHome() {
                window.location.href = "index.jsp";
            }
        </script>
    </body>
</html>
