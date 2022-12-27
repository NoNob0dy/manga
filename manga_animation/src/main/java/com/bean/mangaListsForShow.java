package com.bean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class mangaListsForShow {
    public List<String> owners = new ArrayList<>();
    public List<String> mnames = new ArrayList<>();
    public List<String> mauthors = new ArrayList<>();
    public List<String> mpicnames = new ArrayList<>();
    public List<Float> mprices = new ArrayList<>();

    public void getLists() {
        conSql manga = new conSql();
        try {
            manga.sqlConnect("manga");
            String sql = "select owner, mname, mauthor, mpicname, mprice from manga_data where mstate = '在售'";
            PreparedStatement state = manga.sqlState(sql);
            ResultSet res = manga.sqlQuery();
            while (res.next()) {
                owners.add(res.getString("owner"));
                mnames.add(res.getString("mname"));
                mauthors.add(res.getString("mauthor"));
                mpicnames.add(res.getString("mpicname"));
                mprices.add(res.getFloat("mprice"));
            }
            manga.sqlClose();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
