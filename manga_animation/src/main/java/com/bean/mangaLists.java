package com.bean;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class mangaLists {
    public List<String> mnames = new ArrayList<>();
    public List<String> mauthors = new ArrayList<>();
    public List<String> mpublishs = new ArrayList<>();
    public List<Date> mdates = new ArrayList<>();
    public List<Float> mprices = new ArrayList<>();
    public void getdata(String user) {
        conSql change = new conSql();
        try {
            change.sqlConnect("manga");
            String sql = "select mname, mauthor, mpublish, mdate, mprice from manga_data where owner = ?";
            PreparedStatement statement = change.sqlState(sql);
            statement.setString(1, user);
            ResultSet res = change.sqlQuery();
            while (res.next()) {
                mnames.add(res.getString("mname"));
                mauthors.add(res.getString("mauthor"));
                mpublishs.add(res.getString("mpublish"));
                mdates.add(res.getDate("mdate"));
                mprices.add(res.getFloat("mprice"));
            }
            change.sqlClose();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
