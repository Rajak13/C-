<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - My Bookstore</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cinzel+Decorative&family=Crimson+Text&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="book-themed-container">
            <h2 class="text-center mb-4">
                <img src="${pageContext.request.contextPath}/images/book-icon.png" class="book-icon" alt="Book Icon">
                Member Login
            </h2>
            
            <c:if test="${not empty errorMessage}">
                <div class="error-message">${errorMessage}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/loginregister" method="post">
                <input type="hidden" name="action" value="login" />
                
                <div class="mb-4">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                
                <div class="mb-4">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>

                <div class="d-grid gap-2 mt-4">
                    <button type="submit" class="btn btn-bookstore">Sign In</button>
                </div>
            </form>

            <div class="mt-4 text-center">
                <p class="mb-1" style="color: var(--leather);">New to our bookstore?</p>
                <a href="${pageContext.request.contextPath}/view/register.jsp" 
                   class="btn btn-outline-secondary" 
                   style="border-color: var(--leather); color: var(--leather);">
                    Create Account
                </a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>