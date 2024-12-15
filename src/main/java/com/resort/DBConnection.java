package com.resort;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    // Database connection parameters
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";  // Replace with your Oracle DB URL
    private static final String USERNAME = "system";  // Replace with your Oracle DB username
    private static final String PASSWORD = "system";  // Replace with your Oracle DB password

    // Method to get a database connection
    public static Connection getConnection() throws SQLException {
        try {
            // Load the Oracle JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC Driver not found");
            e.printStackTrace();
            throw new SQLException("Unable to load JDBC driver.");
        }
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }

    // Main method to test the connection
    public static void main(String[] args) {
        try {
            Connection conn = DBConnection.getConnection();
            System.out.println("Connected to Oracle database successfully!");
            conn.close();
        } catch (SQLException e) {
            System.out.println("Failed to connect to Oracle database.");
            e.printStackTrace();
        }
    }
}