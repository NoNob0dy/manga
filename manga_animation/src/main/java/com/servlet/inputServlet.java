package com.servlet;

import com.bean.conSql;
import com.bean.getMangaParameters;
import com.bean.mangaData;
import com.bean.utfEncoding;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;


@WebServlet(name = "inputServlet", value = "/inputServlet")
public class inputServlet extends HttpServlet {
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
        conSql input = new conSql();
        getMangaParameters getFromRequest = new getMangaParameters();
        mangaData data = getFromRequest.getParameters(request);
        try {
            input.sqlConnect("manga");
            String sql = "insert into manga_data values(?, ?, ?, ?, ?, ?, '在售', ?, ?, ?)";
            PreparedStatement state = input.sqlState(sql);
            for (int cnt = 1, k = 0; cnt < 10; cnt++) {
                if (cnt == 1) {
                    state.setString(cnt, session.getAttribute("user").toString());
                } else if (cnt == 7) {
                    state.setString(cnt, session.getAttribute("picName").toString());
                } else if (cnt == 8) {
                    state.setInt(cnt, data.mnum);
                } else if (cnt == 9) {
                    state.setFloat(cnt, data.mprice);
                } else {
                    state.setString(cnt, data.val[k++]);
                }
            }
            input.sqlUpdate();
            input.sqlClose();
        } catch (Exception e) {
            e.printStackTrace();
        }
        out.print("<script type = 'text/javascript'>alert('漫画信息提交成功！');");
        out.print("location.href='./profile.jsp';</script>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
