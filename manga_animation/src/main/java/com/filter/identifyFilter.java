package com.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter(filterName = "identityFilter")
public class identifyFilter implements Filter {

    public void init(FilterConfig fConfig) throws ServletException {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest rqs = (HttpServletRequest) request;
        HttpServletResponse rsp = (HttpServletResponse) response;
        HttpSession session = rqs.getSession();
        String passURL = rqs.getServletPath();
        PrintWriter out = rsp.getWriter();
        if (!(passURL.equals("/index.jsp") || passURL.equals("/login.jsp") || passURL.equals("/register.jsp") || passURL.equals("/loginServlet") || passURL.equals("/registerServlet"))) {
            if (session.getAttribute("user") == null) {
                out.print("<script type = 'text/javascript'>alert('请先登录！');");
                out.print("location.href='./login.jsp';</script>");
                return;
            }
        }
        chain.doFilter(request, response);
    }

    public void destroy() {
    }
}

