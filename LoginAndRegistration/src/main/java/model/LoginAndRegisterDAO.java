package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginAndRegisterDAO {
    // Database connection settings
    private String jdbcURL = "jdbc:mysql://localhost:3306/bookstore_db";
    private String jdbcUsername = "root"; 
    private String jdbcPassword = ""; 

    // SQL queries
    private static final String INSERT_USER_SQL = "INSERT INTO users (username, email, password) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_EMAIL = "SELECT id, username, email, password FROM users WHERE email = ?;";

    // Get a connection to the database
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    // Register a new user
    public boolean registerUser(LoginAndRegister user) {
        boolean rowInserted = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword()); // Remember: hash your passwords in a real app!
            rowInserted = preparedStatement.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rowInserted;
    }

    // Login user by email and password (basic example)
    public LoginAndRegister loginUser(String email, String password) {
        LoginAndRegister user = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_EMAIL)) {
            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();

            // Check if user exists and verify password
            if (rs.next()) {
                String retrievedPassword = rs.getString("password");
                
                // In a real app, use proper password hashing comparison here
                if (retrievedPassword.equals(password)) {
                    int id = rs.getInt("id");
                    String username = rs.getString("username");
                    user = new LoginAndRegister(id, username, email, password);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
