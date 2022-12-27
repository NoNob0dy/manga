package com.servlet;

import com.bean.conSql;
import com.bean.utfEncoding;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "walletServlet", value = "/walletServlet")
public class walletServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        utfEncoding encoding = new utfEncoding();
        try {
            encoding.setUtf8(request, response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String mode = session.getAttribute("mode").toString(),
               user = session.getAttribute("user").toString();
        conSql wal = new conSql();
        PreparedStatement state;
        ResultSet res;
        try {
            String sql;
            wal.sqlConnect("manga");
            if (mode.equals("buy")) {
                String owner = request.getParameter("owner");
                float mprice = Float.parseFloat(request.getParameter("mprice")),
                      wallet = Float.parseFloat(session.getAttribute("wallet").toString()) - mprice;
                float saler_wallet = 0;
                sql = "select wallet from user where account = ?";
                state = wal.sqlState(sql);
                state.setString(1, owner);
                res = wal.sqlQuery();
                if (res.next()) {
                    saler_wallet = res.getFloat("wallet") + mprice;
                }
                sql = "update user set wallet = ? where account = ?";
                state = wal.sqlState(sql);
                state.setFloat(1, saler_wallet);
                state.setString(2, owner);
                wal.sqlUpdate();
                sql = "update user set wallet = ? where account = ?";
                state = wal.sqlState(sql);
                state.setFloat(1, wallet);
                state.setString(2, user);
                wal.sqlUpdate();
                wal.sqlClose();
                session.setAttribute("wallet", wallet);
            } else if (mode.equals("wallet")) {
                float wallet = Float.parseFloat(request.getParameter("money"));
                sql = "update user set wallet = ? where account = ?";
                state = wal.sqlState(sql);
                state.setFloat(1, wallet);
                state.setString(2, user);
                wal.sqlUpdate();
                wal.sqlClose();
                session.setAttribute("wallet", wallet);
                out.print("<script type = 'text/javascript'>alert('充值成功');");
                out.print("location.href='./profile.jsp';</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doGet(request, response);
    }
}
