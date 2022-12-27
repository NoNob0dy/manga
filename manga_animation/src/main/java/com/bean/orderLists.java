package com.bean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class orderLists {
    public List<String> buyers = new ArrayList<>();
    public List<String> salers = new ArrayList<>();
    public List<String> mnames = new ArrayList<>();
    public List<Date> otimes = new ArrayList<>();
    public List<Float> mprices = new ArrayList<>();

    public void getLists(String type, String name) {
        String sql;
        conSql manga = new conSql();
        PreparedStatement state;
        ResultSet res;
        try {
            manga.sqlConnect("manga");
            if(type.equals("buyer")) {
                sql = "select * from indent where buyer = ?";
                state = manga.sqlState(sql);
                state.setString(1, name);
                res = manga.sqlQuery();
                while (res.next()) {
                    salers.add(res.getString("saler"));
                    mnames.add(res.getString("mname"));
                    otimes.add(res.getDate("otime"));
                    mprices.add(res.getFloat("mprice"));
                }
            }
            else if(type.equals("saler")) {
                sql = "select buyer, mname, otime, mprice from indent where saler = ?";
                state = manga.sqlState(sql);
                state.setString(1, name);
                res = manga.sqlQuery();
                while (res.next()) {
                    buyers.add(res.getString("buyer"));
                    mnames.add(res.getString("mname"));
                    otimes.add(res.getDate("otime"));
                    mprices.add(res.getFloat("mprice"));
                }
            }
            manga.sqlClose();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
