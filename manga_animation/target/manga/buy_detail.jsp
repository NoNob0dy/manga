<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.bean.mangaData" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=yes"/>
    <title>漫画详情页</title>
    <link rel="stylesheet" type="text/css" href="css/manga.css"/>
    <jsp:useBean id="getMangaData" class="com.bean.getMangaData"/>
    <%
        String mname = request.getParameter("mname");
        mangaData data = getMangaData.get(mname);
    %>
</head>
<body>
<div id="contain">
    <jsp:include page="head.jsp" flush="true"/>
    <div id="content">
        <div id="img_l1"></div>
        <div id="title">
            <form class="buy" action="buyServlet" method="post">
                <div class="box" style="margin: 195px 20px">
                    <img src="img/<%=data.val[7]%>" alt=""/>
                </div>
                <div style="margin: 145px 15px; float: left">
                    <table class="center">
                        <tr>
                            <td colspan="2" style="text-align: center; padding-bottom: 10px">
                                <h3>漫画详情</h3>
                            </td>
                        <tr>
                        <tr>
                            <td>卖家:</td>
                            <td><%=data.val[0]%>
                            </td>
                        </tr>
                        <tr>
                            <td>系列名:</td>
                            <td><%=data.val[1]%>
                            </td>
                        </tr>
                        <tr>
                            <td>作者:</td>
                            <td><%=data.val[2]%>
                            </td>
                        </tr>
                        <tr>
                            <td>出版社名:</td>
                            <td><%=data.val[3]%>
                            </td>
                        </tr>
                        <tr>
                            <td>贩卖日:</td>
                            <td><%=data.val[4]%>
                            </td>
                        </tr>
                        <tr>
                            <td>分类:</td>
                            <td><%=data.val[5]%>
                            </td>
                        </tr>
                        <tr>
                            <td>数量:</td>
                            <td><%=data.mnum%> 本</td>
                        </tr>
                        <tr>
                            <td>价格:</td>
                            <td><%=data.mprice%> 元</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding: 10px 10px 10px 10px">
                                <input type="hidden" name="owner" value=<%=data.val[0]%>>
                                <input type="hidden" name="mname" value=<%=mname%>>
                                <input type="hidden" name="mprice" value=<%=data.mprice%>>
                                <input type="submit" value="购买" style="background-color: pink; border-radius: 10px; width: 45%"
                                       onclick="if(confirm('你确定要购买此商品吗？') <%session.setAttribute("mode", "buy");%>">
                                <input type="button" value="返回" style="background-color: pink; border-radius: 10px; width: 45%"
                                       onclick="history.back(-1)">
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
        <div id="img_r1"></div>
    </div>
</div>
<script src="js/tail.js"></script>
</body>
</html>
