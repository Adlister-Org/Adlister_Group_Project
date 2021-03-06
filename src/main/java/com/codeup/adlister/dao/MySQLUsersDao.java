package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;
import com.mysql.cj.jdbc.Driver;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.*;

public class MySQLUsersDao implements Users {
    private Connection connection;

    public MySQLUsersDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUser(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }


    @Override
    public User findByUsername(String username) {
        String query = "SELECT * FROM users WHERE username = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, username);
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by username", e);
        }
    }

    @Override
    public User findByEmail(String email) {
        String query = "SELECT * FROM users WHERE email = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, email);
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by email", e);
        }
    }

    @Override
    public Long insert(User user) {
        String query = "INSERT INTO users(username, email, password, image) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getImage());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating new user", e);
        }
    }

    @Override
    public void updateUserEmail(String email, long id) {
        try {
            PreparedStatement stmt = connection.prepareStatement( "UPDATE users SET email = ? WHERE id = ?");
            stmt.setString(1, email);
            stmt.setLong(2, id);
            stmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException("Error editing email.", e);
        }

    }

    @Override
    public void updateUserPassword(String password, long id) {
        try {
            PreparedStatement stmt = connection.prepareStatement( "UPDATE users SET password = ? WHERE id = ?");
            stmt.setString(1, Password.hash(password));
            stmt.setLong(2, id);
            stmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException("Error editing Password.", e);
        }

    }

    private User extractUser(ResultSet rs) throws SQLException {
        if (! rs.next()) {
            return null;
        }
        return new User(
            rs.getLong("id"),
            rs.getString("username"),
            rs.getString("email"),
            rs.getString("password"),
            rs.getString("image")
        );
    }

    @Override
    public User findById(long id) {
        String query = String.format("SELECT * FROM users WHERE id = %d", id);
        try {
            Statement stmt = connection.createStatement();
            return extractUser(stmt.executeQuery(query));
        } catch (SQLException e) {
            throw new RuntimeException("Error finding user by id.", e);
        }
    }

}
