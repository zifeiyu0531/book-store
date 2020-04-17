package bean;

import java.sql.*;

public class sql {
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String connStr = "jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC&characterEncoding=utf-8";
    private String username = "root";
    private String password = "root";
    private Connection conn = null;
    private Statement stmt = null;
    private ResultSet rs = null;
    private int rsInt = 0;

    public sql() {
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(connStr, username, password);
            stmt = conn.createStatement();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    public ResultSet executeQuery(String sqlStr) {
        rs = null;
        try {
            rs = stmt.executeQuery(sqlStr);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return rs;
    }

    public int executeUpdate(String s) {
        rsInt = 0;
        try {
            rsInt = stmt.executeUpdate(s);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return rsInt;
    }
}
