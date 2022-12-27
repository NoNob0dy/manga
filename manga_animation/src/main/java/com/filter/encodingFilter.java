package com.filter;

import com.bean.utfEncoding;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import java.io.IOException;

@WebFilter(filterName = "encodingFilter")
public class encodingFilter extends HttpFilter implements Filter {
    public void init(FilterConfig initConfig) throws ServletException {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        utfEncoding encoding = new utfEncoding();
        try {
            encoding.setUtf8(request, response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        chain.doFilter(request, response);
    }

    public void destroy() {
    }
}