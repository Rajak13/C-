<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.LoginAndRegister" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Details - My Bookstore</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cinzel+Decorative&family=Crimson+Text&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="book-themed-container">
            <h2 class="text-center mb-4">
                <img src="${pageContext.request.contextPath}/images/book-icon.png" class="book-icon" alt="Book Icon">
                Account Details
            </h2>
            
            <%
                LoginAndRegister user = (LoginAndRegister) session.getAttribute("user");
                if(user != null) {
            %>
            <div class="user-details-content" style="color: var(--leather);">
                <div class="list-group">
                    <div class="list-group-item" style="background-color: var(--parchment);">
                        <strong>ID:</strong> <%= user.getId() %>
                    </div>
                    <div class="list-group-item" style="background-color: var(--parchment);">
                        <strong>Username:</strong> <%= user.getUsername() %>
                    </div>
                    <div class="list-group-item" style="background-color: var(--parchment);">
                        <strong>Email:</strong> <%= user.getEmail() %>
                    </div>
                </div>
            </div>
            <%
                } else {
            %>
                <div class="alert alert-warning text-center" role="alert">
                    No user details available. Please log in.
                </div>
            <%
                }
            %>
            
            <div class="mt-4 text-center">
                <a href="${pageContext.request.contextPath}/view/index.jsp" 
                   class="btn btn-bookstore">
                    Back to Home
                </a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>