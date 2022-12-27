package com.servlet;

import com.bean.conSql;
import com.bean.ifAccountDuplicate;
import com.bean.utfEncoding;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;

@WebServlet(name = "orderServlet", value = "/orderServlet")
public class orderServlet extends HttpServlet {
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
        String mname = request.getParameter("mname"),
                owner = request.getParameter("owner");
        Float mprice = Float.parseFloat(request.getParameter("mprice"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(System.currentTimeMillis());
        System.out.println(formatter.format(date));
        conSql order = new conSql();
        try {
            order.sqlConnect("manga");
            String sql = "insert into indent values(?, ?, ?, ?, ?)";
            PreparedStatement state = order.sqlState(sql);
            state.setString(1, session.getAttribute("user").toString());
            state.setString(2, owner);
            state.setString(3, mname);
            state.setFloat(4, mprice);
            state.setDate(5, date);
            order.sqlUpdate();
            order.sqlClose();
        } catch (Exception e) {
            e.printStackTrace();
        }
        out.print("<script type = 'text/javascript'>alert('购买成功！');");
        out.print("location.href='./purchased.jsp';</script>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
