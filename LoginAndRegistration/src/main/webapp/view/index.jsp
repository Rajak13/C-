<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>My Bookstore</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cinzel+Decorative&family=Crimson+Text&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: rgba(61, 43, 31, 0.9);">
      <div class="container-fluid">
         <a class="navbar-brand" href="#">
             <img src="${pageContext.request.contextPath}/images/book-icon.png" class="book-icon" alt="Book Icon">
             My Bookstore
         </a>
         <div class="collapse navbar-collapse">
           <ul class="navbar-nav ms-auto">
             <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/view/login.jsp">Login</a>
             </li>
             <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/view/register.jsp">Register</a>
             </li>
           </ul>
         </div>
      </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <div class="book-themed-container text-center">
            <h1>Welcome to My Bookstore</h1>
            <p class="lead" style="color: var(--leather);">Discover Your Next Great Adventure</p>
            <div class="mt-4">
                <img src="${pageContext.request.contextPath}/images/bookshelf.png" alt="Bookshelf" class="img-fluid rounded-3" style="max-height: 300px;">
            </div>
            <div class="row mt-5">
                <div class="col-md-6">
                    <h3>New Releases</h3>
                    <p>Explore our latest arrivals</p>
                </div>
                <div class="col-md-6">
                    <h3>Classics</h3>
                    <p>Timeless stories for every reader</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>