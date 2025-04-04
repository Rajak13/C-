package controller;

import model.LoginAndRegister;
import model.LoginAndRegisterDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/loginregister")
public class LoginAndRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginAndRegisterDAO userDAO;

    public void init() {
        userDAO = new LoginAndRegisterDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "register":
                    registerUser(request, response);
                    break;
                case "login":
                    loginUser(request, response);
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/view/index.jsp");
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // ✅ Check if passwords match BEFORE inserting into DB
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/register.jsp");
            dispatcher.forward(request, response);
            return; // 🔴 Stop execution
        }

        LoginAndRegister newUser = new LoginAndRegister(username, email, password);
        boolean registered = userDAO.registerUser(newUser);

        if (registered) {
            response.sendRedirect(request.getContextPath() + "/view/login.jsp");
            return; // ✅ Stop execution
        } else {
            request.setAttribute("errorMessage", "Registration failed. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/register.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        LoginAndRegister user = userDAO.loginUser(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect(request.getContextPath() + "/view/userDetails.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid email or password. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/login.jsp");
            dispatcher.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
