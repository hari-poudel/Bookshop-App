package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
    public static Connection conn;

    public static Connection getConn() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookshope", "root", "SMith_$&@");
            //System.out.println("Success");
        } catch (Exception e) {
            e.printStackTrace();

        }
        return conn;
    }

    public static void setConn(Connection conn) {
        DBConnect.conn = conn;
    }
}

