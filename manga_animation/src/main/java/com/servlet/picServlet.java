package com.servlet;

import com.bean.utfEncoding;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet(name = "picServlet", value = "/picServlet")
@MultipartConfig
public class picServlet extends HttpServlet {

    String cd = null;
    String fileName = null;

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        utfEncoding encoding = new utfEncoding();
        try {
            encoding.setUtf8(request, response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        HttpSession session = request.getSession();
        String owner = session.getAttribute("user").toString();
        Part part = request.getPart("mpic");
        cd = part.getHeader("Content-Disposition");
        fileName = owner + cd.substring(cd.lastIndexOf("=") + 2, cd.length() - 1);
        session.setAttribute("picName", fileName);
        String filePath = "/data/wwwroot/default/manga/img";
        File saveDir = new File(filePath);
        part.write(filePath + "/" + fileName);
        inputServlet obj = new inputServlet();
        obj.doGet(request, response);
    }
}
