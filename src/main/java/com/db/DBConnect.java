package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
    
    private static Connection conn = null;

    // Method to get a database connection
    public static Connection getConn() {
        if (conn == null) {
            try {
                // Load the MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                // Establish the connection
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook", "root", "");
            } 
            catch (ClassNotFoundException e) {
                e.printStackTrace();
                System.out.println("MySQL JDBC Driver not found.");
            }
            catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Failed to connect to the database.");
            }
        }
        return conn;
    }

    // Method to close the database connection
    public static void closeConn() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
                conn = null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error closing the database connection.");
        }
    }
}
