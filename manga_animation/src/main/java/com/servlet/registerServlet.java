package com.servlet;

import com.bean.conSql;
import com.bean.ifAccountDuplicate;
import com.bean.utfEncoding;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;

@WebServlet(name = "registerServlet", value = "/registerServlet")
public class registerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        utfEncoding encoding = new utfEncoding();
        try {
            encoding.setUtf8(request, response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        PrintWriter out = response.getWriter();
        int age = Integer.parseInt(request.getParameter("age"));
        String nickname = request.getParameter("nickname"),
                account = request.getParameter("account"),
                pwd = request.getParameter("pwd1"),
                email = request.getParameter("email"),
                sex = request.getParameter("sex"),
                place = request.getParameter("place");
        ifAccountDuplicate obj = new ifAccountDuplicate();
        String alert = obj.ifDuplicate(account, email);
        conSql register = new conSql();
        if (alert.equals("none")) {
            try {
                register.sqlConnect("manga");
                String sql = "insert into user values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement state = register.sqlState(sql);
                state.setString(1, account);
                state.setString(2, nickname);
                state.setString(3, pwd);
                state.setString(4, sex);
                state.setString(5, place);
                state.setString(6, email);
                state.setString(7, "");
                state.setInt(8, age);
                state.setFloat(9, 0);
                register.sqlUpdate();
                register.sqlClose();
            } catch (Exception e) {
                e.printStackTrace();
            }
            out.print("<script type = 'text/javascript'>alert('注册成功！');");
            out.print("location.href='./login.jsp';</script>");
        } else {
            if (alert.equals("account")) {
                out.print("<script type = 'text/javascript'>alert('该账户已被注册！');");
                out.print("location.href='./register.jsp';</script>");
            }
            if (alert.equals("email")) {
                out.print("<script type = 'text/javascript'>alert('该邮箱已被注册！');");
                out.print("location.href='./register.jsp';</script>");
            }
            if (alert.equals("both")) {
                out.print("<script type = 'text/javascript'>alert('该账户和邮箱已被注册！');");
                out.print("location.href='./register.jsp';</script>");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
