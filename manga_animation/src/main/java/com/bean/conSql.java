package com.bean;

import java.sql.*;

public class conSql {
    private Connection con = null;
    private PreparedStatement state = null;
    private ResultSet res = null;

    public void sqlClass() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Connection sqlConnect(String schemaName) {
        sqlClass();
        try {
            String url = "jdbc:mysql://localhost:3306/" + schemaName + "?serverTimezone=UTC";
            con = DriverManager.getConnection(url, "root", "747801");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }

    public PreparedStatement sqlState(String sql) {
        try {
            state = con.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return state;
    }

    public int sqlUpdate() {
        int num_row = 0;
        try {
            num_row = state.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return num_row;
    }

    public ResultSet sqlQuery() {
        try {
            res = state.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    public void sqlClose() {
        try {
            if (res != null) res.close();
            if (state != null) state.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
