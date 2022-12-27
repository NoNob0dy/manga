package com.servlet;

import com.bean.conSql;
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
import java.sql.ResultSet;

@WebServlet(name = "buyServlet", value = "/buyServlet")
public class buyServlet extends HttpServlet {
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
        int cnt = 0;
        boolean flag = false;
        String mname = request.getParameter("mname"),
                owner = request.getParameter("owner");
        float mprice = Float.parseFloat(request.getParameter("mprice")),
                wallet = Float.parseFloat(session.getAttribute("wallet").toString());
        if (!owner.equals(session.getAttribute("user"))) {
            if (wallet - mprice < 0) {
                out.print("<script type = 'text/javascript'>alert('账户余额不足！请充值后再购买');");
                out.print("window.history.go(-1);</script>");
            } else {
                conSql buy = new conSql();
                try {
                    buy.sqlConnect("manga");
                    String sql = "select mnum, mstate from manga_data where mname = ? and owner = ?";
                    PreparedStatement state = buy.sqlState(sql);
                    state.setString(1, mname);
                    state.setString(2, owner);
                    ResultSet res = buy.sqlQuery();
                    if (res.next()) {
                        cnt = res.getInt("mnum");
                        if (cnt != 0 && res.getString("mstate").equals("在售")) {
                            cnt--;
                            flag = true;
                        }
                    }
                    if (cnt != -1) {
                        sql = "update manga_data set mnum = ? where mname = ? and owner = ?";
                        state = buy.sqlState(sql);
                        state.setInt(1, cnt);
                        state.setString(2, mname);
                        state.setString(3, owner);
                        buy.sqlUpdate();
                        if (cnt == 0) {
                            sql = "update manga_data set mstate = '售罄' where mname = ? and owner = ?";
                            state = buy.sqlState(sql);
                            state.setString(1, mname);
                            state.setString(2, owner);
                            buy.sqlUpdate();
                        }
                    }
                    buy.sqlClose();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            if (flag) {
                walletServlet obj1 = new walletServlet();
                obj1.doGet(request, response);
                orderServlet obj2 = new orderServlet();
                obj2.doGet(request, response);
            } else {
                out.print("<script type = 'text/javascript'>alert('该商品已售罄或下架！');");
                out.print("location.href='./manga.jsp?search=';</script>");
            }
        } else {
            out.print("<script type = 'text/javascript'>alert('您不能购买自己的漫画！');");
            out.print("window.history.go(-1);</script>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
