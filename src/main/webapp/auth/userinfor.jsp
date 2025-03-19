<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>User infor</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #1e2233;
            color: #fff;
        }

        .form-container {
            display: grid;
            gap: 30px;
            /* Tăng khoảng cách giữa các hàng */
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .form-row {
            display: flex;
            gap: 30px;
            /* Tăng khoảng cách giữa các cột */
        }

        .form-group {
            flex: 1;
            margin-bottom: 15px;
            /* Thêm khoảng cách dưới mỗi nhóm */
        }

        .form-label {
            color: #ccc;
            font-size: 0.9em;
            display: block;
            margin-bottom: 12px;
            /* Tăng khoảng cách giữa label và input */
        }

        .form-input {
            width: 100%;
            padding: 12px;
            /* Tăng padding bên trong input */
            background: #2E3548;
            border: 1px solid #fff;
            border-radius: 8px;
            color: #fff;
            font-size: 0.95em;
        }

        .gender-options {
            display: flex;
            gap: 25px;
            /* Tăng khoảng cách giữa các lựa chọn giới tính */
            margin-top: 12px;
        }

        .gender-label {
            color: #ccc;
            display: flex;
            align-items: center;
            gap: 8px;
            /* Tăng khoảng cách giữa radio button và text */
        }

        input[type="radio"] {
            accent-color: #ff5500;
            width: 16px;
            /* Tăng kích thước của radio button */
            height: 16px;
        }

        /* Container for the tab list */
        .tab-list {
            display: flex;
            justify-content: center;
            /* or space-between, depending on your layout */
            align-items: center;
            border-bottom: 1px solid #666;
            /* Single line under the tabs */
            margin-bottom: 20px;
            /* Spacing between the tabs and content */
        }

        /* Individual tabs */
        .tab-item {
            position: relative;
            padding: 15px 20px;
            color: #ccc;
            cursor: pointer;
            text-transform: none;
            /* Remove uppercase if any */
            font-weight: 500;
            transition: color 0.3s;
        }

        /* Space between tabs (optional if you want them spaced out) */
        .tab-item:not(:last-child) {
            margin-right: 60px;
        }

        /* Hover effect */
        .tab-item:hover {
            color: #ddd;
        }

        /* Active tab: text color changes to orange */
        .tab-item.active {
            color: #ff5500;
        }

        /* Optional: a small orange line under the active tab text */
        .tab-item.active::after {
            content: "";
            position: absolute;
            bottom: -1px;
            /* Just above the bottom border line */
            left: 50%;
            transform: translateX(-50%);
            width: 50%;
            height: 2px;
            background-color: #ff5500;
        }

        /* Tab content area */
        .tab-content {
            background-color: #3a3a3a;
            padding: 20px;
            margin-bottom: 50px;
            border-radius: 10px;

        }

        /* Hide all panels except the active one */
        .tab-panel {
            display: none;
        }

        .tab-panel.active {
            display: block;
        }
    </style>

</head>

<body style="background-color: #221F1F;">
    <div id="header"></div>
    <script type="module" src="registration-modal.js"></script>
    <script type="module" src="login-modal.js"></script>
    <script type="module" src="forget-pass-modal.js"></script>

    <registration-modal id="regModal"></registration-modal>
    <login-modal id="loginModal"></login-modal>
    <forget-pass-modal id="forgetPassModal"></forget-pass-modal>
    <section class="payment-container" style="margin-top: 30px;">
        <div class="tabs-wrapper" style="display: flex; gap: 20px;">
            <!-- Left Column: User Profile & Tab Menu (1/4 of the width) -->
            <div class="tab-menu" style="flex: 1;">
                <!-- User Profile Card -->
                <div class="user-card"
                    style="background: #3a3a3a; padding: 20px; border-radius: 10px; margin-bottom: 20px;">
                    <div style="display: flex; align-items: center; gap: 15px; margin-bottom: 20px;">
                        <img src="avatar-placeholder.png" alt="Avatar"
                            style="width: 60px; height: 60px; border-radius: 50%; border: 2px solid #ff5500;">
                        <h2 style="margin: 0; color: #fff;">Nguyên Sơn</h2>
                    </div>
                    <div style="background: #2a2a2a; padding: 15px; border-radius: 8px;">
                        <p style="margin: 0; color: #ccc;">Tổng chi tiêu 2025</p>
                        <h3 style="margin: 10px 0 0; color: #ff5500;">20.000.000đ</h3>
                    </div>
                </div>

            </div>

            <!-- Right Column: Tab Content (3/4 of the width) -->
            <div class="tab-content" style="flex: 3; background: #3a3a3a; padding: 20px; border-radius: 10px;">
                <div class="tab-list">
                    <div class="tab-item active" data-tab="transaction">Lịch Sử Giao Dịch</div>
                    <div class="tab-item" data-tab="personal">Thông Tin Cá Nhân</div>
                    <div class="tab-item" data-tab="notifications">Thông Báo</div>
                </div>
                <!-- Transaction History Content -->
                <div class="tab-panel" id="transaction" style="display: block;">
                    <h3 style="color: #ff5500; margin-top: 0;">Lịch sử giao dịch</h3>
                    <div class="transaction-list">
                        <div class="transaction-item" style="padding: 15px 0; border-bottom: 1px solid #444;">
                            <div style="display: flex; justify-content: space-between;">
                                <div>
                                    <div style="font-weight: bold; color: #fff;">Nhà đầu Nữ</div>
                                    <div style="color: #ccc; font-size: 0.9em;">
                                        <span>Ghế: 01.03</span> |
                                        <span>Phòng chiếu 1</span>
                                    </div>
                                </div>
                                <div style="color: #999; font-size: 0.9em;">
                                    25/02/2025 - 19:30
                                </div>
                            </div>
                        </div>
                        <!-- More transaction items can be added here -->
                    </div>
                </div>

                <!-- Personal Info Content -->
                <div class="tab-panel" id="personal" style="display: block;">
                    <div class="form-container">
                        <!-- Row 1 -->
                        <div class="form-row">
                            <div class="form-group">
                                <label class="form-label">Họ và Tên</label>
                                <input type="text" value="Nguyễn Hữu Sơn" disabled class="form-input">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Email</label>
                                <input type="email" value="nguyenhuuson86@gmail.com" disabled class="form-input">
                            </div>
                        </div>

                        <!-- Row 2 -->
                        <div class="form-row">
                            <div class="form-group">
                                <label class="form-label">Ngày Sinh</label>
                                <input type="text" value="15/12/2004" disabled class="form-input">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Số điện thoại</label>
                                <input type="tel" value="01241454512" disabled class="form-input">
                            </div>
                        </div>

                        <!-- Row 3 -->
                        <div class="form-row">
                            <div class="form-group">
                                <label class="form-label">Mật khẩu</label>
                                <input type="password" value="********" disabled class="form-input">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Giới tính</label>
                                <div class="gender-options">
                                    <label class="gender-label">
                                        <input type="radio" name="gender" checked disabled>
                                        Nam
                                    </label>
                                    <label class="gender-label">
                                        <input type="radio" name="gender" disabled>
                                        Nữ
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>

                <!-- Notifications Content -->
                <div class="tab-panel" id="notifications" style="display: none;">
                    <h3 style="color: #ff5500; margin-top: 0;">Thông báo</h3>
                    <div style="background: #2a2a2a; padding: 15px; border-radius: 8px;">
                        <p style="margin: 5px 0; color: #ccc;">Không có thông báo mới</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div id="footer"></div>

    <script>
        Promise.all([
            fetch('header.html').then(res => res.text()),
            fetch('footer.html').then(res => res.text())
        ]).then(([headerData, footerData]) => {
            const headerContainer = document.getElementById('header');
            headerContainer.innerHTML = headerData;

            document.getElementById('footer').innerHTML = footerData;

            // Gắn sự kiện cho modal
            document.getElementById('openRegisterModalBtn').addEventListener('click', () => {
                document.getElementById('regModal').open();
            });
            document.getElementById('openLoginModalBtn').addEventListener('click', () => {
                document.getElementById('loginModal').open();
            });
            document.getElementById('openForgetPassModalBtn').addEventListener('click', () => {
                document.getElementById('forgetPassModal').open();
            });

        }).catch(error => {
            console.error('Lỗi khi tải trang:', error);
        });
        const tabItems = document.querySelectorAll('.tab-item');
        const tabPanels = document.querySelectorAll('.tab-panel');

        tabItems.forEach(item => {
            item.addEventListener('click', function () {
                // Remove active class from all tab items
                tabItems.forEach(i => i.classList.remove('active'));
                // Hide all tab panels
                tabPanels.forEach(panel => panel.style.display = 'none');

                // Mark this tab as active and display its panel
                this.classList.add('active');
                const tabId = this.getAttribute('data-tab');
                document.getElementById(tabId).style.display = 'block';
            });
        });
    </script>
</body>

</html>