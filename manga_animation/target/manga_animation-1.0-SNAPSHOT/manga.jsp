<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.bean.mangaData, java.sql.*, java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=yes"/>
    <title>漫画屋</title>
    <link rel="stylesheet" type="text/css" href="css/manga.css"/>
    <jsp:useBean id="lists" class="com.bean.mangaListsForShow"/>
    <%
        lists.getLists();
        String search = request.getParameter("search");
    %>
</head>
<body>
<div id="contain">
    <jsp:include page="head.jsp" flush="true"/>
    <%
        if (!lists.mnames.isEmpty()) {
            List<Integer> flag = new ArrayList<>();
            if (search.equals("")) {
                for (int i = 0; i < lists.mnames.size(); i++) {
                    flag.add(i);
                }
            } else {
                for (int i = 0; i < lists.mnames.size(); i++) {
    %>
    <script type="text/javascript">
        if ("[<%=search%>]".test(<%=lists.mnames.get(i)%>)) {
            <%flag.add(i);%>
        }
    </script>
    <%
            }
        }
        for (int i = 0; i < flag.size(); i++) {
    %>
    <table class="table table-bordered" id="manga">
        <div class="box">
            <a href="buy_detail.jsp?mname=<%=lists.mnames.get(flag.get(i))%>">
                <img src="img/<%=lists.mpicnames.get(flag.get(i))%>" alt=""/>
                <p class="re"><%=lists.mnames.get(flag.get(i))%>
                </p>
            </a>
            <div class="info">
                <p class="re">作者：<%=lists.mauthors.get(flag.get(i))%>
                </p>
                <p class="re">商家：<%=lists.owners.get(flag.get(i))%>
                </p>
                <span>价格：<%=lists.mprices.get(flag.get(i))%> 元</span>
            </div>
        </div>
        <%
                }
            } else out.print("<script>alert('当前无上架漫画')</script>");
        %>
    </table>
</div>
<script src="js/tail.js"></script>
</body>
</html>