package com.bean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ifAccountDuplicate {
    public String ifDuplicate(String account, String email) {
        String[] alert = {"account", "email", "both", "none"};
        int flag = 3, cnt = 0;
        conSql get = new conSql();
        try {
            get.sqlConnect("manga");
            String sql = "select account, email from user where account = ? or email = ?";
            PreparedStatement state = get.sqlState(sql);
            state.setString(1, account);
            state.setString(2, email);
            ResultSet res = get.sqlQuery();
            while (res.next()) {
                if (account.equals(res.getString(1))) {
                    flag = 0;
                    cnt++;
                }
                if (email.equals(res.getString(2))) {
                    flag = 1;
                    cnt++;
                }
            }
            get.sqlClose();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (cnt == 2) {
            return alert[cnt];
        } else {
            return alert[flag];
        }
    }
}
