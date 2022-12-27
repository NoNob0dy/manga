package com.bean;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;

public class getMangaParameters {
    public mangaData getParameters(HttpServletRequest request) {
        int i = 0;
        mangaData data = new mangaData();
        Enumeration<String> names = request.getParameterNames();
        while (names.hasMoreElements()) {
            String name = names.nextElement(),
                    val = request.getParameter(name);
            if (name.equals("mnum")) data.mnum = Integer.parseInt(val);
            else if (name.equals("mprice")) data.mprice = Float.parseFloat(val);
            else data.val[i++] = val;
        }
        return data;
    }

}
