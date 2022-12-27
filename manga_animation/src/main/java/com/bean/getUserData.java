package com.bean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class getUserData {
    private conSql get = new conSql();
    private userData data = new userData();

    public userData get(String user) {
        try {
            get.sqlConnect("manga");
            String sql = "select * from user where account = ?";
            PreparedStatement state = get.sqlState(sql);
            state.setString(1, user);
            ResultSet res = get.sqlQuery();
            if (res.next()) {
                for (int cnt = 1, k = 0; cnt <= 9; cnt++) {
                    if (cnt == 8) {
                        data.age = res.getInt("age");
                    } else if (cnt == 9) {
                        data.wallet = res.getFloat("wallet");
                    } else {
                        data.val[k++] = res.getString(cnt);
                    }
                }
            }
            get.sqlClose();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }
}
