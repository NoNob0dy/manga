package com.bean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class getMangaData {
    private conSql get = new conSql();
    private mangaData data = new mangaData();

    public mangaData get(String mname) {
        try {
            get.sqlConnect("manga");
            String sql = "select * from manga_data where mname = ?";
            PreparedStatement state = get.sqlState(sql);
            state.setString(1, mname);
            ResultSet res = get.sqlQuery();
            if (res.next()) {
                for (int cnt = 1, k = 0; cnt <= 10; cnt++) {
                    if (cnt == 9) {
                        data.mnum = res.getInt("mnum");
                    } else if (cnt == 10) {
                        data.mprice = res.getFloat("mprice");
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
