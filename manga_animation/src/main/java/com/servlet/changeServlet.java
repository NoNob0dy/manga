package com.servlet;

import com.bean.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;


@WebServlet(name = "changeServlet", value = "/changeServlet")
public class changeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        utfEncoding encoding = new utfEncoding();
        try {
            encoding.setUtf8(request, response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        String mname = session.getAttribute("mname").toString(),
                user = session.getAttribute("user").toString();
        getMangaData obj_get = new getMangaData();
        mangaData origin_data = obj_get.get(mname);
        getMangaParameters getFromRequest = new getMangaParameters();
        mangaData after_data = getFromRequest.getParameters(request);//lack of mpicname and owner

        conSql change = new conSql();
        String[] col_names = {"mname", "mauthor", "mpublish", "mdate", "mtype", "mstate", "mnum", "mprice"};
        boolean flag = false;
        mangaLists obj = new mangaLists();
        obj.getdata(user);
        if (!origin_data.val[1].equals(after_data.val[0])) {
            for (int i = 0; i < obj.mnames.size(); i++) {
                if (after_data.val[0].equals(obj.mnames.get(i))) {
                    flag = true;
                    break;
                }
            }
        }
        if (!flag) {
            try {
                change.sqlConnect("manga");
                for (int cnt = 0; cnt < 8; cnt++) {
                    String sql = "update manga_data set " + col_names[cnt] + " = ? where mname = ? and owner = ?";
                    PreparedStatement state = change.sqlState(sql);
                    state.setString(3, user);
                    if (cnt == 0 && !origin_data.val[1].equals(after_data.val[0])) {
                        state.setString(1, after_data.val[0]);
                        state.setString(2, origin_data.val[1]);
                        change.sqlUpdate();
                    }
                    if (cnt != 0) {
                        state.setString(2, after_data.val[0]);
                        if (cnt == 6) {
                            if(origin_data.mnum != after_data.mnum) {
                                state.setInt(1, after_data.mnum);
                                change.sqlUpdate();
                            }
                        } else if (cnt == 7) {
                            if(origin_data.mprice != after_data.mprice) {
                                state.setFloat(1, after_data.mprice);
                                change.sqlUpdate();
                            }
                        } else if (!origin_data.val[cnt + 1].equals(after_data.val[cnt])) {
                            state.setString(1, after_data.val[cnt]);
                            change.sqlUpdate();
                        }
                    }
                }
                change.sqlClose();
            } catch (Exception e) {
                e.printStackTrace();
            }
            out.print("<script type = 'text/javascript'>alert('漫画信息更改成功！');");
            out.print("location.href='./change_manga.jsp';</script>");
        } else {
            out.print("<script type = 'text/javascript'>alert('您已上架过同名同卷漫画！请检查漫画名是否正确或更新对应漫画的信息');");
            out.print("window.history.go(-1);</script>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
