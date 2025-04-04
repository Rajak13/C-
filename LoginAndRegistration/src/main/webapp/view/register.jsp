<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Register - My Bookstore</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cinzel+Decorative&family=Crimson+Text&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="book-themed-container">
            <h2 class="text-center mb-4">
                <img src="${pageContext.request.contextPath}/images/book-icon.png" class="book-icon" alt="Book Icon">
                Create Account
            </h2>
            
            <% 
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) { 
            %>
                <div class="alert alert-danger" role="alert"><%= errorMessage %></div>
            <% } %>

            <form action="${pageContext.request.contextPath}/loginregister" method="post" onsubmit="return validatePassword()">
                <input type="hidden" name="action" value="register">
                
                <div class="mb-3">
                    <label class="form-label">Username</label>
                    <input type="text" class="form-control" name="username" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-control" name="email" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                    <div class="password-strength" id="passwordStrength"></div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Confirm Password</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                    <div class="password-match-feedback" id="passwordMatch"></div>
                </div>

                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-bookstore">Register Now</button>
                </div>
            </form>

            <div class="mt-3 text-center">
                Already have an account? 
                <a href="${pageContext.request.contextPath}/view/login.jsp" class="text-decoration-none fw-bold" style="color: var(--leather);">Login here</a>
            </div>
        </div>
    </div>

    <script>
        function validatePassword() {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            if (password !== confirmPassword) {
                alert('Passwords do not match!');
                return false;
            }
            return true;
        }

        // Live password match check
        document.getElementById('confirmPassword').addEventListener('input', function(e) {
            const match = document.getElementById('password').value === e.target.value;
            document.getElementById('passwordMatch').textContent = match ? '✓ Passwords match' : '✗ Passwords do not match';
            document.getElementById('passwordMatch').style.color = match ? '#28a745' : '#dc3545';
        });
    </script>
</body>
</html>
