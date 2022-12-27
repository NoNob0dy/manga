package com.servlet;

import com.bean.conSql;
import com.bean.utfEncoding;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;

@WebServlet(name = "deleteServlet", value = "/deleteServlet")
public class deleteServlet extends javax.servlet.http.HttpServlet {
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
        conSql delete = new conSql();
        String mname = request.getParameter("mname"),
                user = session.getAttribute("user").toString();
        try {
            delete.sqlConnect("manga");
            PreparedStatement state = delete.sqlState("delete from manga_data where mname = ? and owner = ?");
            state.setString(1, mname);
            state.setString(2, user);
            delete.sqlUpdate();
            delete.sqlClose();
        } catch (Exception e) {
            e.printStackTrace();
        }
        out.print("<script type = 'text/javascript'>alert('漫画已下架！');");
        out.print("location.href='./delete.jsp';</script>");
    }

    @Override
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doGet(request, response);
    }
}

