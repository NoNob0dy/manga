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

@WebServlet(name = "loginServlet", value = "/loginServlet")
public class loginServlet extends HttpServlet {
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
        String user = request.getParameter("user"),
                pwd = request.getParameter("pwd");
        boolean flag = false;
        conSql login = new conSql();
        try {
            login.sqlConnect("manga");
            String sql = "select account, pwd, nickname, wallet from user where account = ? or email = ?";
            PreparedStatement state = login.sqlState(sql);
            state.setString(1, user);
            state.setString(2, user);
            ResultSet res = login.sqlQuery();
            if (res.next()) {
                if (pwd.equals(res.getString("pwd"))) {
                    flag = true;
                    session.setAttribute("user", res.getString("account"));
                    session.setAttribute("nickname", res.getString("nickname"));
                    session.setAttribute("wallet", res.getFloat("wallet"));
                }
            }
            login.sqlClose();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (flag) {
            response.sendRedirect("./index.jsp");
        } else {
            out.print("<script type = 'text/javascript'>alert('用户不存在或密码错误！');");
            out.print("window.history.go(-1);</script>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}


